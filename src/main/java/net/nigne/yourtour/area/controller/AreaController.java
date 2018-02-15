package net.nigne.yourtour.area.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import net.nigne.yourtour.area.service.AreaService;
import net.nigne.yourtour.city.service.CityService;
import net.nigne.yourtour.common.common.CommandMap;
import net.nigne.yourtour.schedule.service.ScheduleService;


@Controller
@RequestMapping("/area")
public class AreaController {
	
	@Resource(name="areaService")
	private AreaService areaService;
	
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	
	@Resource(name="cityService")
	private CityService cityService;
	
	private static final String uploadPath = "C:\\Java\\App\\yourtour\\src\\main\\webapp\\resources\\area_img\\";
	int totalCount;
	
	@RequestMapping("areaList.go")
	public ModelAndView areaList(HttpServletRequest request, CommandMap commandMap) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		List<Map<String,Object>> areaList = null;
		
		String searchKeyword = request.getParameter("searchKeyword");
		int city_no = Integer.parseInt(request.getParameter("city_no"));
		String keyword = request.getParameter("keyword");
		
		/*if(searchKeyword != null) {
			searchKeyword = new String(searchKeyword);
			
			areaList = areaService.areaSearch(searchKeyword, city_no);
			
			totalCount = areaList.size();
			
			List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);
			
			mav.addObject("scheduleList", scheduleList);
			mav.addObject("areaList", areaList);
			mav.addObject("totalCount", totalCount);
			mav.addObject("searchKeyword", searchKeyword);
			mav.setViewName("area/areaList");
			
			return mav;
		}*/
		commandMap.put("city_no", city_no);
		areaList = areaService.areaList(commandMap.getMap());

		

		totalCount = areaList.size();
		/*List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);
		
		mav.addObject("scheduleList", scheduleList);*/
		mav.addObject("areaList", areaList);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("area/areaList");
		
		return mav;
		
	}
		
	@RequestMapping("areaWriteForm.go")
	public ModelAndView areaWriteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("area/areaWriteForm");
		return mav;
	}
	
	@RequestMapping("areaSearchMap.go")
	public String areaSearchMap(HttpServletRequest request) {
		return "area/areaSearchMap";
	}

	@RequestMapping("areaWrite.go")
	public ModelAndView areaWrite(HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, CommandMap commandMap) throws Exception {

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
		
		areaService.areaWrite(commandMap.getMap());
		Map<String,Object> areaModel = areaService.areaLastWrite();
		int area_no = Integer.parseInt(areaModel.get("NO").toString());
		

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
				commandMap.put("area_no", area_no);

				areaService.fileupload(commandMap.getMap());
				areaService.areaMainImgModify(commandMap.getMap());
			}
		}
		
		return new ModelAndView("redirect:areaList.go?city_no="+city_no+"&keyword="+URLEncoder.encode(keyword, "UTF-8"));
	}
	
	//������ �� �󼼺���
	@RequestMapping("areaDetail.go")
	public ModelAndView areaDetail(HttpServletRequest request, CommandMap commandMap) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		String keyword = request.getParameter("keyword");
		commandMap.put("no", no);
		
		Map<String,Object> areaModel = areaService.areaDetail(commandMap.getMap());
		List<Map<String,Object>> areaImgModel = areaService.area_imgList(commandMap.getMap());
		System.out.println("img="+ areaImgModel.toString());
/*		List<Map<String,Object>>  areaReviewList = areaService.areaReviewList(no);
		List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);
		
		int revCount = areaService.revCount(no);*/
		
		/*mav.addObject("scheduleList", scheduleList);*/
		mav.addObject("areaModel", areaModel);
		mav.addObject("areaImgModel", areaImgModel);
/*		mav.addObject("areaReviewList", areaReviewList);
		mav.addObject("revCount", revCount);*/
		System.out.println("area_no="+no);
		commandMap.put("area_no", no);
		Map<String, Object> a_map = areaService.searchMap(commandMap.getMap());
		float at = Float.parseFloat(a_map.get("LAT").toString());
		float ng = Float.parseFloat(a_map.get("LNG").toString());
		System.out.println("at="+at);
		System.out.println("ng="+ng);
		mav.addObject("at",at);
		mav.addObject("ng",ng);
		
		if(request.getParameter("keyword").equals("info")) {
			mav.setViewName("area/areaDetail");
			return mav;
		} else {
			mav.setViewName("area/areaDetail");
			return mav;
		}
	}
	@RequestMapping("areaDetail2.go")
	public ModelAndView areaDetail2(HttpServletRequest request, CommandMap commandMap) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		String keyword = request.getParameter("keyword");
		commandMap.put("no", no);
		
		Map<String,Object> areaModel = areaService.areaDetail(commandMap.getMap());
		List<Map<String,Object>> areaImgModel = areaService.area_imgList(commandMap.getMap());
		System.out.println("img="+ areaImgModel.toString());
/*		List<Map<String,Object>>  areaReviewList = areaService.areaReviewList(no);
		List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);
		
		int revCount = areaService.revCount(no);*/
		
		/*mav.addObject("scheduleList", scheduleList);*/
		mav.addObject("areaModel", areaModel);
		mav.addObject("areaImgModel", areaImgModel);
/*		mav.addObject("areaReviewList", areaReviewList);
		mav.addObject("revCount", revCount);*/
		
		commandMap.put("area_no", no);
		Map<String, Object> a_map = areaService.searchMap(commandMap.getMap());
		float at = Float.parseFloat(a_map.get("LAT").toString());
		float ng = Float.parseFloat(a_map.get("LNG").toString());
		System.out.println("at="+at);
		System.out.println("ng="+ng);
		mav.addObject("at",at);
		mav.addObject("ng",ng);
		
		if(request.getParameter("keyword").equals("info")) {
			mav.setViewName("area/areaDetail2");
			return mav;
		} else {
			mav.setViewName("area/areaDetail2");
			return mav;
		}
	}

	//������ �� �����ϱ�
	@RequestMapping("areaDelete.go")
	public String areaDelete(HttpServletRequest request, CommandMap commandMap) throws Exception {
		
		int no = Integer.parseInt(request.getParameter("no"));
		int city_no = Integer.parseInt(request.getParameter("city_no"));
		commandMap.put("no", no);
		areaService.areaDelete(commandMap.getMap());
		
		return "redirect:areaList.go?city_no="+city_no;
	}
	
}
		
