package net.nigne.yourtour.main;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	ModelAndView mav = new ModelAndView();
	

	@RequestMapping(value="/main.go")
	public ModelAndView main(){
		
		mav.setViewName("main");
		return mav;
		
	}

}
