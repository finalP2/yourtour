package net.nigne.yourtour.schedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.nigne.yourtour.common.util.FileUtils;
import net.nigne.yourtour.schedule.dao.ScheduleDAO;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="scheduleDAO")
	private ScheduleDAO scheduleDAO;
	
	@Override
	public List<Map<String, Object>> scheduleList(Map<String, Object> map) throws Exception {
		return scheduleDAO.scheduleList(map);
	}

	@Override
	public void scheduleWrite(Map<String, Object> map) throws Exception {
		scheduleDAO.scheduleWrite(map);
		
	}

	@Override
	public Map<String, Object> scheduleLastWrite(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = scheduleDAO.scheduleLastWrite(map);
		return tempMap;
	}

	@Override
	public void updateHitCnt(Map<String, Object> map, HttpServletRequest request) throws Exception {
		scheduleDAO.updateHitCnt(map);
		
	}

	@Override
	public void scheduleDayinsert(Map<String, Object> map) throws Exception {
		scheduleDAO.scheduleDayinsert(map);
		
	}

	@Override
	public void likeinsert(Map<String, Object> map) throws Exception {
		scheduleDAO.likeinsert(map);
		
	}

	@Override
	public Map<String, Object> scheduleLikeChk(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = scheduleDAO.scheduleLikeChk(map);
		resultMap.put("map", tempMap);
		
		return resultMap;
	}

	@Override
	public void likeupdate(Map<String, Object> map) throws Exception {
		scheduleDAO.likeupdate(map);
		
	}

	@Override
	public void scheduleCommentWrite(Map<String, Object> map) throws Exception {
		scheduleDAO.scheduleCommentWrite(map);
		
	}

	@Override
	public Map<String, Object> scheduleSelectOne(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap =  scheduleDAO.scheduleSelectOne(map);
		return tempMap;
	}
	@Override
	public List<Map<String, Object>> schcityList(Map<String, Object> map) throws Exception {
		return scheduleDAO.schcityList(map);
	}
	
	@Override
	public List<Map<String, Object>> commentList(Map<String, Object> map) throws Exception {
		return scheduleDAO.commentList(map);
	}
	
	@Override
	public void commentDelete(Map<String, Object> map) throws Exception {
		scheduleDAO.commentDelete(map);
	}
	@Override
	public List<Map<String, Object>> scheduleDay(Map<String, Object> map) throws Exception {
		return scheduleDAO.scheduleDay(map);
	}
	
	@Override
	public List<Map<String, Object>> scheduleDetailList(Map<String, Object> map) throws Exception {
		return scheduleDAO.scheduleDetailList(map);
	}
	@Override
	public void insertDetail(Map<String, Object> map) throws Exception {
		scheduleDAO.insertDetail(map);
		
	}
}
