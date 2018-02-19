package net.nigne.yourtour.comm.review;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.nigne.yourtour.comm.common.dao.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		List<Map<String, Object>> result = null;
		if(map.containsKey("searchType")) {
			if(map.get("searchType").toString().equals("TAG")) {
				String keyword = map.get("searchKeyword").toString();
				String[] keywords = keyword.split("\\s*,\\s*");
				List<String> tagSource = new ArrayList<String>();

				//searchTagBoardList 쓰려고 만들었던 코드
				for(int i=0; i<keywords.length;i++) {
					tagSource.add(keywords[i]);
				}
				map.put("tags", tagSource);

				result = (List<Map<String, Object>>)selectPagingList("review.searchTagBoardList", map);
			}else {
				result = (List<Map<String, Object>>)selectPagingList("review.searchBoardList", map);
			}
		}else {
			result = (List<Map<String, Object>>)selectPagingList("review.selectBoardList", map);
		}
		return result;
	}
	
	
	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("review.insertBoard", map);
	}
	// 컨텐트 내용 변경해서 다시 넣기 위한 쿼리 시리즈
	public String getLastIDX() throws Exception {
		return selectOne("review.getLastIDX").toString();
	}
	public void putContent(Map<String, Object> map) throws Exception {
		update("review.putContent", map);
	}
	
	
	// 태그 넣기 위한 쿼리 시리즈. 태그테이블에 있으면 업데이트 없으면 인서트, 그리고 태그맵 테이블 인서트
	public void tagInput(String tag) throws Exception {
		update("review.tagInput", tag);
	}
	public int getTagId(String tag) throws Exception {
		return (int) selectOne("review.getTagId", tag);
	}
	public void tagmapInput(Map<String, Object> map) throws Exception {
		insert("review.tagmapInput", map);
	}
	
	
	public void removeTag(Map<String, Object> removeTag) {
		update("review.removeTag", removeTag);
	}
	public void removeTagmap(Map<String, Object> removeTag) {
		update("review.removeTagmap", removeTag);
	}
	public void updateArticleTag(Map<String, Object> map) {
		update("review.updateArticleTag", map);
	}
	
	
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("review.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("review.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception{
		update("review.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{
		update("review.deleteBoard", map);
	}

	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception{
		List<Map<String, Object>> result = (List<Map<String, Object>>)selectPagingList("review.selectCommentList", map);
		return result;
	}
	
	
	// 파일 관련해서는 마지막에 전반적으로 손볼것
	public void insertFile(Map<String, Object> map) throws Exception{
		insert("review.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("review.selectFileList", map);
	}

	
	public void commentUpdateRE_STEP(Map<String,Object> map) {
		update("review.commentUpdateRE_STEP", map);
	}
	public Map<String, Object> commentAdd(Map<String, Object> map) {
		insert("review.commentAdd", map);	
		return map;
	}
	public void commentUpdateREF(Map<String,Object> map) {
		update("review.commentUpdateREF", map);	
	}

	public void commentDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("review.commentDelete", map);
	}
	// 글 리스트에 표시하려고 댓글 갯수만 가져오기
	public int commentCount(Map<String, Object> map) {
		return (int) selectOne("review.commentCount", map);
	}
}
