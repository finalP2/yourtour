package net.nigne.yourtour.comm.common.controller;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.nigne.yourtour.common.common.CommandMap;
import net.nigne.yourtour.comm.common.service.CommonService;

@Controller
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());
	private static final String tempFilePath = "C:\\comm\\tempImages\\";
	private static final String realFilePath = "C:\\comm\\boardImages\\";
	
	@Resource(name="commonService")
	private CommonService commonService;
	
//	@RequestMapping(value="/common/downloadFile.go")
//	public void downloadFile(CommandMap commandMap, HttpServletResponse response) throws Exception{
//		Map<String,Object> map = commonService.selectFileInfo(commandMap.getMap());
//		String storedFileName = (String)map.get("STORED_FILE_NAME");
//		String originalFileName = (String)map.get("ORIGINAL_FILE_NAME");
//		
//		byte fileByte[] = FileUtils.readFileToByteArray(new File("C:\\dev\\file\\"+storedFileName));
//		
//		response.setContentType("application/octet-stream");
//		response.setContentLength(fileByte.length);
//		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
//		response.setHeader("Content-Transfer-Encoding", "binary");
//		response.getOutputStream().write(fileByte);
//		
//		response.getOutputStream().flush();
//		response.getOutputStream().close();
//	}

	@RequestMapping(value="/common/GetTempFile.go") // 게시판 작성시 임시 저장파일 다시 받아가기 과정
	public void getTempFile(CommandMap commandMap, HttpServletResponse response) throws Exception{
		Map<String,Object> map = commandMap.getMap();
		String storedFileName = (String)map.get("filename");
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(tempFilePath+storedFileName));
		
		response.setContentType("image/jpeg");
		response.setContentLength(fileByte.length);
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	@RequestMapping(value="/common/GetFile.go") // 게시판 작성후 임시파일을 본 경로로 옮긴 후 받아가기 내용
	public void getFile(CommandMap commandMap, HttpServletResponse response) throws Exception{
		Map<String,Object> map = commandMap.getMap();
		String storedFileName = (String)map.get("filename");
		String category = (String)map.get("cate");
		String articleId = (String)map.get("idx");
		byte fileByte[] = null;
		try {
			fileByte = FileUtils.readFileToByteArray(new File(realFilePath+"\\"+category+"\\"+articleId+"\\"+storedFileName));
		} catch(Exception e) {
			fileByte = FileUtils.readFileToByteArray(new File(realFilePath+"\\noimgtoshow.gif"));
		}
		
		response.setContentType("image/jpeg");
		response.setContentLength(fileByte.length);
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	@RequestMapping(value="/common/GetTempFileUrl.go")
	public void getTempFileUrl(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String resultUrl = net.nigne.yourtour.common.util.FileUtils.getTempFileUrl(request);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.print(resultUrl);
		System.out.println(resultUrl);
	}
	
	
}
