package net.nigne.yourtour.city.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.nigne.yourtour.common.dao.AbstractDAO;

@Repository("cityDAO")
public class CityDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> schcitySearch(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("city.schcitySearchList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> cityList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("city.cityList", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> cityDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("city.cityDetail", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> city_imgList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("city.city_imgList", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> city_mainImg(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("city.city_mainImg", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> citySelectOne(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("city.citySelectOne", map);
	}


}
