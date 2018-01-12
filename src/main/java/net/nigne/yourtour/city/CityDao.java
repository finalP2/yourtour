package net.nigne.yourtour.city;

import java.util.List;

public interface CityDao {
	
	//도시 검색
	public List<CityModel> schCitySearch(String country, String keyword);
	
	//스케쥴 - 도시 리스트 보기
	public List<CityModel> schCityList(String country);
	
	//도시 리스트 보기
	public List<CityModel> cityList(String country);
	
	//도시 상세보기
	public CityModel cityDetail(int no);

	/*//도시 글쓰기
	public Object cityWrite(CityModel cityModel);
	
	//파일 업로드 할 때 도시 번호(no) 보내주기
	public int selectSeq();
	
	//파일 업로드
	public void fileupload(String org_name, String sav_name, int city_no);*/
	
	
	//도시 상세보기 할 때 이미지 리스트도 같이 불러오기
	public List<CityModel> city_imgList(int city_no);
	
	public CityModel city_mainImg(int city_no);

	public CityModel citySelectOne(String city_name);

}
