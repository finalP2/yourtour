package net.nigne.yourtour.comm.common.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AbstractService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

	void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;

	void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception;

	void commentAdd(Map<String, Object> map) throws Exception;

	void commentDelete(Map<String, Object> map) throws Exception;

}