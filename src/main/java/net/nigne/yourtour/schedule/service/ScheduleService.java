package net.nigne.yourtour.schedule.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.nigne.yourtour.common.common.CommandMap;


public interface ScheduleService {
	List<Map<String, Object>> scheduleList(Map<String, Object> map) throws Exception;

	void scheduleWrite(Map<String, Object> map) throws Exception;

	Map<String, Object> scheduleLastWrite(Map<String, Object> map) throws Exception;

	void updateHitCnt(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void scheduleDayinsert(Map<String, Object> map) throws Exception;
	
	void likeinsert(Map<String, Object> map) throws Exception;
	
	Map<String, Object> scheduleLikeChk(Map<String, Object> map) throws Exception;
	
	void likeupdate(Map<String, Object> map) throws Exception;
	
	void scheduleCommentWrite(Map<String, Object> map) throws Exception;

	Map<String, Object> scheduleSelectOne(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> schcityList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> commentList(Map<String, Object> map) throws Exception;

	void commentDelete(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> scheduleDay(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> scheduleDetailList(Map<String, Object> map) throws Exception;

	void insertDetail(Map<String, Object> map) throws Exception;

	void updateAreaLike(Map<String, Object> map) throws Exception;

	void deleteDetail(Map<String, Object> map) throws Exception;

	Map<String, Object> scheduleDetailOne(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> scheduleSearchList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> scheduleLikeList(Map<String, Object> map) throws Exception;

	Map<String, Object> searchMap(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> searchAreaMap(Map<String, Object> map) throws Exception;

	Map<String, Object> cityMap(Map<String, Object> map) throws Exception;
}
