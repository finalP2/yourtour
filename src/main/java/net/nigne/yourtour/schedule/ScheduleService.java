package net.nigne.yourtour.schedule;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.stereotype.Service;

@Service
public class ScheduleService implements ScheduleDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void scheduleWrite(ScheduleModel scheduleModel) {
		sqlSessionTemplate.insert("schedule.scheduleWrite", scheduleModel);
	}
	@Override
	public ScheduleModel scheduleLastWrite(String email) {
		return sqlSessionTemplate.selectOne("schedule.scheduleLastWrite", email);
	}
	@Override
	public List<ScheduleModel> scheduleList() {
		return sqlSessionTemplate.selectList("schedule.scheduleList");
	}
	@Override
	public ScheduleModel scheduleSelectOne(ScheduleModel scheduleModel) {
		return sqlSessionTemplate.selectOne("schedule.scheduleSelectOne", scheduleModel);
	}
	
	@Override
	public void scheduleDayinsert(ScheduleDayModel scheduleDayModel) {
		sqlSessionTemplate.insert("schedule.scheduleDayinsert", scheduleDayModel);
	}
	
	@Override
	public void scheduleLikeinsert(ScheduleLikeModel scheduleLikeModel) {
		sqlSessionTemplate.insert("schedule.likeinsert", scheduleLikeModel);
	}
	
	@Override
	public ScheduleLikeModel scheduleLikeChk(ScheduleLikeModel scheduleLikeModel) {
		return sqlSessionTemplate.selectOne("schedule.scheduleLikeChk", scheduleLikeModel);
	}
	
	@Override
	public void scheduleLikeupdate(ScheduleModel scheduleModel) {
		sqlSessionTemplate.update("schedule.likeupdate", scheduleModel);
	}
	
	@Override
	public void scheduleCommentWrite(ScheduleCommentModel scheduleCommentModel) {
		sqlSessionTemplate.insert("schedule.scheduleCommentWrite", scheduleCommentModel);
	}
	
	/*
	@Override
	public List<ScheduleModel> scheduleAreaList(ScheduleModel scheduleModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("schedule.scheduleAreaList", scheduleModel);
	}
	
	@Override
	public void insertArea(ScheduleModel scheduleModel) {
		sqlSessionTemplate.insert("schedule.insertArea", scheduleModel);
	}
	
	@Override
	public void deleteArea(ScheduleModel scheduleModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("schedule.deleteArea", scheduleModel);
	}
	
	
	
	@Override
	public ScheduleModel scheduleWriteSelect(ScheduleModel scheduleModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("schedule.scheduleWriteSelect", scheduleModel);
	}
	
	
	
	@Override
	public List<ScheduleModel> scheduleIncompleteList(String m_email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("schedule.scheduleIncompleteList", m_email);
	}

	@Override
	public int scheduleComplete(int s_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("schedule.scheduleComplete", s_no);
	}

	@Override
	public int scheduleCompleteCount(int s_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("schedule.scheduleCompleteCount", s_no);
	}

	@Override
	public ScheduleModel selectNextTurn(ScheduleModel scheduleModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("schedule.selectNextTurn",scheduleModel);
	}
	@Override
	public ScheduleModel selectPreTurn(ScheduleModel scheduleModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("schedule.selectPreTurn",scheduleModel);
	}
	@Override
	public int preTurnUp(int turn, int s_no, int s_detail_turn, int s_idx) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("turn", turn);
		map.put("s_no", s_no);
		map.put("s_detail_turn", s_detail_turn);
		map.put("s_idx", s_idx);
		return sqlSessionTemplate.update("schedule.preTurnUp",map);
	}
	@Override
	public int nextTurnDown(int s_no, int s_detail_turn, int s_detail_no,int s_idx) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("s_detail_no", s_detail_no);
		map.put("s_no", s_no);
		map.put("s_detail_turn", s_detail_turn);
		map.put("s_idx", s_idx);
		return sqlSessionTemplate.update("schedule.nextTurnDown",map);
	}

	@Override
	public int writeMemo(ScheduleModel scheduleModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("schedule.writeMemo",scheduleModel);
	}

	@Override
	public void scheduleShare(String s_together) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("schedule.scheduleShare",s_together);
	}

	@Override
	public List<ScheduleModel> togetherList(int s_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("schedule.togetherList",s_no);
	}

	
	

	@Override
	public List<ScheduleModel> scheduleSearchList(String state_name) {
		return sqlSessionTemplate.selectList("schedule.scheduleSearchList", state_name);
	}

	@Override
	public List<ScheduleModel> scheduleHitList() {
		return sqlSessionTemplate.selectList("schedule.scheduleHitList");
	}
	

	@Override
	public ScheduleModel scheduleDetail(int s_no) {
		return sqlSessionTemplate.selectOne("schedule.scheduleDetail", s_no);
	}
	
	@Override
	public List<ScheduleModel> schDetail(int s_no) {
		return sqlSessionTemplate.selectList("schedule.schDetail", s_no);
	}
	
	@Override
	public List<ScheduleModel> DayList(int s_idx, int s_no) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("s_idx", s_idx);
		hm.put("s_no", s_no);
		return sqlSessionTemplate.selectList("schedule.dayList", hm);
	}

	@Override
	public int zzimCheck(String m_email, int s_no) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_email", m_email);
		hm.put("s_no", s_no);
		return sqlSessionTemplate.selectOne("schedule.zzimCheck", hm);
	}
	
	@Override
	public int scheduleUpdateReadhit(int s_no) {
		return sqlSessionTemplate.update("schedule.scheduleUpdateReadhit", s_no);
	}
	

	@Override
	public int sch_commCount(int s_no) {
		return sqlSessionTemplate.selectOne("schedule.sch_commCount", s_no);
	}
	
	
	@Override
	public List<SchCommentModel> sch_comList(int s_no) {
		return sqlSessionTemplate.selectList("schedule.schCommentList", s_no);
	}


	@Override
	public void schComment(SchCommentModel schCommentModel) {
		sqlSessionTemplate.insert("schedule.schCommentWrite", schCommentModel);
	}


	@Override
	public void schCommentDelete(int s_no) {
		sqlSessionTemplate.delete("schedule.schCommentDelete", s_no);
	}


	@Override
	public int areaCount(int s_no) {
		return sqlSessionTemplate.selectOne("schedule.areaCount", s_no);
	}


	@Override
	public void schZzim1(int s_no, String m_email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("s_no", s_no);
		hm.put("m_email", m_email);
		sqlSessionTemplate.insert("schedule.schZzim1", hm);
	}
	

	@Override
	public void schZzim2(int s_no, String m_email) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("s_no", s_no);
		hm.put("m_email", m_email);
		sqlSessionTemplate.delete("schedule.schZzim2", hm);
	}

	@Override
	public List<ScheduleModel> schDetailList(int s_no) {
		return sqlSessionTemplate.selectList("schedule.schDetailList", s_no);
	}


	@Override
	public int schDownload(ScheduleModel scheduleModel) {
		sqlSessionTemplate.insert("schedule.schDownload", scheduleModel);
		return sqlSessionTemplate.selectOne("schedule.selectCurrval");
		
	}

	@Override
	public void schDownDetail(List<ScheduleModel> schDetailList, int ss_no) {
		
		for(int i=0; i<schDetailList.size(); i++){
			ScheduleModel scheduleModel = schDetailList.get(i);
			scheduleModel.setS_no(ss_no);
			
			sqlSessionTemplate.insert("schedule.schDownDetail", scheduleModel);
		}
	}

	@Override
	public List<ScheduleModel> mapList(int s_no) {
		return sqlSessionTemplate.selectList("schedule.mapList", s_no);
	}

	@Override
	public List<ScheduleModel> s_together(int s_no) {
		return sqlSessionTemplate.selectList("schedule.s_together", s_no);
	}

	@Override
	public ScheduleModel selectS_idx(int s_no) {
		return sqlSessionTemplate.selectOne("schedule.selectS_idx", s_no);
	}

	@Override
	public ScheduleModel selectStateCity(int s_no) {
		return sqlSessionTemplate.selectOne("schedule.selectStateCity", s_no);
	}


	@Override
	public void deleteSchedule(int s_no) {
		sqlSessionTemplate.delete("schedule.deleteSchedule", s_no);
	}
*/
	



}
