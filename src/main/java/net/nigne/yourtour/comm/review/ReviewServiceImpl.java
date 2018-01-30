package net.nigne.yourtour.comm.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.nigne.yourtour.comm.common.service.AbstractService;
import net.nigne.yourtour.common.util.FileUtils;

@Service("reviewService")
public class ReviewServiceImpl implements AbstractService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return reviewDAO.selectBoardList(map);
	}

	@Override
	@Transactional
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		reviewDAO.insertBoard(map);
		int maxIdx = Integer.parseInt(reviewDAO.getLastIDX());
		
		// 아래: 전체 컨텐츠 내용을 가져와서
		String source = map.get("CONTENT").toString();
		// 아래: 파일이름 부분을 검사해서 각각 string[] 에 저장한다, 복사원본(tempFilenames), 타겟(filenames)
		// 아래: 반복문 안에서 파일 이동까지 진행
		String[] tempFilenames = source.split("/yourtour/common/GetTempFile.go?filename=");
		String[] filenames = new String[tempFilenames.length];
		for(int i=0; i<tempFilenames.length; i++) {
			tempFilenames[i] = tempFilenames[i].substring(0, tempFilenames[i].indexOf("\""));
			filenames[i] = tempFilenames[i].substring(tempFilenames[i].indexOf("_")+1);
			fileUtils.moveToReal("tempFilenames[i]", "review", maxIdx, "filenames[i]");
		}
		
		
		// 아래: replaceAll(정규식) 이용해서 'GetTempFile' --> 'GetFile'
		// 아래: 파일주소의 time 부분을 제거하고, '리뷰' 게시판정보(review)와 글번호를 대신 넣어준다
		source.replaceAll("GetTempFile.go?filename=([0-9]*)_", "GetFile.go?cate=review&idx="+maxIdx+"filename=");


	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		reviewDAO.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = reviewDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);
		
//		List<Map<String,Object>> list = reviewDAO.selectFileList(map);
//		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception{
		reviewDAO.updateBoard(map);
		
		reviewDAO.deleteFileList(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++){
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				reviewDAO.insertFile(tempMap);
			}
			else{
				reviewDAO.updateFile(tempMap);
			}
		}
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		reviewDAO.deleteBoard(map);
	}
	
	
	//댓글
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception {
		return reviewDAO.selectCommentList(map);
	}

	@Transactional
	@Override
	public void commentAdd(Map<String, Object> map) throws Exception {
		if(Integer.parseInt(map.get("REF").toString()) > -1)
			reviewDAO.commentUpdateRE_STEP(map);
		
		reviewDAO.commentAdd(map);
		
		if(Integer.parseInt(map.get("REF").toString()) == -1)
			reviewDAO.commentUpdateREF(map);
	}
	
	public void commentDelete(Map<String, Object> map) throws Exception{
		reviewDAO.commentDelete(map);
	}
}
