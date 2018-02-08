package net.nigne.yourtour.area.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.nigne.yourtour.area.dao.AreaDAO;
import net.nigne.yourtour.common.util.FileUtils;

@Service("areaService")
public class AreaServiceImpl implements AreaService{
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="areaDAO")
	private AreaDAO areaDAO;
	
	@Override
	public List<Map<String, Object>> cityAreaList(Map<String, Object> map) throws Exception {
		return areaDAO.cityAreaList(map);
	}
	
	@Override
	public List<Map<String, Object>> areaList(Map<String, Object> map) throws Exception {
		return areaDAO.areaList(map);
	}
	
	@Override
	public List<Map<String, Object>> areaSearch(Map<String, Object> map) throws Exception {
		return areaDAO.areaSearch(map);
	}
	
	
	@Override
	public Map<String, Object> areaDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = areaDAO.areaDetail(map);
		return tempMap;
	}
	
	@Override
	public List<Map<String, Object>> area_imgList(Map<String, Object> map) throws Exception {
		return areaDAO.area_imgList(map);
	}
	
	@Override
	public Map<String, Object> area_mainImg(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = areaDAO.area_mainImg(map);
		return tempMap;
	}
	
	@Override
	public void areaWrite(Map<String, Object> map) throws Exception {
		areaDAO.areaWrite(map);
	}
	
	@Override
	public void fileupload(Map<String, Object> map) throws Exception {
		areaDAO.fileupload(map);
	}
	
	@Override
	public void areaDelete(Map<String, Object> map) throws Exception {
		areaDAO.areaDelete(map);
	}
	
	@Override
	public Map<String, Object> areaLastWrite() throws Exception {
		Map<String, Object> tempMap = areaDAO.areaLastWrite();
		return tempMap;
	}
	@Override
	public void areaMainImgModify(Map<String, Object> map) throws Exception {
		areaDAO.areaMainImgModify(map);
	}
	
	@Override
	public Map<String, Object> searchMap(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = areaDAO.searchMap(map);
		return tempMap;
	}
}
