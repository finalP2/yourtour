package net.nigne.yourtour.city.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.nigne.yourtour.city.dao.CityDAO;
import net.nigne.yourtour.common.util.FileUtils;
import net.nigne.yourtour.schedule.service.ScheduleService;

@Service("cityService")
public class CityServiceImpl implements CityService{
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="cityDAO")
	private CityDAO cityDAO;
	
	//도시리스트 검색
	@Override
	public List<Map<String, Object>> schCitySearch(Map<String, Object> map) throws Exception {
		return cityDAO.schcitySearch(map);
	}
	
	//여행지 탭에서 도시 리스트 불러오기
	@Override
	public List<Map<String, Object>> cityList(Map<String, Object> map) throws Exception {
		return cityDAO.cityList(map);
	}
	
	//도시 글 상세보기
	@Override
	public Map<String, Object> cityDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap =  cityDAO.cityDetail(map);
		return tempMap;
	}
	
	@Override
	public List<Map<String, Object>> city_imgList(Map<String, Object> map) throws Exception {
		return cityDAO.city_imgList(map);
	}
	
	@Override
	public Map<String, Object> city_mainImg(Map<String, Object> map) throws Exception {
		return cityDAO.city_mainImg(map);
	}
	//도시 이름으로 불러오기
	@Override
	public Map<String, Object> citySelectOne(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap =  cityDAO.citySelectOne(map);
		return tempMap;
	}
	
}
