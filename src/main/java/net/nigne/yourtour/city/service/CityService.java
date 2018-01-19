package net.nigne.yourtour.city.service;

import java.util.List;
import java.util.Map;

public interface CityService {

	List<Map<String, Object>> schCitySearch(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> cityList(Map<String, Object> map) throws Exception;

	Map<String, Object> cityDetail(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> city_imgList(Map<String, Object> map) throws Exception;

	Map<String, Object> city_mainImg(Map<String, Object> map) throws Exception;

	Map<String, Object> citySelectOne(Map<String, Object> map) throws Exception;

}
