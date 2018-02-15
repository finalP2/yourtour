package net.nigne.yourtour.hotel.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.nigne.yourtour.common.util.FileUtils;
import net.nigne.yourtour.hotel.dao.HotelDAO;

@Service("hotelService")
public class HotelServiceImpl implements HotelService {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="hotelDAO")
	private HotelDAO hotelDAO;
	@Override
	public List<Map<String, Object>> hotelList(Map<String, Object> map) throws Exception {
		return hotelDAO.hotelList(map);
	}
	

	@Override
	public void hotelWrite(Map<String, Object> map) throws Exception {
		hotelDAO.hotelWrite(map);
	}
	
	@Override
	public void fileupload(Map<String, Object> map) throws Exception {
		hotelDAO.fileupload(map);
	}

	@Override
	public Map<String, Object> hotelDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = hotelDAO.hotelDetail(map);
		return tempMap;
	}
	@Override
	public List<Map<String, Object>> hotel_imgList(Map<String, Object> map) throws Exception {
		return hotelDAO.hotel_imgList(map);
	}
	@Override
	public Map<String, Object> hotelLastWrite() throws Exception {
		Map<String, Object> tempMap = hotelDAO.hotelLastWrite();
		return tempMap;
	}

	@Override
	public void hotelMainImgModify(Map<String, Object> map) throws Exception {
		hotelDAO.hotelMainImgModify(map);
	}
	
}
