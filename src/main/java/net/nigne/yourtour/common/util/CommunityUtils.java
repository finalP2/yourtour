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

@Component("communityUtils")
public class CommunityUtils {
	// 전달받은 리스트 (게시판 리스트) 받아서 html 제거해주는 루틴입니다
	public List<Map<String, Object>> removingHtmlTagFromList(List<Map<String, Object>> list, String targetAttr){
		
//		String text = "......";
//		String textWithoutTag = text.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		Iterator<Map<String, Object>> iter = list.iterator();
		while(iter.hasNext()) {
			Map<String, Object> tempMap = iter.next(); 
			String source = tempMap.get(targetAttr).toString();
			String target = source.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			target = target.replaceAll("<", "");
			System.out.println(target);
			tempMap.put(targetAttr, target);
		}		
		return list;
	}
	
public Map<String, Object> removingHtmlTagFromMap(Map<String, Object> map, String targetAttr){
		
//		String text = "......";
//		String textWithoutTag = text.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		String source = map.get(targetAttr).toString();
		String target = source.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		target = target.replaceAll("<", "");
		map.put(targetAttr, target);

		return map;
	}
}
