package net.nigne.yourtour.city;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.nigne.yourtour.area.AreaModel;
import net.nigne.yourtour.area.AreaService;
import net.nigne.yourtour.schedule.ScheduleModel;
import net.nigne.yourtour.schedule.ScheduleService;

@Controller
@RequestMapping("/city")
public class CityController {
	
	@Resource(name="cityService")
	private CityService cityService;
	
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	
	@Resource(name="areaService")
	private AreaService areaService;


	
	
	//도시 리스트 보기
	@RequestMapping("cityList.go")
	public ModelAndView cityList(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		List<CityModel> franceList = cityService.cityList("프랑스");
		List<CityModel> germanyList = cityService.cityList("독일");
		
		mav.addObject("franceList", franceList);
		mav.addObject("germanyList", germanyList);
		
		mav.setViewName("city/cityList");
		
		return mav;
		
	}
	//도시 글 상세보기
	@RequestMapping("cityDetail.go")
	public ModelAndView cityDetail(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		String keyword = request.getParameter("keyword");
		
		CityModel cityModel = cityService.cityDetail(no);
		CityImgModel cityImgModel = cityService.city_mainImg(cityModel.getNo());
		System.out.println("도시번호="+no);
		/*List<CityModel> city_imgList = cityService.city_imgList(city_no);
		System.out.println(cityService.city_imgList(city_no));
		int img_count = city_imgList.size();*/
		
		/*List<ScheduleModel> scheduleList =  scheduleService.scheduleSearchList(keyword);
		List<AreaModel> areaList = areaService.areaCountList();
		
		mav.addObject("scheduleList", scheduleList);
		mav.addObject("areaList", areaList);*/
		mav.addObject("cityModel", cityModel);
		mav.addObject("cityImgModel", cityImgModel);
	   /* mav.addObject("city_imgList", city_imgList);*/
		/*mav.addObject("img_count", img_count);*/
		
		if(request.getParameter("keyword").equals("info")) {
			mav.setViewName("city/cityDetail");
			return mav;
		} else {
			mav.setViewName("city/cityDetail");
			return mav;
			
		}
	}
}
