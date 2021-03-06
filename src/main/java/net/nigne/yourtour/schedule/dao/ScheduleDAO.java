package net.nigne.yourtour.schedule.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.nigne.yourtour.common.dao.AbstractDAO;


@Repository("scheduleDAO")
public class ScheduleDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> scheduleList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("schedule.scheduleList", map);
	}

	public void scheduleWrite(Map<String, Object> map) throws Exception{
		insert("schedule.scheduleWrite", map);
	}
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("schedule.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> scheduleLastWrite(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("schedule.scheduleLastWrite", map);
	}
	
	
	public void scheduleDayinsert(Map<String, Object> map) throws Exception{
		insert("schedule.scheduleDayinsert", map);
	}
	
	public void likeinsert(Map<String, Object> map) throws Exception{
		insert("schedule.likeinsert", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> scheduleLikeChk(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("schedule.scheduleLikeChk", map);
	}
	public void likeupdate(Map<String, Object> map) throws Exception{
		update("schedule.likeupdate", map);
	}
	public void scheduleCommentWrite(Map<String, Object> map) throws Exception{
		insert("schedule.scheduleCommentWrite", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> scheduleSelectOne(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("schedule.scheduleSelectOne", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> schcityList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("schedule.schcityList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> commentList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("schedule.commentList", map);
	}

	public void commentDelete(Map<String, Object> map) throws Exception{
		delete("schedule.commentDelete",map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> scheduleDay(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("schedule.scheduleDay", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> scheduleDetailList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("schedule.scheduleDetailList", map);
	}

	public void insertDetail(Map<String, Object> map) {
		insert("schedule.insertDetail", map);
		
	}

	public void updateAreaLike(Map<String, Object> map) {
		update("schedule.updateAreaLike", map);
		
	}

	public void deleteDetail(Map<String, Object> map) {
		delete("schedule.deleteDetail", map);
		
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> scheduleDetailOne(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("schedule.scheduleDetailOne", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> scheduleSearchList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("schedule.scheduleSearchList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> scheduleLikeList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("schedule.scheduleLikeList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> searchMap(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("schedule.searchMap", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchAreaMap(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("schedule.searchAreaMap", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> cityMap(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("schedule.cityMap", map);
	}
	
}
