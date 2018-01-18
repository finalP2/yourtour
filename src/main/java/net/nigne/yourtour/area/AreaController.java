package net.nigne.yourtour.area;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/*import org.springframework.validation.BindingResult;*/
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import net.nigne.yourtour.city.CityModel;
import net.nigne.yourtour.city.CityService;
import net.nigne.yourtour.schedule.ScheduleModel;
import net.nigne.yourtour.schedule.ScheduleService;

@Controller
@RequestMapping("/area")
public class AreaController {
	
	@Resource(name="areaService")
	private AreaService areaService;
	
	@Resource(name="scheduleService")
	private ScheduleService scheduleService;
	
	@Resource(name="cityService")
	private CityService cityService;
	
	private static final String uploadPath = "C:\\Java\\mavenApp\\yourtour\\src\\main\\webapp\\resources\\area_img\\";
	int totalCount;
	
	//여행지 리스트 보기
	@RequestMapping("areaList.go")
	public ModelAndView areaList(HttpServletRequest request, AreaModel areaModel) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		List<AreaModel> areaList = null;
		
		String searchKeyword = request.getParameter("searchKeyword");
		int city_no = Integer.parseInt(request.getParameter("city_no"));
		String keyword = request.getParameter("keyword");
		
		
		//검색값이 있을 때
		if(searchKeyword != null) {
			searchKeyword = new String(searchKeyword);
			
			areaList = areaService.areaSearch(searchKeyword, city_no);
			
			totalCount = areaList.size();
			
			/*List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);
			
			mav.addObject("scheduleList", scheduleList);*/
			mav.addObject("areaList", areaList);
			mav.addObject("totalCount", totalCount);
			mav.addObject("searchKeyword", searchKeyword);
			mav.setViewName("area/areaList");
			
			return mav;
		}
		
		//검색값이 없을 때
		areaList = areaService.areaList(city_no);
		List<AreaImgModel> areaImgModel = areaService.area_imgList(city_no);
		System.out.println("size="+ areaImgModel.size());
		totalCount = areaList.size();
		/*List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);
		
		mav.addObject("scheduleList", scheduleList);*/
		mav.addObject("areaList", areaList);
		mav.addObject("areaImgModel", areaImgModel);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("area/areaList");
		
		return mav;
		
	}
		
	//여행지 글쓰기 폼 이동 (관리자)
	@RequestMapping("areaWriteForm.go")
	public ModelAndView areaWriteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("area/areaWriteForm");
		return mav;
	}
	
	//여행지 글쓰기 폼에서 여행지 주소검색 폼 불러오기 (관리자)
	@RequestMapping("areaSearchMap.go")
	public String areaSearchMap(HttpServletRequest request) {
		return "area/areaSearchMap";
	}

	//여행지 글쓰기 (관리자)
	@RequestMapping("areaWrite.go")
	public ModelAndView areaWrite(HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, AreaModel areaModel, CityModel cityModel, AreaImgModel areaimgModel) throws Exception {
		
		//줄바꿈
		String content = areaModel.getContent().replaceAll("\r\n", "<br/>");
		areaModel.setContent(content);
		String city_name = request.getParameter("city_name");
		String keyword = request.getParameter("keyword");
		
		List<CityModel> cityList = null;
		
		cityModel = cityService.citySelectOne(city_name);
		System.out.println("도시이름 = "+city_name);
		int city_no = cityModel.getNo();
		areaModel.setCity_no(city_no);
		
		//첨부파일을 제외한 글쓰기 등록
		areaService.areaWrite(areaModel);
		areaModel = areaService.areaLastWrite();
		int area_no = areaModel.getNo();
		int no = areaService.selectSeq();
		
		//첨부파일 등록
		File dir = new File(uploadPath);
		
		//uploadPath 경로에 폴더가 없으면 새로 생성
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		
		//콘솔에 uploadPath 출력
		System.out.println("uploadPath : " + uploadPath);
		
		//넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = multipartHttpServletRequest.getFiles("file");
		
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
			
		} else {
			
			//첨부파일이 없으면 글쓰기가 되지 않도록 수정
			for(int i=0; i<mf.size(); i++) {
				
				//파일 중복명 처리
				String genId = UUID.randomUUID().toString();
				
				//본래 파일명
				String org_name = mf.get(i).getOriginalFilename();
				
				//저장되는 파일 이름
				String sav_name = genId + "." + FilenameUtils.getExtension(org_name);
				
				//저장될 파일 경로 + 파일 이름
				String savePath = uploadPath + sav_name;
				
				//파일 저장
				mf.get(i).transferTo(new File(savePath));
				areaimgModel.setOrg_name(org_name);
				areaimgModel.setSav_name(sav_name);
				areaimgModel.setArea_no(area_no);
				areaService.fileupload(areaimgModel);
			}
		}
		
		return new ModelAndView("redirect:areaList.go?city_no="+city_no+"&keyword="+URLEncoder.encode(keyword, "UTF-8"));
	}
	
	//내용이 비워져 있으면 에러 메시지 출력
	public String AreaMessage(Model model, AreaModel areaModel, BindingResult bindingResult) {
		new AreaValidator().validate(areaModel, bindingResult);
		if(bindingResult.hasErrors()) {
			model.addAttribute("areaModel", areaModel);
			return "area/areaWriteForm";
		} else {
			//데이터처리
			//redirect
			return "redirect:/";
		}
	}

	//여행지 글 상세보기
	@RequestMapping("areaDetail.go")
	public ModelAndView areaDetail(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		String keyword = request.getParameter("keyword");
		
		
		AreaModel areaModel = areaService.areaDetail(no);
		
		String area_mainImg = areaService.area_mainImg(no);

		List<AreaReviewModel> areaReviewList = areaService.areaReviewList(no);
		/*List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);*/
		
		int revCount = areaService.revCount(no);
		
		/*mav.addObject("scheduleList", scheduleList);*/
		mav.addObject("areaModel", areaModel);
		mav.addObject("area_mainImg", area_mainImg);
		mav.addObject("areaReviewList", areaReviewList);
		mav.addObject("revCount", revCount);
		
		//검색값이 현재 페이지와 일치하면 현재 페이지로 다시 이동
		if(request.getParameter("keyword").equals("info")) {
			mav.setViewName("area/areaDetail");
			return mav;
		} else {
			mav.setViewName("area/areaDetail");
			return mav;
		}
	}
	
	//여행지 글 수정하기 폼 (관리자)
	@RequestMapping("areaModifyForm.go")
	public ModelAndView areaModifyForm(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		//함께 저장된 이미지 파일의 원본이름 불러오기
		
		
		AreaModel areaModel = areaService.areaDetail(no);
		List<AreaImgModel> imgList = areaService.area_imgList(areaModel.getCity_no());
		//줄바꿈 <br/>다시 \r\n으로 바꾸기
		String content = ((AreaModel) areaModel).getContent().replaceAll("<br/>", "\r\n");
		((AreaModel) areaModel).setContent(content);
		
		mav.addObject("imgList", imgList);
		mav.addObject("areaModel", areaModel);
		mav.addObject("areaModel", areaModel);
		mav.setViewName("areaModifyForm");
		
		return mav;
	}
	
	//여행지 글 수정하기
	@RequestMapping("areaModify.go")
	public String areaModify(HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, AreaModel areaModel,AreaImgModel areaimg) throws Exception {
		
		//줄바꿈
		String content = areaModel.getContent().replaceAll("\r\n", "<br/>");
		areaModel.setContent(content);
		
		int no = Integer.parseInt(request.getParameter("no"));
		areaModel.setNo(no);
		
		//첨부파일 제외하고 수정하기
		areaService.areaModify(areaModel);
		
		//넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = multipartHttpServletRequest.getFiles("file");
		
		//첨부파일 수정하기 (첨부파일을 새로 등록하지 않으면 그냥 넘어가기)
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
			
		} else {
			
			//기존의 첨부파일을 삭제하기
			areaService.fileDelete(no);
			
			File dir = new File(uploadPath);
			
			//uploadPath 경로에 폴더가 없으면 새로 생성
			if(!dir.isDirectory()) {
				dir.mkdir();
			}
			
			//콘솔에 uploadPath 출력
			System.out.println("uploadPath : "+ uploadPath);
			
			//첨부파일이 없으면 글쓰기가 안 되도록 수정
			for(int i=0; i<mf.size(); i++) {
				
				//파일 중복명 처리
				String genId = UUID.randomUUID().toString();
				
				//본래 파일명
				String org_name = mf.get(i).getOriginalFilename();
				
				//저장되는 파일 이름
				String sav_name = genId + "." + FilenameUtils.getExtension(org_name);
				
				//저장될 파일경로 + 파일 이름
				String savePath = uploadPath + sav_name;
				
				//파일 저장
				mf.get(i).transferTo(new File(savePath));
				
				//areaService.fileupload(org_name, sav_name, no);
			}
		}
				
				String keyword = request.getParameter("keyword");
				
				return "redirect:areaDetail.go?no="+no+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
	}
	
	//여행지 글 삭제하기
	@RequestMapping("areaDelete.go")
	public String areaDelete(HttpServletRequest request) throws UnsupportedEncodingException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		int city_no = Integer.parseInt(request.getParameter("city_no"));
		
		areaService.areaDelete(no);
		String keyword = request.getParameter("keyword");
		
		return "redirect:areaList.go?city_no="+city_no+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
	}
	
	//여행지 리뷰 쓰기
	@RequestMapping("areaReview.go")
	public String areaReview(HttpServletRequest request, AreaReviewModel areaReviewModel) throws UnsupportedEncodingException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		areaReviewModel.setNo(no);
		System.out.println("no : "+no);
		
		areaService.areaReviewList(no);
		String keyword = request.getParameter("keyword");
		
		return "redirect:areaDetail.go?no="+no+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
	}
	
	//여행지 리뷰 삭제
	@RequestMapping("areaReviewDelete.go")
	public String areaReviewDelete(HttpServletRequest request) throws UnsupportedEncodingException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		String keyword = request.getParameter("keyword");
		
		areaService.areaReviewDelete(no);
		
		return "redirect:areaDetail.go?no="+no+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
	}
}
		
