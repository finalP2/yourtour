package net.nigne.yourtour.hotel.service;

import java.util.List;
import java.util.Map;

public interface HotelService {

	List<Map<String, Object>> hotelList(Map<String, Object> map) throws Exception;

	void hotelWrite(Map<String, Object> map) throws Exception;

	void fileupload(Map<String, Object> map) throws Exception;

	Map<String, Object> hotelDetail(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> hotel_imgList(Map<String, Object> map) throws Exception;

	Map<String, Object> hotelLastWrite() throws Exception;

	void hotelMainImgModify(Map<String, Object> map) throws Exception;

}
