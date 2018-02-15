package net.nigne.yourtour.comm.loss;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.nigne.yourtour.comm.common.service.AbstractService;
import net.nigne.yourtour.common.util.FileUtils;

@Service("lossService")
public class LossServiceImpl implements AbstractService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="lossDAO")
	private LossDAO lossDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return lossDAO.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		lossDAO.insertBoard(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){
			lossDAO.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		lossDAO.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = lossDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);
		
//		List<Map<String,Object>> list = lossDAO.selectFileList(map);
//		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception{
		lossDAO.updateBoard(map);
		
		lossDAO.deleteFileList(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++){
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				lossDAO.insertFile(tempMap);
			}
			else{
				lossDAO.updateFile(tempMap);
			}
		}
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		lossDAO.deleteBoard(map);
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
