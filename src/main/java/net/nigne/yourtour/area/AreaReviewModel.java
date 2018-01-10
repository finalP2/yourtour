package net.nigne.yourtour.area;

import java.util.Date;

public class AreaReviewModel {
	
	private int no;
	private String email;
	private int area_no;
	private String content;
	private Date writedate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getArea_no() {
		return area_no;
	}
	public void setArea_no(int area_no) {
		this.area_no = area_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	
}
