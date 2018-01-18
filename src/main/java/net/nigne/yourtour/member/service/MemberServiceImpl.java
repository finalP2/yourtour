package net.nigne.yourtour.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.nigne.yourtour.common.util.FileUtils;
import net.nigne.yourtour.member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = memberDAO.login(map);
		return tempMap;
	}
	
	@Override
	public void insertMem(Map<String, Object> map) throws Exception {
		memberDAO.insertMem(map);
		
	}
	
	@Override
	public Map<String, Object> getMember(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = memberDAO.getMember(map);
		return tempMap;
	}
	
	@Override
	public Map<String, Object> nameCheck(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = memberDAO.nameCheck(map);
		return tempMap;
	}
	
	
	@Override
	public Map<String, Object> emailFind(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = memberDAO.emailFind(map);
		return tempMap;
	}
	
	@Override
	public void updateMem(Map<String, Object> map) throws Exception {
		memberDAO.updateMem(map);
		
	}
	@Override
	public Map<String, Object> pwFind(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = memberDAO.pwFind(map);
		return tempMap;
	}

	@Override
	public void deleteMem(Map<String, Object> map) throws Exception {
		memberDAO.deleteMem(map);
	}
}
