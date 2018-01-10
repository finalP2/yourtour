package net.nigne.yourtour.schedule;

import java.util.Date;

public class ScheduleDetailModel {			
	private int no;				
	private String memo;
	private int sch_day_no;
	private int area_no;
	private int sch_no;
	private int detail_turn;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getSch_day_no() {
		return sch_day_no;
	}
	public void setSch_day_no(int sch_day_no) {
		this.sch_day_no = sch_day_no;
	}
	public int getArea_no() {
		return area_no;
	}
	public void setArea_no(int area_no) {
		this.area_no = area_no;
	}
	public int getSch_no() {
		return sch_no;
	}
	public void setSch_no(int sch_no) {
		this.sch_no = sch_no;
	}
	public int getDetail_turn() {
		return detail_turn;
	}
	public void setDetail_turn(int detail_turn) {
		this.detail_turn = detail_turn;
	}
	
	
}
