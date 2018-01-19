package net.nigne.yourtour.area.dao;

import net.nigne.yourtour.common.dao.AbstractDAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("areaDAO")
public class AreaDAO extends AbstractDAO{

	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> cityAreaList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("area.cityAreaList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> areaList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("area.areaList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> areaSearch(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("area.areaSearch", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> areaDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("area.areaDetail", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> area_imgList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("area.area_imgList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> area_mainImg(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("area.area_mainImg", map);
	}

	public void areaWrite(Map<String, Object> map) {
		insert("area.areaWrite", map);
		
	}

	public void fileupload(Map<String, Object> map) {
		insert("area.fileupload", map);
		
	}

	public void areaDelete(Map<String, Object> map) {
		delete("area.areaDelete",map);
		
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> areaLastWrite() {
		return (Map<String, Object>) selectOne("area.areaLastWrite");
	}

	public void areaMainImgModify(Map<String, Object> map) {
		update("area.areaMainImgModify", map);
		
	}
	
}
