package net.nigne.yourtour.area.service;

import java.util.List;
import java.util.Map;

public interface AreaService {

	void areaDelete(Map<String, Object> map) throws Exception;

	void fileupload(Map<String, Object> map) throws Exception;

	void areaWrite(Map<String, Object> map) throws Exception;

	Map<String, Object> area_mainImg(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> area_imgList(Map<String, Object> map) throws Exception;

	Map<String, Object> areaDetail(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> areaSearch(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> areaList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> cityAreaList(Map<String, Object> map) throws Exception;

	Map<String, Object> areaLastWrite() throws Exception;

	void areaMainImgModify(Map<String, Object> map) throws Exception;

	Map<String, Object> searchMap(Map<String, Object> map) throws Exception;


}
