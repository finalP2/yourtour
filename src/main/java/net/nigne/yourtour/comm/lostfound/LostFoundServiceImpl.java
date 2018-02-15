package net.nigne.yourtour.comm.lostfound;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.nigne.yourtour.comm.common.service.AbstractService;
import net.nigne.yourtour.common.util.FileUtils;

@Service("lostfoundService")
public class LostFoundServiceImpl implements AbstractService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="lostfoundDAO")
	private LostFoundDAO lostfoundDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return lostfoundDAO.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		lostfoundDAO.insertBoard(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){
			lostfoundDAO.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		lostfoundDAO.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = lostfoundDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);
		
//		List<Map<String,Object>> list = lostfoundDAO.selectFileList(map);
//		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception{
		lostfoundDAO.updateBoard(map);
		
		lostfoundDAO.deleteFileList(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++){
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				lostfoundDAO.insertFile(tempMap);
			}
			else{
				lostfoundDAO.updateFile(tempMap);
			}
		}
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		lostfoundDAO.deleteBoard(map);
	}

	@Override
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void commentAdd(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void commentDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
