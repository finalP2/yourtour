package net.nigne.yourtour.city.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.nigne.yourtour.area.service.AreaService;
import net.nigne.yourtour.city.service.CityService;
import net.nigne.yourtour.common.common.CommandMap;


@Controller
@RequestMapping("/city")
public class CityController {
	
	@Resource(name="cityService")
	private CityService cityService;
	@Resource(name="areaService")
	private AreaService areaService;


	
	
	@RequestMapping("cityList.go")
	public ModelAndView cityList(HttpServletRequest request, CommandMap commandMap) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		commandMap.put("country", "프랑스");
		List<Map<String,Object>> franceList = cityService.cityList(commandMap.getMap());
		commandMap.put("country", "독일");
		List<Map<String,Object>> germanyList = cityService.cityList(commandMap.getMap());
		System.out.println("독일="+ germanyList.size());
		mav.addObject("franceList", franceList);
		mav.addObject("germanyList", germanyList);

		
		mav.setViewName("city/cityList");
		
		return mav;
		
	}
	@RequestMapping("cityDetail.go")
	public ModelAndView cityDetail(HttpServletRequest request,CommandMap commandMap) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		String keyword = request.getParameter("keyword");
		commandMap.put("no", no);
		Map<String,Object> cityModel = cityService.cityDetail(commandMap.getMap());
		commandMap.put("city_no", Integer.parseInt(cityModel.get("NO").toString()));
		Map<String,Object> cityImgModel = cityService.city_mainImg(commandMap.getMap());
		
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
