package net.nigne.yourtour.comm.review;

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
@RequestMapping(value="/comm/review")
public class ReviewController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewService")
	private AbstractService reviewService;
	
	@RequestMapping(value="/openBoardList.go")
    public ModelAndView openBoardList(CommandMap commandMap, HttpSession session) throws Exception{
    	ModelAndView mv = new ModelAndView("reviewList");
    	    	
    	if(session.getAttribute("session_m_email") != null)
    		mv.addObject("email", session.getAttribute("session_m_email").toString());
    	
    	return mv;
    }
	
	@RequestMapping(value="/selectBoardList.go")
    public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = reviewService.selectBoardList(commandMap.getMap());
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
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/community/comm_review/boardWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/insertBoard.go")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/comm/review/openBoardList.go");
		
		reviewService.insertBoard(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/openBoardDetail.go")
	public ModelAndView openBoardDetail(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("reviewDetail");
		
		if(session.getAttribute("session_m_email") != null)
    		mv.addObject("email", session.getAttribute("session_m_email").toString());
		
		Map<String,Object> map = reviewService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/openBoardUpdate.go")
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/community/comm_review/boardUpdate");
		
		Map<String,Object> map = reviewService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/updateBoard.go")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/comm/review/openBoardDetail.go");
		
		reviewService.updateBoard(commandMap.getMap(), request);
		
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	
	@RequestMapping(value="/deleteBoard.go")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/comm/review/openBoardList.go");
		
		reviewService.deleteBoard(commandMap.getMap());
		
		return mv;
	}
	
	// 댓글
	@RequestMapping(value="/selectCommentList.go")
	public ModelAndView selectCommentList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = reviewService.selectCommentList(commandMap.getMap());
		mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	// 댓글삽입
	@RequestMapping(value="/commentAdd.go")
	public ModelAndView commentAdd(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		reviewService.commentAdd(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/commentDelete.go")
	public ModelAndView commentDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		reviewService.commentDelete(commandMap.getMap());
		return mv;
	}
}
