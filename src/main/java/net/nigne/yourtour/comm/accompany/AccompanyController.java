package net.nigne.yourtour.comm.accompany;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.nigne.yourtour.common.common.CommandMap;
import net.nigne.yourtour.comm.common.service.AbstractService;

@Controller
@RequestMapping(value="/comm/accompany")
public class AccompanyController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="accompanyService")
	private AbstractService accompanyService;
	
	@RequestMapping(value="/test.go")
    public ModelAndView test(CommandMap commandMap, HttpSession session) throws Exception{
    	ModelAndView mv = new ModelAndView("accompanyTest");
    	    	
    	if(session.getAttribute("session_m_email") != null)
    		mv.addObject("email", session.getAttribute("session_m_email").toString());
    	
    	return mv;
    }
	
	@RequestMapping(value="/openBoardList.go")
    public ModelAndView openBoardList(CommandMap commandMap, HttpSession session) throws Exception{
    	ModelAndView mv = new ModelAndView("accompanyList");
    	    	
    	if(session.getAttribute("session_m_email") != null)
    		mv.addObject("email", session.getAttribute("session_m_email").toString());
    	
    	return mv;
    }
	
	@RequestMapping(value="/selectBoardList.go")
    public ModelAndView selectBoardList(CommandMap commandMap, HttpSession session) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String, Object> map = commandMap.getMap();
    	if(session.getAttribute("session_m_email") != null ) {
    		String email = session.getAttribute("session_m_email").toString();
    	
	    	if(map.containsKey("MY_ARTICLE")){
				map.put("MY_ARTICLE", email);
	    	}
	    	if(map.containsKey("MY_ZZIM")){
				map.put("MY_ZZIM", email);
	    	}
    	}
    	List<Map<String,Object>> list = accompanyService.selectBoardList(map);
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/openBoardWrite.go")
	public ModelAndView openBoardWrite(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/community/comm_accompany/boardWrite");
		
		if(session.getAttribute("session_m_email") != null) {
    			mv.addObject("email", session.getAttribute("session_m_email").toString());
		}
		
		return mv;
	}
	
	@RequestMapping(value="/insertBoard.go")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/comm/accompany/openBoardList.go");
		
		accompanyService.insertBoard(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/openBoardDetail.go")
	public ModelAndView openBoardDetail(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("accompanyDetail");
		
		if(session.getAttribute("session_m_email") != null) {
    		mv.addObject("email", session.getAttribute("session_m_email").toString());
    		mv.addObject("nickname", session.getAttribute("session_m_nickname").toString());	
		}
		Map<String,Object> map = accompanyService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/openBoardUpdate.go")
	public ModelAndView openBoardUpdate(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/community/comm_accompany/boardUpdate");
		
		if(session.getAttribute("session_m_email") != null)
    			mv.addObject("email", session.getAttribute("session_m_email").toString());
		
		Map<String,Object> map = accompanyService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/updateBoard.go")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/comm/accompany/openBoardDetail.go");
		
		accompanyService.updateBoard(commandMap.getMap(), request);
		
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	
	@RequestMapping(value="/deleteBoard.go")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/comm/accompany/openBoardList.go");
		
		accompanyService.deleteBoard(commandMap.getMap());
		
		return mv;
	}
	
	// 댓글
	@RequestMapping(value="/selectCommentList.go")
	public ModelAndView selectCommentList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = accompanyService.selectCommentList(commandMap.getMap());
		mv.addObject("list", list);
	    	if(list.size() > 0){
	    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	    	}else{
	    		mv.addObject("TOTAL", 0);
	    	}
	    	
	    	if(commandMap.getMap().containsKey("ZZIMLIST")) {
	    		mv.addObject("zzimFlag", true);
	    	}else {
	    		mv.addObject("zzimFlag", false);
	    	}
    	return mv;
    }
	
	// 댓글삽입
	@RequestMapping(value="/commentAdd.go")
	public ModelAndView commentAdd(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		accompanyService.commentAdd(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/commentDelete.go")
	public ModelAndView commentDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		accompanyService.commentDelete(commandMap.getMap());
		return mv;
	}
}
