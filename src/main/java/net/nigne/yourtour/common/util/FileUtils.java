package net.nigne.yourtour.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	
	//private static final String filePath = "C:\\dev\\file\\";
	private static final String tempFilePath = "C:\\comm\\tempImages\\";
	private static final String realFilePath = "C:\\comm\\boardImages\\";

	public static String getTempFileUrl(HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	String returnUrl = null;
    	
        File file = new File(tempFilePath);
        if(file.exists() == false){
        	file.mkdirs();
        }
        
        while(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = CommonUtils.getNowTimeToString() + "_" + originalFileName;
        		
        		file = new File(tempFilePath + storedFileName);
        		multipartFile.transferTo(file);
        		
        		returnUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/common/GetTempFile.go?filename="+storedFileName;
        	}
        }
		return returnUrl;
	}

	public String moveToReal(String tempFilename, String category, int articleid, String filename) {
		File temp = new File(tempFilePath+tempFilename);
		File dir = new File(realFilePath+category+"\\"+articleid);
		
		if (!dir.exists()) { //폴더 없으면 폴더 생성
            dir.mkdirs();
        }
		
		String targetString = "";
		File target = new File(realFilePath+category+"\\"+articleid+"\\"+filename);
		
		
		if(temp.exists()) {
			while(target.exists()) {
				targetString = CommonUtils.getNowTimeToString() + "-"+filename;
				target = new File(realFilePath+category+"\\"+articleid+"\\"+targetString);
			}
			temp.renameTo(target);
			
	    }
		return targetString;
	}
	
	
	
//	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
//		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
//    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
//    	
//    	MultipartFile multipartFile = null;
//    	String originalFileName = null;
//    	String originalFileExtension = null;
//    	String storedFileName = null;
//    	
//    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
//        Map<String, Object> listMap = null; 
//        
//        String boardIdx = (String)map.get("IDX");
//        
//        File file = new File(filePath);
//        if(file.exists() == false){
//        	file.mkdirs();
//        }
//        
//        while(iterator.hasNext()){
//        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
//        	if(multipartFile.isEmpty() == false){
//        		originalFileName = multipartFile.getOriginalFilename();
//        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
//        		storedFileName = CommonUtils.getRandomString() + originalFileExtension;
//        		
//        		file = new File(filePath + storedFileName);
//        		multipartFile.transferTo(file);
//        		
//        		listMap = new HashMap<String,Object>();
//        		listMap.put("BOARD_IDX", boardIdx);
//        		listMap.put("ORIGINAL_FILE_NAME", originalFileName);
//        		listMap.put("STORED_FILE_NAME", storedFileName);
//        		listMap.put("FILE_SIZE", multipartFile.getSize());
//        		list.add(listMap);
//        	}
//        }
//		return list;
//	}
//
//	public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
//		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
//    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
//    	
//    	MultipartFile multipartFile = null;
//    	String originalFileName = null;
//    	String originalFileExtension = null;
//    	String storedFileName = null;
//    	
//    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
//        Map<String, Object> listMap = null; 
//        
//        String boardIdx = (String)map.get("IDX");
//        String requestName = null;
//        String idx = null;
//        
//        
//        while(iterator.hasNext()){
//        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
//        	if(multipartFile.isEmpty() == false){
//        		originalFileName = multipartFile.getOriginalFilename();
//        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
//        		storedFileName = CommonUtils.getRandomString() + originalFileExtension;
//        		
//        		multipartFile.transferTo(new File(filePath + storedFileName));
//        		
//        		listMap = new HashMap<String,Object>();
//        		listMap.put("IS_NEW", "Y");
//        		listMap.put("BOARD_IDX", boardIdx);
//        		listMap.put("ORIGINAL_FILE_NAME", originalFileName);
//        		listMap.put("STORED_FILE_NAME", storedFileName);
//        		listMap.put("FILE_SIZE", multipartFile.getSize());
//        		list.add(listMap);
//        	}
//        	else{
//        		requestName = multipartFile.getName();
//            	idx = "IDX_"+requestName.substring(requestName.indexOf("_")+1);
//            	if(map.containsKey(idx) == true && map.get(idx) != null){
//            		listMap = new HashMap<String,Object>();
//            		listMap.put("IS_NEW", "N");
//            		listMap.put("FILE_IDX", map.get(idx));
//            		list.add(listMap);
//            	}
//        	}
//        }
//		return list;
//	}
	
	
	
}
