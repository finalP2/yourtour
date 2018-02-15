package net.nigne.yourtour.hotel.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.nigne.yourtour.city.service.CityService;
import net.nigne.yourtour.common.common.CommandMap;
import net.nigne.yourtour.hotel.service.HotelService;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	
	@Resource(name="hotelService")
	private HotelService hotelService;
	@Resource(name="cityService")
	private CityService cityService;
	
	private static final String uploadPath = "C:\\Java\\App\\yourtour\\src\\main\\webapp\\resources\\hotel_img\\";
	int totalCount;
	
	@RequestMapping("hotelList.go")
	public ModelAndView hotelList(HttpServletRequest request, CommandMap commandMap) throws Exception {
		
		ModelAndView mav = new ModelAndView();

		int city_no = Integer.parseInt(request.getParameter("city_no"));
		
		commandMap.put("city_no", city_no);
		List<Map<String,Object>> hotelList = hotelService.hotelList(commandMap.getMap());

		

		totalCount = hotelList.size();
		/*List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);
		
		mav.addObject("scheduleList", scheduleList);*/
		mav.addObject("hotelList", hotelList);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("hotel/hotelList");
		
		return mav;
		
	}
	@RequestMapping("hotelWriteForm.go")
	public ModelAndView hotelWriteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hotel/hotelWriteForm");
		return mav;
	}
	
	@RequestMapping("hotelWrite.go")
	public ModelAndView hotelWrite(HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, CommandMap commandMap) throws Exception {

		String content = request.getParameter("content").replaceAll("\r\n", "<br/>");
		commandMap.put("content", content);
		String city_name = request.getParameter("city_name");
		String keyword = request.getParameter("keyword");
		commandMap.put("city_name", city_name);
		commandMap.put("keyword", keyword);
		
		Map<String,Object> cityModel = cityService.citySelectOne(commandMap.getMap());
		System.out.println("도시이름 = "+city_name);
		
		int city_no = Integer.parseInt(cityModel.get("NO").toString());
		commandMap.put("city_no", city_no);
		
		hotelService.hotelWrite(commandMap.getMap());
		Map<String,Object> hotelModel = hotelService.hotelLastWrite();
		int hotel_no = Integer.parseInt(hotelModel.get("NO").toString());
		

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
				String sav_name = genId + "." + FilenameUtils.getExtension(org_name);
				String savePath = uploadPath + sav_name;
		
				mf.get(i).transferTo(new File(savePath));
				commandMap.put("org_name", org_name);
				commandMap.put("sav_name", sav_name);
				commandMap.put("hotel_no", hotel_no);

				hotelService.fileupload(commandMap.getMap());
				hotelService.hotelMainImgModify(commandMap.getMap());
			}
		}
		
		return new ModelAndView("redirect:hotelList.go?city_no="+city_no+"&keyword="+URLEncoder.encode(keyword, "UTF-8"));
	}
}
