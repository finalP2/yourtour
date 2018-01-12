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
	
	private static final String uploadPath = "C:\\Java\\App\\yourtour\\src\\main\\webapp\\WEB-INF\\views\\area_img\\";
	int totalCount;
	
	//������ ����Ʈ ����
	@RequestMapping("areaList.go")
	public ModelAndView areaList(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		List<AreaModel> areaList = null;
		
		String searchKeyword = request.getParameter("searchKeyword");
		int city_no = Integer.parseInt(request.getParameter("city_no"));
		String keyword = request.getParameter("keyword");
		
		//�˻����� ���� ��
		if(searchKeyword != null) {
			searchKeyword = new String(searchKeyword);
			
			areaList = areaService.areaSearch(searchKeyword, city_no);
			
			totalCount = areaList.size();
			
			/*List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);
			
			mav.addObject("scheduleList", scheduleList);*/
			mav.addObject("areaList", areaList);
			mav.addObject("totalCount", totalCount);
			mav.addObject("searchKeyword", searchKeyword);
			mav.setViewName("areaList");
			
			return mav;
		}
		
		//�˻����� ���� ��
		areaList = areaService.areaList(city_no);
		
		totalCount = areaList.size();
		/*List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);
		
		mav.addObject("scheduleList", scheduleList);*/
		mav.addObject("areaList", areaList);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("areaList");
		
		return mav;
	}
		
	//������ �۾��� �� �̵� (������)
	@RequestMapping("areaWriteForm.go")
	public ModelAndView areaWriteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("area/areaWriteForm");
		return mav;
	}
	
	//������ �۾��� ������ ������ �ּҰ˻� �� �ҷ����� (������)
	@RequestMapping("areaSearchMap.go")
	public String areaSearchMap(HttpServletRequest request) {
		return "area/areaSearchMap";
	}

	//������ �۾��� (������)
	@RequestMapping("areaWrite.go")
	public ModelAndView areaWrite(HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, AreaModel areaModel, CityModel cityModel, AreaImgModel areaimgModel) throws Exception {
		
		//�ٹٲ�
		String content = areaModel.getContent().replaceAll("\r\n", "<br/>");
		areaModel.setContent(content);
		String city_name = request.getParameter("city_name");
		String keyword = request.getParameter("keyword");
		
		List<CityModel> cityList = null;
		
		cityModel = cityService.citySelectOne(city_name);
		System.out.println("�����̸� = "+city_name);
		int city_no = cityModel.getNo();
		areaModel.setCity_no(city_no);
		
		//÷�������� ������ �۾��� ���
		areaService.areaWrite(areaModel);
		areaModel = areaService.areaLastWrite();
		int area_no = areaModel.getNo();
		int no = areaService.selectSeq();
		
		//÷������ ���
		File dir = new File(uploadPath);
		
		//uploadPath ��ο� ������ ������ ���� ����
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		
		//�ֿܼ� uploadPath ���
		System.out.println("uploadPath : " + uploadPath);
		
		//�Ѿ�� ������ ����Ʈ�� ����
		List<MultipartFile> mf = multipartHttpServletRequest.getFiles("file");
		
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
			
		} else {
			
			//÷�������� ������ �۾��Ⱑ ���� �ʵ��� ����
			for(int i=0; i<mf.size(); i++) {
				
				//���� �ߺ��� ó��
				String genId = UUID.randomUUID().toString();
				
				//���� ���ϸ�
				String org_name = mf.get(i).getOriginalFilename();
				
				//����Ǵ� ���� �̸�
				String sav_name = genId + "." + FilenameUtils.getExtension(org_name);
				
				//����� ���� ��� + ���� �̸�
				String savePath = uploadPath + sav_name;
				
				//���� ����
				mf.get(i).transferTo(new File(savePath));
				areaimgModel.setOrg_name(org_name);
				areaimgModel.setSav_name(sav_name);
				areaimgModel.setArea_no(area_no);
				areaService.fileupload(areaimgModel);
			}
		}
		
		return new ModelAndView("redirect:areaList.go?city_no="+city_no+"&keyword="+URLEncoder.encode(keyword, "UTF-8"));
	}
	
	//������ ����� ������ ���� �޽��� ���
	public String AreaMessage(Model model, AreaModel areaModel, BindingResult bindingResult) {
		new AreaValidator().validate(areaModel, bindingResult);
		if(bindingResult.hasErrors()) {
			model.addAttribute("areaModel", areaModel);
			return "area/areaWriteForm";
		} else {
			//������ó��
			//redirect
			return "redirect:/";
		}
	}

	//������ �� �󼼺���
	@RequestMapping("areaDetail.go")
	public ModelAndView areaDetail(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		String keyword = request.getParameter("keyword");
		
		List<AreaModel> areaModel = areaService.areaDetail(no);
		List<AreaModel> area_imgList = areaService.area_imgList(no);
		String area_mainImg = areaService.area_mainImg(no);
		int img_count = area_imgList.size();
		List<AreaReviewModel> areaReviewList = areaService.areaReviewList(no);
		/*List<ScheduleModel> scheduleList = scheduleService.scheduleSearchList(keyword);*/
		
		int revCount = areaService.revCount(no);
		
		/*mav.addObject("scheduleList", scheduleList);*/
		mav.addObject("areaModel", areaModel);
		mav.addObject("area_imgList", area_imgList);
		mav.addObject("area_mainImg", area_mainImg);
		mav.addObject("areaReviewList", areaReviewList);
		mav.addObject("revCount", revCount);
		
		//�˻����� ���� �������� ��ġ�ϸ� ���� �������� �ٽ� �̵�
		if(request.getParameter("keyword").equals("info")) {
			mav.setViewName("area/areaDetail");
			return mav;
		} else {
			mav.setViewName("areaDetail");
			return mav;
		}
	}
	
	//������ �� �����ϱ� �� (������)
	@RequestMapping("areaModifyForm.go")
	public ModelAndView areaModifyForm(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		//�Բ� ����� �̹��� ������ �����̸� �ҷ�����
		List<AreaModel> imgList = areaService.area_imgList(no);
		
		List<AreaModel> areaModel = areaService.areaDetail(no);
		
		//�ٹٲ� <br/>�ٽ� \r\n���� �ٲٱ�
		String content = ((AreaModel) areaModel).getContent().replaceAll("<br/>", "\r\n");
		((AreaModel) areaModel).setContent(content);
		
		mav.addObject("imgList", imgList);
		mav.addObject("areaModel", areaModel);
		mav.addObject("areaModel", areaModel);
		mav.setViewName("areaModifyForm");
		
		return mav;
	}
	
	//������ �� �����ϱ�
	@RequestMapping("areaModify.go")
	public String areaModify(HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest, AreaModel areaModel,AreaImgModel areaimg) throws Exception {
		
		//�ٹٲ�
		String content = areaModel.getContent().replaceAll("\r\n", "<br/>");
		areaModel.setContent(content);
		
		int no = Integer.parseInt(request.getParameter("no"));
		areaModel.setNo(no);
		
		//÷������ �����ϰ� �����ϱ�
		areaService.areaModify(areaModel);
		
		//�Ѿ�� ������ ����Ʈ�� ����
		List<MultipartFile> mf = multipartHttpServletRequest.getFiles("file");
		
		//÷������ �����ϱ� (÷�������� ���� ������� ������ �׳� �Ѿ��)
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
			
		} else {
			
			//������ ÷�������� �����ϱ�
			areaService.fileDelete(no);
			
			File dir = new File(uploadPath);
			
			//uploadPath ��ο� ������ ������ ���� ����
			if(!dir.isDirectory()) {
				dir.mkdir();
			}
			
			//�ֿܼ� uploadPath ���
			System.out.println("uploadPath : "+ uploadPath);
			
			//÷�������� ������ �۾��Ⱑ �� �ǵ��� ����
			for(int i=0; i<mf.size(); i++) {
				
				//���� �ߺ��� ó��
				String genId = UUID.randomUUID().toString();
				
				//���� ���ϸ�
				String org_name = mf.get(i).getOriginalFilename();
				
				//����Ǵ� ���� �̸�
				String sav_name = genId + "." + FilenameUtils.getExtension(org_name);
				
				//����� ���ϰ�� + ���� �̸�
				String savePath = uploadPath + sav_name;
				
				//���� ����
				mf.get(i).transferTo(new File(savePath));
				
				//areaService.fileupload(org_name, sav_name, no);
			}
		}
				
				String keyword = request.getParameter("keyword");
				
				return "redirect:areaDetail.go?no="+no+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
	}
	
	//������ �� �����ϱ�
	@RequestMapping("areaDelete.go")
	public String areaDelete(HttpServletRequest request) throws UnsupportedEncodingException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		int city_no = Integer.parseInt(request.getParameter("city_no"));
		
		areaService.areaDelete(no);
		String keyword = request.getParameter("keyword");
		
		return "redirect:areaList.go?city_no="+city_no+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
	}
	
	//������ ���� ����
	@RequestMapping("areaReview.go")
	public String areaReview(HttpServletRequest request, AreaReviewModel areaReviewModel) throws UnsupportedEncodingException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		areaReviewModel.setNo(no);
		System.out.println("no : "+no);
		
		areaService.areaReviewList(no);
		String keyword = request.getParameter("keyword");
		
		return "redirect:areaDetail.go?no="+no+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
	}
	
	//������ ���� ����
	@RequestMapping("areaReviewDelete.go")
	public String areaReviewDelete(HttpServletRequest request) throws UnsupportedEncodingException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		String keyword = request.getParameter("keyword");
		
		areaService.areaReviewDelete(no);
		
		return "redirect:areaDetail.go?no="+no+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
	}
}
		
