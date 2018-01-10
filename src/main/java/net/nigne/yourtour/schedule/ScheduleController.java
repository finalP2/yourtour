package net.nigne.yourtour.schedule;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.nigne.yourtour.city.CityModel;
import net.nigne.yourtour.city.CityService;
import net.nigne.yourtour.main.Paging;


@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	ModelAndView mav = new ModelAndView();

	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	@Resource(name="cityService")
	private CityService cityService;
	
	private String pagingHtml;
	private Paging page;
	

		@RequestMapping("scheduleList.go")
		public ModelAndView scheduleList(HttpServletRequest request,ScheduleModel scheduleModel) throws Exception{

				List<ScheduleModel> scheduleList = scheduleService.scheduleList();
				mav.addObject("scheduleList", scheduleList);
				
				mav.setViewName("schedule/scheduleList");
			
			return mav;
		}
	
	@RequestMapping("scheduleWriteForm.go")
	public ModelAndView scheduleWriteForm(HttpServletRequest request, HttpSession session) throws Exception{
		
		
			mav.setViewName("schedule/scheduleWriteForm");
			return mav;
		
	}
	
	@RequestMapping("scheduleState.go")
	public ModelAndView scheduleState(HttpServletRequest request, ScheduleModel scheduleModel, ScheduleDayModel scheduleDayModel, HttpSession session) throws Exception{
        		
		scheduleModel.setEmail("csw");
		
		
		String date1 = scheduleModel.getStart_date();
	    String date2 = scheduleModel.getEnd_date();
	 
	    
        SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");

        Date FirstDate = format.parse(date1);
        Date SecondDate = format.parse(date2);

        long calDate = FirstDate.getTime() - SecondDate.getTime(); 

        long calDateDays = calDate / ( 24*60*60*1000); 
 
        calDateDays = Math.abs(calDateDays);
        


        scheduleModel.setPeriod((int) calDateDays+1);
    
        int period = scheduleModel.getPeriod();
        
		scheduleService.scheduleWrite(scheduleModel);
		
		
		
		
		scheduleModel = scheduleService.scheduleLastWrite("csw");
		scheduleDayModel.setSch_no(scheduleModel.getNo());
		
		for(int i=0; i<period ; i++) {
			scheduleDayModel.setDay(1+i);
			scheduleService.scheduleDayinsert(scheduleDayModel);
		}
		
		
		//List<StateModel> stateList = stateService.StateList();

	
		//mav.addObject("stateList",stateList);
		mav.addObject("sch", scheduleModel);
		mav.setViewName("schedule/scheduleState");
		
		return mav;
	}
	@RequestMapping("scheduleCity.go")
	public ModelAndView scheduleCity(HttpServletRequest request, ScheduleModel scheduleModel, HttpSession session) throws Exception{
		
		String country = request.getParameter("country");
		scheduleModel.setEmail("csw");
		scheduleModel.setNo(Integer.parseInt(request.getParameter("no")));
		
		scheduleModel = scheduleService.scheduleSelectOne(scheduleModel);
		
		List<CityModel> cityList = cityService.schCityList("프랑스");
		
	/*	if (request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			List<CityModel> citySearchList = cityService.citySearchList(country, keyword);
			mav.addObject("citySearchList",citySearchList);
		}*/
		
		mav.addObject("sch", scheduleModel);
		mav.addObject("cityList",cityList);
		mav.setViewName("schedule/scheduleCity");
		
		return mav;
	}
	
	
	@RequestMapping("scheduleDetail.go")
	public ModelAndView scheduleDetail(HttpServletRequest request, HttpSession session, ScheduleModel scheduleModel) throws Exception{
		scheduleModel.setNo(Integer.parseInt(request.getParameter("no")));
		scheduleModel = scheduleService.scheduleSelectOne(scheduleModel);
		String email = scheduleModel.getEmail();
		System.out.println("이메일= "+email);
		mav.addObject("sch", scheduleModel);
		mav.setViewName("schedule/scheduleDetail");
		
		return mav;
	}
	/*
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

		if(member==null){
			chk = 0;
			mav.addObject("chk", chk);
			mav.setViewName("schedule/emailExist");
			return mav;
	
		}else{
			chk = 1;
			mav.addObject("chk", chk);
			mav.setViewName("schedule/emailExist");
			return mav;
		}
	}
	

	@RequestMapping("scheduleDetail.go")
	public ModelAndView scheduleDetail0(HttpServletRequest request, HttpSession session){
	
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int s_cate = Integer.parseInt(request.getParameter("s_cate"));
		int zzim = 0;
		
		
			String m_email = (String)session.getAttribute("session_m_email");
			zzim = (Integer)(scheduleService.zzimCheck(m_email, s_no));
		}
		
			

		int s_count = 0;
		if(request.getParameter("s_count") != null){
			s_count = Integer.parseInt(request.getParameter("s_count"));
		}
		
	
		ScheduleModel scheduleModel = scheduleService.scheduleDetail(s_no);
		int areaCount = scheduleService.areaCount(s_no);
		int sch_commCount = scheduleService.sch_commCount(s_no);
		ScheduleModel s_idx = scheduleService.selectS_idx(s_no);
		ScheduleModel state_city = scheduleService.selectStateCity(s_no);
		
		
		if(s_cate == 0){
			
			if(s_count == 0){
				scheduleService.scheduleUpdateReadhit(s_no);
			}
			s_count = 1;
			
			
			List<ScheduleModel> schDetailDay = scheduleService.schDetail(s_no);
			mav.addObject("schDetailDay", schDetailDay);
			
			List<Object> dayList = new ArrayList<Object>();
			
			
			for(int i = 1; i <= schDetailDay.size(); i++){
				List<ScheduleModel> day = scheduleService.DayList(i, s_no);
				dayList.add(day);
			}
			mav.addObject("dayList", dayList);
			
		}
	
		else if(s_cate == 1){
			s_count = 1;
		}
		
		else if(s_cate == 2){
			List<SchCommentModel> schCommentList = scheduleService.sch_comList(s_no);
			s_count = 1;
			
			mav.addObject("schCommentList", schCommentList);
		}
		
		
		List<ScheduleModel> s_together = scheduleService.s_together(s_no);
		
		
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
	
	
	@RequestMapping("scheduleDelete.go")
	public String scheduleDelete(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		scheduleService.deleteSchedule(s_no);
		
		return "redirect:scheduleList.go?currentPage="+currentPage;
	}
	
	@RequestMapping("schComment.go")
	public String schComment(HttpServletRequest request, SchCommentModel schCommentModel){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		schCommentModel.setS_no(s_no);
		String m_email = request.getParameter("m_email");
		schCommentModel.setM_email(m_email);
		
		scheduleService.schComment(schCommentModel);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=2&s_count=1";
		
	}
	
	
	@RequestMapping("schCommentDelete.go")
	public String schCommentDelete(HttpServletRequest request){
		
		int s_co_no = Integer.parseInt(request.getParameter("s_co_no"));
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		scheduleService.schCommentDelete(s_co_no);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=2&s_count=1";
	}
	
	
	@RequestMapping("schZzim1.go")
	public String schZzim1(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		String m_email = (String)request.getParameter("m_email");
		
		scheduleService.schZzim1(s_no, m_email);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=0";
	}
	
	
	@RequestMapping("schZzim2.go")
	public String schZzim2(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		String m_email = (String)request.getParameter("m_email");
		
		scheduleService.schZzim2(s_no, m_email);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=0";
	}
	
	
	@RequestMapping("schDownload.go")
	public String schDownload(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		String m_email = (String)request.getParameter("m_email");
		String s_name = (String) request.getParameter("s_name");
		
	
		ScheduleModel scheduleModel = scheduleService.scheduleDetail(s_no);
		
		List<ScheduleModel> schDetailList = scheduleService.schDetailList(s_no);
		

		scheduleModel.setM_email(m_email);
		scheduleModel.setS_name(s_name);
		String subject = scheduleModel.getS_name();
		scheduleModel.setS_name("<>"+subject);
		
		
		System.out.println("ss_no : "+ss_no);
		
	
		scheduleService.schDownDetail(schDetailList, ss_no);
		
	
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=0";
		
		
	}*/


}
