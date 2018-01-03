package net.nigne.yourtour.main;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import net.nigne.yourtour.schedule.ScheduleModel;
import net.nigne.yourtour.schedule.ScheduleService;


@Controller
public class MainController {
	
	ModelAndView mav = new ModelAndView();
	
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	
/*	@Resource(name="areaService")
	private AreaService areaService;
	
	@Resource(name="tipService")
	private TipService tipService;*/
	
	@RequestMapping(value="/main.go")
	public ModelAndView main(){
		
/*		List<ScheduleModel> scheduleList = scheduleService.scheduleHitList();

		mav.addObject("tipList", tipList);
		mav.addObject("areaList", areaList);
		mav.addObject("scheduleList", scheduleList);*/
		mav.setViewName("main");
		return mav;
		
	}

}
