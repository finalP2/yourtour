package net.nigne.yourtour.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {

	Map<String, Object> login(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> myschedule(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> mylikeschedule(Map<String, Object> map) throws Exception;

	void insertMem(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> getMember(Map<String, Object> map) throws Exception;

	Map<String, Object> nameCheck(Map<String, Object> map) throws Exception;

	Map<String, Object> emailFind(Map<String, Object> map) throws Exception;

	Map<String, Object> pwFind(Map<String, Object> map) throws Exception;

	void updateMem(Map<String, Object> map) throws Exception;
	
	void updateImg(Map<String, Object> map) throws Exception;

	void deleteMem(Map<String, Object> map) throws Exception;
		
}
