package net.nigne.yourtour.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.nigne.yourtour.common.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> login(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("member.login", map);
	}
	
	public void insertMem(Map<String, Object> map) throws Exception{
		insert("member.insertMem", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getMember(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("member.getMember", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> nameCheck(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("member.nameCheck", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> emailFind(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("member.emailFind", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> pwFind(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("member.pwFind", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myschedule(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("member.myList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mylikeschedule(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("member.myLikeList", map);
	}

	public void updateMem(Map<String, Object> map) throws Exception {
		update("member.updateMem", map);
		
	}
	
	public void updateImg(Map<String, Object> map) throws Exception {
		update("member.updateImg", map);
	}

	public void deleteMem(Map<String, Object> map) {
		delete("member.deleteMem",map);
		
	}

	
	
}
