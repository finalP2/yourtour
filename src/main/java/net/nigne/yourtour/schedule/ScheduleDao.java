package net.nigne.yourtour.schedule;

import java.util.List;

import net.nigne.yourtour.schedule.ScheduleModel;

public interface ScheduleDao {
	
	/*public List<ScheduleModel> togetherList(int s_no);
	
	public void scheduleShare(String s_together);
	
	public int writeMemo(ScheduleModel scheduleModel);
	
	public ScheduleModel selectPreTurn(ScheduleModel scheduleModel);
	public ScheduleModel selectNextTurn(ScheduleModel scheduleModel);
	public int preTurnUp(int turn, int s_no, int s_detail_turn, int s_idx);
	public int nextTurnDown(int s_no, int s_detail_turn, int s_detail_no, int s_idx);
	
	public int scheduleCompleteCount(int s_no);
	
	public int scheduleComplete(int s_no);
	
	public List<ScheduleModel> scheduleIncompleteList(String m_email);
	
	public List<ScheduleModel> scheduleAreaList(ScheduleModel scheduleModel);
	
	public void insertArea(ScheduleModel scheduleModel);
	
	public void deleteArea(ScheduleModel scheduleModel);
	
	;
	

	

	public ScheduleModel scheduleWriteSelect(ScheduleModel scheduleModel);*/
	

	public List<ScheduleModel> scheduleList();
	public void scheduleWrite(ScheduleModel scheduleModel);
	public ScheduleModel scheduleLastWrite(String email);
	/*
	public List<ScheduleModel> scheduleSearchList(String state_name);
	
	
	public List<ScheduleModel> scheduleHitList();

	public ScheduleModel scheduleDetail(int s_no);
	
	
	public List<ScheduleModel> schDetail(int s_no);
	
	
	public List<ScheduleModel> DayList(int s_idx, int s_no);
	
	
	public int zzimCheck(String m_email, int s_no);
	
	
	public int scheduleUpdateReadhit(int s_no);
	

	public int sch_commCount(int s_no);
	
	
	public List<SchCommentModel> sch_comList(int s_no);
	
	
	public void schComment(SchCommentModel schCommentModel);
	

	public void schCommentDelete(int s_no);
	
	
	public int areaCount(int s_no);
	
	
	public void schZzim1(int s_no, String m_email);
	
	
	public void schZzim2(int s_no, String m_email);
	
	
	public List<ScheduleModel> schDetailList(int s_no);
	
	
	public int schDownload(ScheduleModel scheduleModel);
	
	
	public void schDownDetail(List<ScheduleModel> schDetailList, int ss_no);
	

	public List<ScheduleModel> mapList(int s_no);

	public List<ScheduleModel> s_together(int s_no);
	

	public ScheduleModel selectS_idx(int s_no);
	
	
	public ScheduleModel selectStateCity(int s_no);
	
	
	public void deleteSchedule(int s_no);
*/
}
