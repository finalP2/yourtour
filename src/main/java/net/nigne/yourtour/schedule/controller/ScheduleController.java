package net.nigne.yourtour.schedule.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.nigne.yourtour.area.service.AreaService;
import net.nigne.yourtour.city.service.CityService;
import net.nigne.yourtour.common.common.CommandMap;
import net.nigne.yourtour.schedule.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	Logger log = Logger.getLogger(this.getClass());
	private static final String uploadPath = "C:\\Java\\App\\yourtour\\src\\main\\webapp\\resources\\sch_img\\";
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	@Resource(name="areaService")
	private AreaService areaService;
	@Resource(name="cityService")
	private CityService cityService;
	
	@RequestMapping("scheduleList.go")
	public ModelAndView scheduleList(HttpServletRequest request,CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("schedule/scheduleList");
		

			List<Map<String,Object>> list = scheduleService.scheduleList(commandMap.getMap());
			List<Map<String,Object>> likelist = scheduleService.scheduleLikeList(commandMap.getMap());
	    	mv.addObject("scheduleList", list);
	    	mv.addObject("scheduleLikeList", likelist);
	    	
		return mv;
	}
	   @RequestMapping("scheduleSearch.go")
	   public ModelAndView scheduleSearch(HttpServletRequest request,HttpSession session, CommandMap commandMap)throws Exception{
		   ModelAndView mv = new ModelAndView("schedule/scheduleList");
		   
		   List<Map<String,Object>> list = scheduleService.scheduleSearchList(commandMap.getMap());
		   List<Map<String,Object>> likelist = scheduleService.scheduleLikeList(commandMap.getMap());
	    	mv.addObject("scheduleList", list);
	    	mv.addObject("scheduleLikeList", likelist);
		   return mv;
	   }
	
	@RequestMapping("scheduleWriteForm.go")
	public ModelAndView scheduleWriteForm(HttpServletRequest request, HttpSession session) throws Exception{
		
			ModelAndView mv = new ModelAndView("schedule/scheduleWriteForm");
			
			return mv;
		
	}
	
	@RequestMapping("scheduleState.go")
	public ModelAndView scheduleState(HttpServletRequest request,MultipartHttpServletRequest multipartHttpServletRequest, CommandMap commandMap, HttpSession session) throws Exception{
        
		ModelAndView mv = new ModelAndView();
		String email = (String) session.getAttribute("session_m_email");
		commandMap.put("email", email);
		if(commandMap.get("private1")== null) {
			commandMap.put("private1", 0);
		}

		String date1 = request.getParameter("start_date");
	    String date2 = request.getParameter("end_date");;
	 
	    
        SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");

        Date FirstDate = format.parse(date1);
        Date SecondDate = format.parse(date2);

        long calDate = FirstDate.getTime() - SecondDate.getTime(); 

        long calDateDays = calDate / ( 24*60*60*1000); 
 
        calDateDays = Math.abs(calDateDays);

        commandMap.put("period", calDateDays+1);
        
        long perioddate = calDateDays+1;
        
        
        File dir = new File(uploadPath);
		
    	
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		
	
		System.out.println("uploadPath : " + uploadPath);
		
		
		List<MultipartFile> mf = multipartHttpServletRequest.getFiles("file");
		
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
			
		} else {
			
		
			for(int i=0; i<mf.size(); i++) {
			
				String genId = UUID.randomUUID().toString();
			
				String org_name = mf.get(i).getOriginalFilename();
			
				String main_img = genId + "." + FilenameUtils.getExtension(org_name);
		
				String savePath = uploadPath + main_img;
		
				mf.get(i).transferTo(new File(savePath));
				commandMap.put("main_img", main_img);

				scheduleService.scheduleWrite(commandMap.getMap());
			}
		}
        
        
		
		Map<String,Object> lastmap = scheduleService.scheduleLastWrite(commandMap.getMap());
		int sch_no = Integer.parseInt(lastmap.get("NO").toString());
		
		commandMap.put("sch_no", sch_no);
		for(int i=0; i<perioddate ; i++) {
			commandMap.put("day", 1+i);
			scheduleService.scheduleDayinsert(commandMap.getMap());
		}
		
		
		//List<StateModel> stateList = stateService.StateList();

		System.out.println(Integer.parseInt(lastmap.get("NO").toString()));
		//mav.addObject("stateList",stateList);
		System.out.println("name = "+ lastmap.get("NAME").toString());
		mv.addObject("sch", lastmap);
		mv.setViewName("schedule/scheduleState");
		
		return mv;
	}
	@RequestMapping("scheduleCity.go")
	public ModelAndView scheduleCity(HttpServletRequest request, CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int country = Integer.parseInt(request.getParameter("country"));
		String country1 = "";
		if(country == 1) {
			country1 = "프랑스";
		}
		if(country == 2) {
			country1 = "영국,아일랜드";
		}
		if(country == 3) {
			country1 = "이탈리아";
		}
		if(country == 4) {
			country1 = "스위스,체코";
		}
		if(country == 5) {
			country1 = "독일";
		}
		if(country == 6) {
			country1 = "포르투갈,스페인";
		}
		if(country == 7) {
			country1 = "크로아티아";
		}
		if(country == 8) {
			country1 = "러시아";
		}
		
		String email = (String) session.getAttribute("session_m_email");
		commandMap.put("email", email);
		commandMap.put("no", Integer.parseInt(request.getParameter("no")));
		Map<String,Object> scheduleOne = scheduleService.scheduleSelectOne(commandMap.getMap());
		commandMap.put("country", country1);
		List<Map<String,Object>> cityList = scheduleService.schcityList(commandMap.getMap());
		Map<String, Object> c_map = scheduleService.searchMap(commandMap.getMap());
		float at = Float.parseFloat(c_map.get("LAT").toString());
		float ng = Float.parseFloat(c_map.get("LNG").toString());
	/*	if (request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			List<CityModel> citySearchList = cityService.citySearchList(country, keyword);
			mav.addObject("citySearchList",citySearchList);
		}*/
		
		mv.addObject("sch", scheduleOne);
		mv.addObject("cityList",cityList);
		mv.addObject("at",at);
		mv.addObject("ng",ng);
		mv.setViewName("schedule/scheduleCity");
		
		return mv;
	}
	@RequestMapping("scheduleArea.go")
	public ModelAndView scheduleArea(HttpServletRequest request, CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int sch_day_no = Integer.parseInt(request.getParameter("sch_day_no"));
		int city_no = Integer.parseInt(request.getParameter("city_no"));
		String email = (String) session.getAttribute("session_m_email");
		int sch_no = Integer.parseInt(request.getParameter("sch_no"));
		commandMap.put("email", email);
		commandMap.put("no", sch_no);
		commandMap.put("sch_day_no", sch_day_no);
		Map<String,Object> scheduleOne = scheduleService.scheduleSelectOne(commandMap.getMap());
		List<Map<String,Object>> schDayList = scheduleService.scheduleDay(commandMap.getMap());
		List<Map<String,Object>> schDetailList = scheduleService.scheduleDetailList(commandMap.getMap());
			
		commandMap.put("city_no", city_no);
		List<Map<String,Object>> areaList = areaService.areaList(commandMap.getMap());
		List<Map<String,Object>> areaMapList = scheduleService.searchAreaMap(commandMap.getMap());
		commandMap.put("no", city_no);
		Map<String,Object> cityOne = cityService.cityDetail(commandMap.getMap());
		String country = cityOne.get("COUNTRY").toString();
		commandMap.put("country", country);
		Map<String, Object> c_map = scheduleService.cityMap(commandMap.getMap());
		float at = Float.parseFloat(c_map.get("LAT").toString());
		float ng = Float.parseFloat(c_map.get("LNG").toString());
		List<String> a_map = new ArrayList();
		
		for(int i=0; i < areaMapList.size(); i++) {
			a_map.add("{lat: "+Float.parseFloat(areaMapList.get(i).get("LAT").toString())+", "+"lng:"+Float.parseFloat(areaMapList.get(i).get("LNG").toString())+"}");
		}
		System.out.println("a_map= "+a_map);
	/*	if (request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			List<CityModel> citySearchList = cityService.citySearchList(country, keyword);
			mav.addObject("citySearchList",citySearchList);
		}*/
		mv.addObject("areaMapList", areaMapList);
		mv.addObject("a_map", a_map);
		mv.addObject("areaMapSize", areaMapList.size());
		mv.addObject("at", at);
		mv.addObject("ng", ng);
		mv.addObject("sch", scheduleOne);
		mv.addObject("schDayList", schDayList);
		mv.addObject("areaList",areaList);
		mv.addObject("schDetailList",schDetailList);
		mv.addObject("cityOne",cityOne);
		mv.addObject("sch_day_no", sch_day_no);
		mv.setViewName("schedule/scheduleArea");
		
		return mv;
	}
	@RequestMapping("insertDetail.go")
	public ModelAndView insertDetail(HttpServletRequest request, HttpSession session, CommandMap commandMap) throws Exception{
		
		int sch_day_no = Integer.parseInt(request.getParameter("sch_day_no"));
		int city_no = Integer.parseInt(request.getParameter("city_no"));
		int sch_no = Integer.parseInt(request.getParameter("sch_no"));
		int area_no = Integer.parseInt(request.getParameter("area_no"));
		
		commandMap.put("sch_day_no", sch_day_no);
		commandMap.put("area_no", area_no);
		commandMap.put("sch_no", sch_no);
		
		scheduleService.insertDetail(commandMap.getMap());
		commandMap.put("no", area_no);
		Map<String,Object> areaOne = areaService.areaDetail(commandMap.getMap());
		int like = Integer.parseInt(areaOne.get("LIKE1").toString());
		commandMap.put("like1", like+1);
		scheduleService.updateAreaLike(commandMap.getMap());
		
		
		
		return new ModelAndView("redirect:scheduleArea.go?sch_day_no="+sch_day_no+"&sch_no="+sch_no+"&city_no="+city_no+"");
	}
	
	@RequestMapping("deleteDetail.go")
	   public ModelAndView deleteDetail(HttpServletRequest request, HttpSession session, CommandMap commandMap) throws Exception{
	      
	      int sch_day_no = Integer.parseInt(request.getParameter("sch_day_no"));
	      int city_no = Integer.parseInt(request.getParameter("city_no"));
	      int sch_no = Integer.parseInt(request.getParameter("sch_no"));
	      
	      commandMap.put("sch_day_no", sch_day_no);
	      commandMap.put("sch_no", sch_no);
	      
	      Map<String,Object> detailOne = scheduleService.scheduleDetailOne(commandMap.getMap());
	      int area_no =  Integer.parseInt(detailOne.get("AREA_NO").toString());
	      commandMap.put("no", area_no);
	      Map<String,Object> areaOne = areaService.areaDetail(commandMap.getMap());
	      int like = Integer.parseInt(areaOne.get("LIKE1").toString());
	      commandMap.put("like1", like-1);
	      scheduleService.updateAreaLike(commandMap.getMap());
	      scheduleService.deleteDetail(commandMap.getMap());

	      return new ModelAndView("redirect:scheduleArea.go?sch_day_no="+sch_day_no+"&sch_no="+sch_no+"&city_no="+city_no+"");
	      
	   }
	
	@RequestMapping("scheduleDetail.go")
	   public ModelAndView scheduleDetail(HttpServletRequest request, HttpSession session, CommandMap commandMap) throws Exception{
	      ModelAndView mv = new ModelAndView();
	      
	         int sch_day_no = Integer.parseInt(request.getParameter("sch_day_no"));
	         int sch_cate = Integer.parseInt(request.getParameter("sch_cate"));
	         int no = Integer.parseInt(request.getParameter("no"));
	         String email = (String) session.getAttribute("session_m_email");
	         commandMap.put("sch_day_no", sch_day_no);
	         commandMap.put("no", no);
	         Map<String,Object> scheduleOne = scheduleService.scheduleSelectOne(commandMap.getMap());
	         commandMap.put("sch_no", no);
	          commandMap.put("email", email);
	         Map<String,Object> scheduleChk = scheduleService.scheduleLikeChk(commandMap.getMap());
	         String empty = "{map=null}";
	         if(scheduleChk.toString().equals(empty)) {
	            mv.addObject("msg","true");
	         
	         }
	         else if(scheduleChk.isEmpty()==false) {
	             mv.addObject("msg", "failure");   
	          }
	        //일정 상세표일때
	          if(sch_cate == 1) {
	            List<Map<String,Object>> schDayList = scheduleService.scheduleDay(commandMap.getMap());
	             List<Map<String,Object>> schDetailList = scheduleService.scheduleDetailList(commandMap.getMap());
	             
	            mv.addObject("schDayList", schDayList);
	           mv.addObject("schDetailList", schDetailList);
	          }
	          
	        //코멘트 일때
	           if(sch_cate == 2){
	            List<Map<String,Object>> commentlist = scheduleService.commentList(commandMap.getMap());
	            
	            mv.addObject("clist", commentlist);
	         }
	           
	         mv.addObject("sch", scheduleOne);
	         mv.addObject("sch_cate", sch_cate);
	         
	         
	         mv.setViewName("schedule/scheduleDetail");
	         return mv;
	   }
	   
	   @RequestMapping("scheduleLike.go")
	      public ModelAndView scheduleLike(HttpServletRequest request,HttpSession session, CommandMap commandMap ) throws Exception{
	         ModelAndView mv = new ModelAndView();
	         
	         int sch_day_no = Integer.parseInt(request.getParameter("sch_day_no"));
	         System.out.println("sch_day_no"+sch_day_no);
	          int sch_cate = Integer.parseInt(request.getParameter("sch_cate"));
	          int no = Integer.parseInt(request.getParameter("no"));
	         
	         commandMap.put("no", Integer.parseInt(request.getParameter("no")));
	         Map<String,Object> scheduleOne = scheduleService.scheduleSelectOne(commandMap.getMap());
	          String email = (String) session.getAttribute("session_m_email");
	          
	          commandMap.put("sch_no", Integer.parseInt(scheduleOne.get("NO").toString()));
	           
	           //일정 상세표일때
	             if(sch_cate == 1) {
	               List<Map<String,Object>> schDayList = scheduleService.scheduleDay(commandMap.getMap());
	                List<Map<String,Object>> schDetailList = scheduleService.scheduleDetailList(commandMap.getMap());
	                
	               mv.addObject("schDayList", schDayList);
	              mv.addObject("schDetailList", schDetailList);
	             }
	             
	           //코멘트 일때
	              if(sch_cate == 2){
	               List<Map<String,Object>> commentlist = scheduleService.commentList(commandMap.getMap());
	               
	               mv.addObject("clist", commentlist);
	            }
	              
	            mv.addObject("sch", scheduleOne);
	            mv.addObject("sch_cate", sch_cate);
	          
	          
	          
	         int like = Integer.parseInt(scheduleOne.get("LIKE1").toString());
	         commandMap.put("email", email);
	         commandMap.put("sch_no", Integer.parseInt(scheduleOne.get("NO").toString()));
	         Map<String,Object> scheduleChk = scheduleService.scheduleLikeChk(commandMap.getMap());
	         System.out.println("scheduleChk= "+scheduleChk);
	         System.out.println("empty= "+scheduleChk.isEmpty());
	         System.out.println("string= "+ scheduleChk.toString());
	         String empty = "{map=null}";
	        
	          if(scheduleChk.toString().equals(empty)) {
	             System.out.println("like="+like);
	             commandMap.put("like1", like+1);

	          scheduleService.likeinsert(commandMap.getMap());
	          scheduleService.likeupdate(commandMap.getMap());
	          
	          mv.addObject("sch",scheduleOne);
	          mv.addObject("msg","true");
	          
	          mv.setViewName("schedule/scheduleDetail");
	            return mv;
	         
	          }
	          else if(scheduleChk.isEmpty()==false) {
	             mv.addObject("sch",scheduleOne);
	             mv.addObject("msg", "failure");
	             mv.setViewName("schedule/scheduleDetail");
	               return mv;
	             
	          }
	          mv.setViewName("schedule/scheduleDetail");
	            return mv;
	         
	      }
	      
	   
	      @RequestMapping("scheduleCommentWrite.go")
	      public ModelAndView scheduleCommentWrite(HttpServletRequest request,HttpSession session, CommandMap commandMap ) throws Exception{
	            
	         ModelAndView mv = new ModelAndView();
	         
	         int sch_day_no = Integer.parseInt(request.getParameter("sch_day_no"));
	         int sch_cate = Integer.parseInt(request.getParameter("sch_cate"));
	         int no = Integer.parseInt(request.getParameter("no"));
	               
	         String email = (String) session.getAttribute("session_m_email");
	         commandMap.put("no", Integer.parseInt(request.getParameter("no")));
	         Map<String,Object> scheduleOne = scheduleService.scheduleSelectOne(commandMap.getMap());
	         commandMap.put("email", email);
	         commandMap.put("sch_no", Integer.parseInt(scheduleOne.get("NO").toString()));
	          scheduleService.scheduleCommentWrite(commandMap.getMap());
	          List<Map<String,Object>> commentlist  = scheduleService.commentList(commandMap.getMap());
	          mv.addObject("clist", commentlist);
	          mv.addObject("sch",scheduleOne );
	         mv.setViewName("schedule/scheduleDetail");
	         
	         return new ModelAndView("redirect:scheduleDetail.go?sch_day_no="+sch_day_no+"&no="+no+"&sch_cate="+sch_cate+"");
	         
	         
	      }
	      @RequestMapping("commentDelete.go")
	      public ModelAndView commentDelete(HttpServletRequest request,HttpSession session, CommandMap commandMap) throws Exception{
	         ModelAndView mv = new ModelAndView();
	         
	         int sch_day_no = Integer.parseInt(request.getParameter("sch_day_no"));
	         int sch_cate = Integer.parseInt(request.getParameter("sch_cate"));
	         int no = Integer.parseInt(request.getParameter("no"));
	         int c_no = Integer.parseInt(request.getParameter("c_no"));
	         
	         commandMap.put("c_no", Integer.parseInt(request.getParameter("c_no")));
	         scheduleService.commentDelete(commandMap.getMap());
	         commandMap.put("no", Integer.parseInt(request.getParameter("no")));
	         Map<String,Object> scheduleOne = scheduleService.scheduleSelectOne(commandMap.getMap());
	         commandMap.put("sch_no", Integer.parseInt(scheduleOne.get("NO").toString()));
	         List<Map<String,Object>> commentlist  = scheduleService.commentList(commandMap.getMap());
	         mv.addObject("clist", commentlist);
	         mv.addObject("sch",scheduleOne );

	         
	         return new ModelAndView("redirect:scheduleDetail.go?sch_day_no="+sch_day_no+"&sch_cate="+sch_cate+"&c_no="+c_no+"&no="+no+"");
	      }
	   
	   
	
	
	
}
