package net.nigne.yourtour.hotel.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.nigne.yourtour.common.dao.AbstractDAO;
@Repository("hotelDAO")
public class HotelDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> hotelList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("hotel.hotelList", map);
	}

	public void hotelWrite(Map<String, Object> map) {
		insert("hotel.hotelWrite", map);
		
	}

	public void fileupload(Map<String, Object> map) {
		insert("hotel.fileupload", map);
		
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> hotelDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("hotel.hotelDetail", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> hotel_imgList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("hotel.hotel_imgList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> hotelLastWrite() {
		return (Map<String, Object>) selectOne("hotel.hotelLastWrite");
	}


	public void hotelMainImgModify(Map<String, Object> map) {
		update("hotel.hotelMainImgModify", map);
		
	}

}
