package net.nigne.yourtour.comm.accompany;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Repository;

import net.nigne.yourtour.comm.common.dao.AbstractDAO;

@Repository("accompanyDAO")
public class AccompanyDAO extends AbstractDAO{

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

				result = (List<Map<String, Object>>)selectPagingList("accompany.searchTagBoardList", map);
			}else {
				result = (List<Map<String, Object>>)selectPagingList("accompany.searchBoardList", map);
			}
		}else if(map.containsKey("MY_ARTICLE")){
			result = (List<Map<String, Object>>)selectPagingList("accompany.selectMyArticle", map);
		}else if(map.containsKey("MY_ZZIM")){
			result = (List<Map<String, Object>>)selectPagingList("accompany.selectMyZzimList", map);
		}else {
			result = (List<Map<String, Object>>)selectPagingList("accompany.selectBoardList", map);
		}
		return result;
	}
	
	
	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("accompany.insertBoard", map);
	}
	// 컨텐트 내용 변경해서 다시 넣기 위한 쿼리 시리즈
	public String getLastIDX() throws Exception {
		return selectOne("accompany.getLastIDX").toString();
	}
	public void putContent(Map<String, Object> map) throws Exception {
		update("accompany.putContent", map);
	}
	
	
	// 태그 넣기 위한 쿼리 시리즈. 태그테이블에 있으면 업데이트 없으면 인서트, 그리고 태그맵 테이블 인서트
	public void tagInput(String tag) throws Exception {
		update("accompany.tagInput", tag);
	}
	public int getTagId(String tag) throws Exception {
		return (int) selectOne("accompany.getTagId", tag);
	}
	public void tagmapInput(Map<String, Object> map) throws Exception {
		insert("accompany.tagmapInput", map);
	}
	
	
	public void removeTag(Map<String, Object> removeTag) {
		update("accompany.removeTag", removeTag);
	}
	public void removeTagmap(Map<String, Object> removeTag) {
		update("accompany.removeTagmap", removeTag);
	}
	public void updateArticleTag(Map<String, Object> map) {
		update("accompany.updateArticleTag", map);
	}
	
	
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("accompany.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("accompany.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception{
		update("accompany.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{
		update("accompany.deleteBoard", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception{
		List<Map<String, Object>> result = null;
		if(!map.containsKey("ZZIMLIST")) {
			result = (List<Map<String, Object>>)selectPagingList("accompany.selectCommentList", map);
		}else if(map.get("ZZIMLIST").toString().equals("y")) {
			result = (List<Map<String, Object>>)selectPagingList("accompany.selectZzimCommentList", map);
		}		
		return result;
	}
	
	

	
	public void commentUpdateRE_STEP(Map<String,Object> map) {
		update("accompany.commentUpdateRE_STEP", map);
	}
	public Map<String, Object> commentAdd(Map<String, Object> map) {
		insert("accompany.commentAdd", map);	
		return map;
	}
	public void commentUpdateREF(Map<String,Object> map) {
		update("accompany.commentUpdateREF", map);	
	}

	public void commentDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("accompany.commentDelete", map);
	}
	// 글 리스트에 표시하려고 댓글 갯수만 가져오기
	public int commentCount(Map<String, Object> map) {
		return (int) selectOne("accompany.commentCount", map);
	}
	public int zzimCount(Map<String, Object> map) {
		return (int) selectOne("accompany.zzimCount", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> getLatestComment(Map<String, Object> map){
		return (Map<String, Object>) selectOne("accompany.getLatestComment", map);
	}
	public void addZzim(Map<String, Object> map) {
		insert("accompany.addZzim", map);	
	}
}
