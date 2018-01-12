package net.nigne.yourtour.city;

public class CityImgModel {
	
	//CITY_IMG 테이블
	private int no; //도시 사진 번호
	private String org_name; //도시 사진 원본이름
	private String sav_name; //도시 사진 저장이름
	private int city_no; //도시번호
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public String getSav_name() {
		return sav_name;
	}
	public void setSav_name(String sav_name) {
		this.sav_name = sav_name;
	}
	public int getCity_no() {
		return city_no;
	}
	public void setCity_no(int city_no) {
		this.city_no = city_no;
	}

}
