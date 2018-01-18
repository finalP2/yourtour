package net.nigne.yourtour.member.service;

import java.util.Map;

public interface MemberService {

	Map<String, Object> login(Map<String, Object> map) throws Exception;

	void insertMem(Map<String, Object> map) throws Exception;

	Map<String, Object> getMember(Map<String, Object> map) throws Exception;

	Map<String, Object> nameCheck(Map<String, Object> map) throws Exception;

	Map<String, Object> emailFind(Map<String, Object> map) throws Exception;

	Map<String, Object> pwFind(Map<String, Object> map) throws Exception;

	void updateMem(Map<String, Object> map) throws Exception;

	void deleteMem(Map<String, Object> map) throws Exception;

	

}
