package net.nigne.yourtour.schedule;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import net.nigne.yourtour.main.Paging;


@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	ModelAndView mav = new ModelAndView();

	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	
	private String pagingHtml;
	private Paging page;
	

		@RequestMapping("scheduleList.go")
		public ModelAndView scheduleList(HttpServletRequest request) throws Exception{

				List<ScheduleModel> scheduleList = scheduleService.scheduleList();
				mav.addObject("scheduleList", scheduleList);
				
				
		
				mav.setViewName("schedule/scheduleList");
			
			return mav;
		}
	
	@RequestMapping("scheduleWriteForm.go")
	public ModelAndView scheduleWriteForm(HttpServletRequest request, HttpSession session) throws Exception{
		
		
			mav.setViewName("scheduleWriteForm");
			return mav;
		
	}
	/*
	@RequestMapping("scheduleState.go")
	public ModelAndView scheduleState(HttpServletRequest request, ScheduleModel scheduleModel, HttpSession session) throws Exception{
        		
		scheduleModel.setM_email((String)session.getAttribute("session_m_email"));
		
		if(request.getParameter("s_no") == null && request.getParameter("keyword") == null){
			scheduleService.scheduleWrite(scheduleModel);
			
			if(request.getParameter("s_together") != ""){
				String together = request.getParameter("s_together");
				String[] toArr = together.split(" / ");
				for (int i = 0; i < toArr.length; i++) {
					scheduleService.scheduleShare(toArr[i]);
				}
			}
			
			scheduleModel = scheduleService.scheduleLastWrite((String)session.getAttribute("session_m_email"));
			
		}else if (request.getParameter("s_no") == null && request.getParameter("keyword") != null) {
			scheduleModel = scheduleService.scheduleLastWrite((String)session.getAttribute("session_m_email"));
			
			String keyword = request.getParameter("keyword");
			List<StateModel> stateSearchList = stateService.stateSearchList(keyword);
			mav.addObject("stateSearchList", stateSearchList);
			
		}else if (request.getParameter("s_no") != null && request.getParameter("keyword") == null) {
			scheduleModel.setS_no(Integer.parseInt(request.getParameter("s_no")));
			scheduleModel = scheduleService.scheduleWriteSelect(scheduleModel);
			
		}else if (request.getParameter("s_no") != null && request.getParameter("keyword") != null) {
			scheduleModel.setS_no(Integer.parseInt(request.getParameter("s_no")));
			scheduleModel = scheduleService.scheduleWriteSelect(scheduleModel);
			
			String keyword = request.getParameter("keyword");
			List<StateModel> stateSearchList = stateService.stateSearchList(keyword);
			mav.addObject("stateSearchList", stateSearchList);
		}
		
		List<StateModel> stateList = stateService.StateList();

		mav.addObject("sch", scheduleModel);
		mav.addObject("stateList",stateList);
		mav.setViewName("scheduleState");
		
		return mav;
	}
	

	@RequestMapping("scheduleArea.go")
	public ModelAndView scheduleArea(HttpServletRequest request, HttpSession session, ScheduleModel scheduleModel1, ScheduleModel scheduleModel2) throws Exception{
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		int s_idx = Integer.parseInt(request.getParameter("s_idx"));
		
		
		List<ScheduleModel> togetherList = scheduleService.togetherList(s_no);
		
		scheduleModel1.setS_no(s_no);
	
		scheduleModel1 = scheduleService.scheduleWriteSelect(scheduleModel1);
		
	
		List<AreaModel> areaList = areaService.markerAreaList(c_no, s_no, s_idx);
		
		scheduleModel2.setS_idx(Integer.parseInt(request.getParameter("s_idx")));
		scheduleModel2.setS_no(s_no);
		
	
		List<ScheduleModel> scheduleList = scheduleService.scheduleAreaList(scheduleModel2);

		if(request.getParameter("a_cate") != null){
			int a_cate = Integer.parseInt(request.getParameter("a_cate"));
			//占쏙옙커 占쏙옙占쏙옙 占쏙옙占쏙옙트
			List<AreaModel> areaCateList = areaService.markerAreaCateList(c_no, a_cate, s_no, s_idx);
			mav.addObject("areaCateList", areaCateList);
			
			List<AreaModel> schAreaCateList = areaService.schAreaCateList(c_no, a_cate);
			mav.addObject("schAreaList", schAreaCateList);
		}else{
			List<AreaModel> schAreaList = areaService.schAreaList(c_no);
			mav.addObject("schAreaList", schAreaList);
		}
		
		if(request.getParameter("searchKeyword")!=null){
			String searchKeyword = request.getParameter("searchKeyword");
			
			List<AreaModel> schAreaSearch = areaService.schAreaSearch(c_no, searchKeyword);
			mav.addObject("schAreaSearch",schAreaSearch);
		}

		mav.addObject("togetherList", togetherList);
		mav.addObject("scheduleList", scheduleList);
		mav.addObject("sch", scheduleModel1);
		mav.addObject("areaList",areaList);
		mav.setViewName("scheduleArea");
		
		return mav;
	}
	
	@RequestMapping("scheduleComplete.go")
	public ModelAndView scheduleComplete(HttpServletRequest request, ScheduleModel scheduleModel) throws Exception{
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		
		scheduleService.scheduleComplete(s_no);
		scheduleService.scheduleCompleteCount(s_no);
		
		mav.setViewName("schedule/scheduleComplete");
		
		return mav;
	}
	
	@RequestMapping("insertArea.go")
	public ModelAndView insertArea(HttpServletRequest request, ScheduleModel scheduleModel) throws Exception{
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int s_idx = Integer.parseInt(request.getParameter("s_idx"));
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		int state_no = Integer.parseInt(request.getParameter("state_no"));

		scheduleModel.setS_no(s_no);
		scheduleModel.setS_idx(s_idx);
		scheduleModel.setA_no(a_no);
		
		scheduleService.insertArea(scheduleModel);
		
		if(request.getParameter("a_cate")!=null){
			int a_cate = Integer.parseInt(request.getParameter("a_cate"));
			mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&a_cate="+a_cate+"&s_idx="+s_idx);
		}else{
			mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&s_idx="+s_idx);
		}
		
		return mav;
	}
	
	@RequestMapping("deleteArea.go")
	public ModelAndView deleteArea(HttpServletRequest request, ScheduleModel scheduleModel) throws Exception{
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int s_idx = Integer.parseInt(request.getParameter("s_idx"));
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		int state_no = Integer.parseInt(request.getParameter("state_no"));
		int s_detail_turn = Integer.parseInt(request.getParameter("s_detail_turn"));
		
		scheduleModel.setS_no(s_no);
		scheduleModel.setS_idx(s_idx);
		scheduleModel.setA_no(a_no);
		scheduleModel.setS_detail_turn(s_detail_turn);
		
		scheduleService.deleteArea(scheduleModel);
		
		if(request.getParameter("a_cate")!=null){
			int a_cate = Integer.parseInt(request.getParameter("a_cate"));
			mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&a_cate="+a_cate+"&s_idx="+s_idx);
		}else{
			mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&s_idx="+s_idx);
		}
		
		return mav;
	}
	
	@RequestMapping("scheduleCity.go")
	public ModelAndView scheduleCity(HttpServletRequest request, ScheduleModel scheduleModel, HttpSession session) throws Exception{
		
		int state_no = Integer.parseInt(request.getParameter("state_no"));
		
		scheduleModel.setM_email((String)session.getAttribute("session_m_email"));
		scheduleModel.setS_no(Integer.parseInt(request.getParameter("s_no")));
		
		scheduleModel = scheduleService.scheduleWriteSelect(scheduleModel);
		
		List<CityModel> cityList = cityService.stateCityList(state_no);
		
		if (request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			List<CityModel> citySearchList = cityService.citySearchList(state_no, keyword);
			mav.addObject("citySearchList",citySearchList);
		}
		
		mav.addObject("sch", scheduleModel);
		mav.addObject("cityList",cityList);
		mav.setViewName("scheduleCity");
		
		return mav;
	}
	
	//占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
		@RequestMapping("turnUp.go")
		public ModelAndView turnUp(HttpServletRequest request, ScheduleModel scheduleModel){
			
			int state_no = Integer.parseInt(request.getParameter("state_no"));
			int c_no = Integer.parseInt(request.getParameter("c_no"));
			int s_idx = Integer.parseInt(request.getParameter("s_idx"));
			
			scheduleModel.setS_no(Integer.parseInt(request.getParameter("s_no")));
			scheduleModel.setS_detail_turn(Integer.parseInt(request.getParameter("s_detail_turn")));
			scheduleModel.setS_idx(Integer.parseInt(request.getParameter("s_idx")));
			scheduleModel = scheduleService.selectNextTurn(scheduleModel);
			
			int turn = scheduleModel.getS_detail_turn();
			int s_detail_turn = Integer.parseInt(request.getParameter("s_detail_turn"));
			int s_no = Integer.parseInt(request.getParameter("s_no"));
			scheduleService.preTurnUp(turn, s_no, s_detail_turn, s_idx);
			
			int s_detail_no = scheduleModel.getS_detail_no();
			scheduleService.nextTurnDown(s_no, s_detail_turn, s_detail_no, s_idx);
			
			if(request.getParameter("a_cate")!=null){
				int a_cate = Integer.parseInt(request.getParameter("a_cate"));
				mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&a_cate="+a_cate+"&s_idx="+s_idx);
			}else{
				mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&s_idx="+s_idx);
			}
			
			return mav;
		}
		
		//占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
		@RequestMapping("turnDown.go")
		public ModelAndView turnDown(HttpServletRequest request, ScheduleModel scheduleModel){
			
			int state_no = Integer.parseInt(request.getParameter("state_no"));
			int c_no = Integer.parseInt(request.getParameter("c_no"));
			int s_idx = Integer.parseInt(request.getParameter("s_idx"));
			
			scheduleModel.setS_no(Integer.parseInt(request.getParameter("s_no")));
			scheduleModel.setS_detail_turn(Integer.parseInt(request.getParameter("s_detail_turn")));
			scheduleModel.setS_idx(Integer.parseInt(request.getParameter("s_idx")));
			scheduleModel = scheduleService.selectPreTurn(scheduleModel);
			
			int turn = scheduleModel.getS_detail_turn();
			int s_detail_turn = Integer.parseInt(request.getParameter("s_detail_turn"));
			int s_no = Integer.parseInt(request.getParameter("s_no"));
			scheduleService.preTurnUp(turn, s_no, s_detail_turn, s_idx);
			
			int s_detail_no = scheduleModel.getS_detail_no();
			scheduleService.nextTurnDown(s_no, s_detail_turn, s_detail_no, s_idx);
			
			if(request.getParameter("a_cate")!=null){
				int a_cate = Integer.parseInt(request.getParameter("a_cate"));
				mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&a_cate="+a_cate+"&s_idx="+s_idx);
			}else{
				mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&s_idx="+s_idx);
			}
			
			return mav;
		}
		
		//占쏙옙占쏙옙 占쌨몌옙
		@RequestMapping("writeMemo.go")
		public ModelAndView writeMemo(HttpServletRequest request, ScheduleModel scheduleModel){
			
			int state_no = Integer.parseInt(request.getParameter("state_no"));
			int c_no = Integer.parseInt(request.getParameter("c_no"));
			int s_idx = Integer.parseInt(request.getParameter("s_idx"));
			int s_no = Integer.parseInt(request.getParameter("s_no"));
			
			scheduleService.writeMemo(scheduleModel);
			
			if(request.getParameter("a_cate")!=null){
				int a_cate = Integer.parseInt(request.getParameter("a_cate"));
				mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&a_cate="+a_cate+"&s_idx="+s_idx);
			}else{
				mav.setViewName("redirect:scheduleArea.go?s_no="+s_no+"&state_no="+state_no+"&c_no="+c_no+"&s_idx="+s_idx);
			}
			
			return mav;
		}
	
	@RequestMapping("emailExist.go")
	public ModelAndView idCheck(HttpServletRequest request) throws Exception{
		int chk;	
		
		MemberModel member = new MemberModel();
		
		member = memberService.getEmailDuplChk(request.getParameter("emailExist"));
		
		//占쏙옙占싱듸옙 占쏙옙占쏙옙
		if(member==null){
			chk = 0;
			mav.addObject("chk", chk);
			mav.setViewName("schedule/emailExist");
			return mav;
		//占쏙옙占싱듸옙 占쏙옙占쏙옙
		}else{
			chk = 1;
			mav.addObject("chk", chk);
			mav.setViewName("schedule/emailExist");
			return mav;
		}
	}
	
	//占쏙옙占쏙옙占쌉쏙옙占쏙옙 占쏙옙 占쏢세븝옙占쏙옙
	@RequestMapping("scheduleDetail.go")
	public ModelAndView scheduleDetail0(HttpServletRequest request, HttpSession session){
	
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int s_cate = Integer.parseInt(request.getParameter("s_cate"));
		int zzim = 0;
		
		//占쏙옙占쏙옙占쏙옙 占쏙옙占쌩댐옙占쏙옙 占쏙옙占쌩댐옙占쏙옙 占쏙옙占쏙옙占쌍깍옙占쏙옙占쏙옙
		if(session.getAttribute("session_m_email") != null){
			String m_email = (String)session.getAttribute("session_m_email");
			zzim = (Integer)(scheduleService.zzimCheck(m_email, s_no));
		}
		
			
		//占쏙옙占쏙옙트占쏙옙占쏙옙 占쏢세븝옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙회占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占실달깍옙
		//占쏙옙占쏙옙카占쌓곤옙(占쏢세븝옙占쏙옙/占쏙옙占쏙옙표/占쌘몌옙트) 占싱듸옙占시울옙占쏙옙 占쏙옙회占쏙옙 占시띰옙占쏙옙 占십듸옙占쏙옙
		//s_count 占쏙옙 占쏙옙占쏙옙트占쏙옙 0 占싱곤옙, 1占싹뗰옙占쏙옙 占쏙옙회占쏙옙 占쏙옙占�
		int s_count = 0;
		if(request.getParameter("s_count") != null){
			s_count = Integer.parseInt(request.getParameter("s_count"));
		}
		
		//占쏙옙占쏙옙觀占�
		ScheduleModel scheduleModel = scheduleService.scheduleDetail(s_no);
		int areaCount = scheduleService.areaCount(s_no);
		int sch_commCount = scheduleService.sch_commCount(s_no);
		ScheduleModel s_idx = scheduleService.selectS_idx(s_no);
		ScheduleModel state_city = scheduleService.selectStateCity(s_no);
		
		//占쏢세븝옙占쏙옙 占싹띰옙
		if(s_cate == 0){
			//占쏙옙占쏙옙트->占쏢세븝옙占쏙옙 占싹띰옙 占쏙옙회占쏙옙 占시몌옙占쏙옙
			if(s_count == 0){
				scheduleService.scheduleUpdateReadhit(s_no);
			}
			s_count = 1;
			
			//占쏢세븝옙占쏙옙/Day
			List<ScheduleModel> schDetailDay = scheduleService.schDetail(s_no);
			mav.addObject("schDetailDay", schDetailDay);
			
			List<Object> dayList = new ArrayList<Object>();
			
			//占쏢세븝옙占쏙옙/Day占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙트
			for(int i = 1; i <= schDetailDay.size(); i++){
				List<ScheduleModel> day = scheduleService.DayList(i, s_no);
				dayList.add(day);
			}
			mav.addObject("dayList", dayList);
			
		}
		//占쏙옙占쏙옙표 占싹뗰옙
		else if(s_cate == 1){
			s_count = 1;
		}
		//占쌘몌옙트 占싹띰옙
		else if(s_cate == 2){
			List<SchCommentModel> schCommentList = scheduleService.sch_comList(s_no);
			s_count = 1;
			
			mav.addObject("schCommentList", schCommentList);
		}
		
		//占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 회占쏙옙占싱몌옙占쏙옙 占쏙옙占쏙옙트 占쌀뤄옙占쏙옙占쏙옙
		List<ScheduleModel> s_together = scheduleService.s_together(s_no);
		
		//占쏙옙占쏙옙占쏙옙 占쏙옙커占쏙옙 표占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙트 占쌀뤄옙占쏙옙占쏙옙
		List<ScheduleModel> mapList = scheduleService.mapList(s_no);
		
		mav.addObject("s_idx", s_idx);
		mav.addObject("state_city", state_city);
		mav.addObject("s_together", s_together);
		mav.addObject("mapList", mapList);
		mav.addObject("zzim", zzim);
		mav.addObject("scheduleModel", scheduleModel);
		mav.addObject("s_cate", s_cate);
		mav.addObject("sch_commCount", sch_commCount);
		mav.addObject("areaCount", areaCount);
		mav.addObject("s_count", s_count);
		mav.setViewName("scheduleDetail");
		
		return mav;
	}
	
	//占쏙옙占쏙옙占쌉쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占싹깍옙
	@RequestMapping("scheduleDelete.go")
	public String scheduleDelete(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		scheduleService.deleteSchedule(s_no);
		
		return "redirect:scheduleList.go?currentPage="+currentPage;
	}
	
	//占쏙옙占쏙옙占쌉쏙옙占쏙옙 占쌘몌옙트 占쏙옙占쏙옙
	@RequestMapping("schComment.go")
	public String schComment(HttpServletRequest request, SchCommentModel schCommentModel){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		schCommentModel.setS_no(s_no);
		String m_email = request.getParameter("m_email");
		schCommentModel.setM_email(m_email);
		
		scheduleService.schComment(schCommentModel);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=2&s_count=1";
		
	}
	
	//占쏙옙占쏙옙占쌉쏙옙占쏙옙 占쌘몌옙트 占쏙옙占쏙옙
	@RequestMapping("schCommentDelete.go")
	public String schCommentDelete(HttpServletRequest request){
		
		int s_co_no = Integer.parseInt(request.getParameter("s_co_no"));
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		scheduleService.schCommentDelete(s_co_no);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=2&s_count=1";
	}
	
	//占쏙옙占싹깍옙
	@RequestMapping("schZzim1.go")
	public String schZzim1(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		String m_email = (String)request.getParameter("m_email");
		
		scheduleService.schZzim1(s_no, m_email);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=0";
	}
	
	//占쏙옙 占싹깍옙 占쏙옙占쏙옙
	@RequestMapping("schZzim2.go")
	public String schZzim2(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		String m_email = (String)request.getParameter("m_email");
		
		scheduleService.schZzim2(s_no, m_email);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=0";
	}
	
	//占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
	@RequestMapping("schDownload.go")
	public String schDownload(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		String m_email = (String)request.getParameter("m_email");
		String s_name = (String) request.getParameter("s_name");
		
		//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쌀뤄옙占쏙옙占쏙옙
		ScheduleModel scheduleModel = scheduleService.scheduleDetail(s_no);
		//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹몌옙占쏙옙트 占쌀뤄옙占쏙옙占쏙옙
		List<ScheduleModel> schDetailList = scheduleService.schDetailList(s_no);
		
		//占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙(m_email 占쌕꿔서 insert 占싹깍옙)
		scheduleModel.setM_email(m_email);
		scheduleModel.setS_name(s_name);
		String subject = scheduleModel.getS_name();
		scheduleModel.setS_name("<占쏙옙크占쏙옙>"+subject);
		
		//sch占쏙옙占싱븝옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 s_no占쌨아울옙占쏙옙
		int ss_no = scheduleService.schDownload(scheduleModel);
		System.out.println("ss_no : "+ss_no);
		
		//占쏙옙占쏙옙 ss_no占쏙옙 占싼곤옙占쌍깍옙
		scheduleService.schDownDetail(schDetailList, ss_no);
		
		//占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 - 占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싼어가占쏙옙
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=0";
		
		
	}*/


}
