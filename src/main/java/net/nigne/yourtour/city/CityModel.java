package net.nigne.yourtour.city;

public class CityModel {
	
	//CITY 테이블
	private int no; //도시번호
	private String name; //도시이름
	private String content; //도시설명
	private String country; //국가이름
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
}
