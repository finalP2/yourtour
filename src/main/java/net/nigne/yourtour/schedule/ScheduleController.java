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

/*import com.gokkiri.area.AreaModel;
import com.gokkiri.area.AreaService;
import com.gokkiri.city.CityModel;
import com.gokkiri.city.CityService;
import com.gokkiri.member.MemberModel;
import com.gokkiri.member.MemberService;
import com.gokkiri.state.StateModel;
import com.gokkiri.state.StateService;*/

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	ModelAndView mav = new ModelAndView();

	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	
/*	@Resource(name="stateService")
	private StateService stateService;
	
	@Resource(name="cityService")
	private CityService cityService;
	
	@Resource(name="areaService")
	private AreaService areaService;
	
	@Resource(name="memberService")
	private MemberService memberService;*/
	
	private String pagingHtml;
	private Paging page;
	
	//�����Խ��� �����
		//�����Խ��� ����Ʈ ����
		@RequestMapping("scheduleList.go")
		public ModelAndView scheduleList(HttpServletRequest request) throws Exception{
			
			String keyword = request.getParameter("keyword");
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			
			if(keyword != null){
				List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);
				
				int totalCount = scheduleList.size();
				
				page = new Paging("schedule/scheduleList",currentPage,totalCount, 20, 5, keyword);
				pagingHtml = page.getPagingHtml().toString();
				
				int lastCount = totalCount;
				
				if(page.getEndCount() < totalCount){
					lastCount = page.getEndCount() + 1;
				}
				
				scheduleList = scheduleList.subList(page.getStartCount(), lastCount);
				
				mav.addObject("scheduleList", scheduleList);
			}else{
				List<ScheduleModel> scheduleList = scheduleService.scheduleList();
				mav.addObject("scheduleList", scheduleList);
				
				int totalCount = scheduleList.size();
				
				page = new Paging("schedule/scheduleList",currentPage,totalCount, 20, 5, keyword);
				pagingHtml = page.getPagingHtml().toString();
				
				int lastCount = totalCount;
				
				if(page.getEndCount() < totalCount){
					lastCount = page.getEndCount() + 1;
				}
				
				scheduleList = scheduleList.subList(page.getStartCount(), lastCount);
				
				mav.addObject("scheduleList", scheduleList);
			}
			
			List<ScheduleModel> bestScheduleList = scheduleService.scheduleHitList();
			
			mav.addObject("bestScheduleList",bestScheduleList);
			mav.addObject("pagingHtml", pagingHtml);
			mav.setViewName("scheduleList");
			
			return mav;
		}
/*	
	@RequestMapping("scheduleWriteForm.go")
	public ModelAndView scheduleWriteForm(HttpServletRequest request, HttpSession session) throws Exception{
		
		if(session.getAttribute("session_m_email") == null){
			mav.setViewName("member/loginConfirm");
			return mav;
		}else{
			//�̿ϼ� ����Ʈ ��������
			List<ScheduleModel> scheduleIncompleteList = 
					scheduleService.scheduleIncompleteList((String)session.getAttribute("session_m_email"));
			mav.addObject("scheduleIncompleteList",scheduleIncompleteList);
			
			mav.setViewName("scheduleWriteForm");
			return mav;
		}
	}
	
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
		
		//�����ϴ� ģ�� ����Ʈ
		List<ScheduleModel> togetherList = scheduleService.togetherList(s_no);
		
		scheduleModel1.setS_no(s_no);
		//���� ��ȣ�� ���� ���̵�� �� �˻�
		scheduleModel1 = scheduleService.scheduleWriteSelect(scheduleModel1);
		
		//��Ŀ ����Ʈ
		List<AreaModel> areaList = areaService.markerAreaList(c_no, s_no, s_idx);
		
		scheduleModel2.setS_idx(Integer.parseInt(request.getParameter("s_idx")));
		scheduleModel2.setS_no(s_no);
		
		//���� ����Ʈ
		List<ScheduleModel> scheduleList = scheduleService.scheduleAreaList(scheduleModel2);

		if(request.getParameter("a_cate") != null){
			int a_cate = Integer.parseInt(request.getParameter("a_cate"));
			//��Ŀ ���� ����Ʈ
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
	
	//���� ���� ����
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
		
		//���� ���� ����
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
		
		//���� �޸�
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
		
		//���̵� ����
		if(member==null){
			chk = 0;
			mav.addObject("chk", chk);
			mav.setViewName("schedule/emailExist");
			return mav;
		//���̵� ����
		}else{
			chk = 1;
			mav.addObject("chk", chk);
			mav.setViewName("schedule/emailExist");
			return mav;
		}
	}
	
	//�����Խ��� �� �󼼺���
	@RequestMapping("scheduleDetail.go")
	public ModelAndView scheduleDetail0(HttpServletRequest request, HttpSession session){
	
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int s_cate = Integer.parseInt(request.getParameter("s_cate"));
		int zzim = 0;
		
		//������ ���ߴ��� ���ߴ��� �����ֱ�����
		if(session.getAttribute("session_m_email") != null){
			String m_email = (String)session.getAttribute("session_m_email");
			zzim = (Integer)(scheduleService.zzimCheck(m_email, s_no));
		}
		
			
		//����Ʈ���� �󼼺���� ������ ��ȸ�� �������� ���Ǵޱ�
		//����ī�װ�(�󼼺���/����ǥ/�ڸ�Ʈ) �̵��ÿ��� ��ȸ�� �ö��� �ʵ���
		//s_count �� ����Ʈ�� 0 �̰�, 1�ϋ��� ��ȸ�� ���
		int s_count = 0;
		if(request.getParameter("s_count") != null){
			s_count = Integer.parseInt(request.getParameter("s_count"));
		}
		
		//����κ�
		ScheduleModel scheduleModel = scheduleService.scheduleDetail(s_no);
		int areaCount = scheduleService.areaCount(s_no);
		int sch_commCount = scheduleService.sch_commCount(s_no);
		ScheduleModel s_idx = scheduleService.selectS_idx(s_no);
		ScheduleModel state_city = scheduleService.selectStateCity(s_no);
		
		//�󼼺��� �϶�
		if(s_cate == 0){
			//����Ʈ->�󼼺��� �϶� ��ȸ�� �ø���
			if(s_count == 0){
				scheduleService.scheduleUpdateReadhit(s_no);
			}
			s_count = 1;
			
			//�󼼺���/Day
			List<ScheduleModel> schDetailDay = scheduleService.schDetail(s_no);
			mav.addObject("schDetailDay", schDetailDay);
			
			List<Object> dayList = new ArrayList<Object>();
			
			//�󼼺���/Day�� ��������Ʈ
			for(int i = 1; i <= schDetailDay.size(); i++){
				List<ScheduleModel> day = scheduleService.DayList(i, s_no);
				dayList.add(day);
			}
			mav.addObject("dayList", dayList);
			
		}
		//����ǥ �ϋ�
		else if(s_cate == 1){
			s_count = 1;
		}
		//�ڸ�Ʈ �϶�
		else if(s_cate == 2){
			List<SchCommentModel> schCommentList = scheduleService.sch_comList(s_no);
			s_count = 1;
			
			mav.addObject("schCommentList", schCommentList);
		}
		
		//���� �������� ȸ���̸��� ����Ʈ �ҷ�����
		List<ScheduleModel> s_together = scheduleService.s_together(s_no);
		
		//������ ��Ŀ�� ǥ���� ������ ����Ʈ �ҷ�����
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
	
	//�����Խ��� �� �����ϱ�
	@RequestMapping("scheduleDelete.go")
	public String scheduleDelete(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		scheduleService.deleteSchedule(s_no);
		
		return "redirect:scheduleList.go?currentPage="+currentPage;
	}
	
	//�����Խ��� �ڸ�Ʈ ����
	@RequestMapping("schComment.go")
	public String schComment(HttpServletRequest request, SchCommentModel schCommentModel){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		schCommentModel.setS_no(s_no);
		String m_email = request.getParameter("m_email");
		schCommentModel.setM_email(m_email);
		
		scheduleService.schComment(schCommentModel);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=2&s_count=1";
		
	}
	
	//�����Խ��� �ڸ�Ʈ ����
	@RequestMapping("schCommentDelete.go")
	public String schCommentDelete(HttpServletRequest request){
		
		int s_co_no = Integer.parseInt(request.getParameter("s_co_no"));
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		scheduleService.schCommentDelete(s_co_no);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=2&s_count=1";
	}
	
	//���ϱ�
	@RequestMapping("schZzim1.go")
	public String schZzim1(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		String m_email = (String)request.getParameter("m_email");
		
		scheduleService.schZzim1(s_no, m_email);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=0";
	}
	
	//�� �ϱ� ����
	@RequestMapping("schZzim2.go")
	public String schZzim2(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		String m_email = (String)request.getParameter("m_email");
		
		scheduleService.schZzim2(s_no, m_email);
		
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=0";
	}
	
	//�� �������� ��������
	@RequestMapping("schDownload.go")
	public String schDownload(HttpServletRequest request){
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		String m_email = (String)request.getParameter("m_email");
		String s_name = (String) request.getParameter("s_name");
		
		//������ ���� �ҷ�����
		ScheduleModel scheduleModel = scheduleService.scheduleDetail(s_no);
		//������ ������ �����ϸ���Ʈ �ҷ�����
		List<ScheduleModel> schDetailList = scheduleService.schDetailList(s_no);
		
		//�� �������� �����ϱ�(m_email �ٲ㼭 insert �ϱ�)
		scheduleModel.setM_email(m_email);
		scheduleModel.setS_name(s_name);
		String subject = scheduleModel.getS_name();
		scheduleModel.setS_name("<��ũ��>"+subject);
		
		//sch���̺� ���� ���� ������ s_no�޾ƿ���
		int ss_no = scheduleService.schDownload(scheduleModel);
		System.out.println("ss_no : "+ss_no);
		
		//���� ss_no�� �Ѱ��ֱ�
		scheduleService.schDownDetail(schDetailList, ss_no);
		
		//���������� - �� ���� ���� �������� �Ѿ��
		return "redirect:scheduleDetail.go?s_no="+s_no+"&s_cate=0";
		
		
	}
*/

}
