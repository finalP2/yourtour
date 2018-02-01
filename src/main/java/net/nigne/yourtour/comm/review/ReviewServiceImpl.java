package net.nigne.yourtour.comm.review;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
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
		
//		String text = "......";
//		String textWithoutTag = text.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		List<Map<String, Object>> list = reviewDAO.selectBoardList(map);
		
		Iterator<Map<String, Object>> iter = list.iterator();
		while(iter.hasNext()) {
			Map<String, Object> tempMap = iter.next(); 
			String source = tempMap.get("CONTENT").toString();
			String target = source.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			target = target.replaceAll("<", "");
			System.out.println(target);
			tempMap.put("CONTENT", target);
		}
		
		return list;
	}

	@Override
	@Transactional
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {

		// 아래: 일단 입력받은 태그에 중복값이 없는지 확인
		// 태그가 있으면 검사하고, 중복된 값이 있으면 리스트에서 제거해준다
		List<String> tags = new ArrayList<String>(Arrays.asList(map.get("TAG").toString().trim().split("\\s*,\\s*")));
		if(tags.size() > 0) {
//			System.out.println(",,");
//			System.out.println("map.get(\"TAG\") : "+map.get("TAG").toString());
//			System.out.println("tags.size() : "+tags.size());
			List<Integer> duplicatedPosition = new ArrayList<Integer>();
			for(int i=0; i<tags.size()-1; i++) {
				for(int j=i+1; j<tags.size(); j++) {
					if(tags.get(i).equals(tags.get(j))) {
						duplicatedPosition.add(i);
//						System.out.println("duplicatedPosition Added!! size() : "+duplicatedPosition.size()+", position : "+duplicatedPosition.get(duplicatedPosition.size()-1));
						break;
					}
				}
			}
			if(duplicatedPosition.size() > 0) {
				for(int i=duplicatedPosition.size() - 1; i>=0; i--) {
					tags.remove((int)duplicatedPosition.get(i));
//					System.out.println("i : "+i+", duplicatedPosition removed position : "+duplicatedPosition.get(i));
				}
			}
			// 중복제거된 리스트를 다시 문자열로 변환
			String concatTag = "";
			for(int i=0; i<tags.size(); i++) {
				concatTag = concatTag.concat(tags.get(i).toString()+",");
//				System.out.println("concatTag i : "+i+", string: "+concatTag);
			}
			// 마지막 콤마만 제거
			concatTag = concatTag.substring(0, concatTag.lastIndexOf(","));
			map.put("TAG", concatTag);
			
//			System.out.println("final concatTag : "+concatTag);
//			System.out.println("map.get(\"TAG\") : "+map.get("TAG").toString());
//			System.out.println(",,");
		}
		
		
		
		reviewDAO.insertBoard(map);
		int maxIdx = Integer.parseInt(reviewDAO.getLastIDX());
		int tagId;
		String tag;
		Map<String, Object> tempMap = new HashMap<String, Object>();
		
		// 아래: 전체 컨텐츠 내용을 가져와서
		String source = map.get("CONTENT").toString();
		// 아래: 파일이름 부분을 검사해서 각각 string[] 에 저장한다, 복사원본(tempFilenames), 타겟(filenames)
		// 아래: 반복문 안에서 파일 이동까지 진행 ** split 이용할때 ? 등은 정규식 문자라서 백슬래쉬 두개 붙여줘야 함
		String[] tempFilenames = source.split("/yourtour/common/GetTempFile.go\\?filename=");
		String[] filenames = new String[tempFilenames.length];
		
		if(tempFilenames.length > 1) {  // 잘리는게 있으면 길이가 2 이상이 나온다. 
										// 이미지가 없으면 filename[i] 쪽으로 subString 할때 StringIndexOutOfBound Exception 발생  
			for(int i=0; i<tempFilenames.length; i++) {
				tempFilenames[i] = tempFilenames[i].substring(0, tempFilenames[i].indexOf("\""));
				filenames[i] = tempFilenames[i].substring(tempFilenames[i].indexOf("_")+1);
				fileUtils.moveToReal(tempFilenames[i], "review", maxIdx, filenames[i]);
			}	
			// 아래: replaceAll(정규식) 이용해서 'GetTempFile' --> 'GetFile'
			// 아래: 파일주소의 time 부분을 제거하고, '리뷰' 게시판정보(review)와 글번호를 대신 넣어준다
			String target = source.replaceAll("GetTempFile.go.filename=[0-9]*_", "GetFile.go?cate=review&idx="+maxIdx+"&filename=");
			System.out.println(target);
	
			// 아래: 바뀐 문자열을 맵에 넣고 update 쿼리 해준다
			map.put("CONTENT", target);
		}
		reviewDAO.putContent(map);
		
		// 아래: 태그를 콤마 기준으로 잘라서 comm_tags, comm_tagmap 에 넣어주기
		System.out.println(tags.size());
		if(tags.size() > 1) {
			for(int i=0; i<tags.size(); i++) {
				// 태그테이블에 있으면 업데이트 없으면 인서트, 그리고 태그맵 테이블 인서트
				tag = tags.get(i);
				reviewDAO.tagInput(tag);
				// 태그 아이디 가져오기
				tagId = reviewDAO.getTagId(tag);
				// 태그맵에 넣을 정보 맵에 넣기
				tempMap.put("TAG_ID", tagId);
				tempMap.put("ARTICLEID", maxIdx);
				// 태그맵 인서트
				reviewDAO.tagmapInput(tempMap);
			}
		}
		
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
	@Transactional
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception{
		reviewDAO.updateBoard(map);
		
//		- 태그 저장할때
//		- 오리지날태그, 뉴태그 구분해서 전달.
//		- 뺄 태그, 그대로인 태그, 추가할 태그 세종류로 구분
//			- 이미 이 글에 있던 태그면 그냥 두고, 
//			- 새로 들어온 태그면 추가해 주고,
//			- 삭제된 태그가 있으면 없애주고..
		
		List<String> tags = new ArrayList<String>(Arrays.asList(map.get("TAG").toString().trim().split("\\s*,\\s*")));
		List<String> oriTags = new ArrayList<String>(Arrays.asList(map.get("oriTAG").toString().trim().split("\\s*,\\s*")));
		List<String> tagsToAdd = new ArrayList<String>();		// 추가할 태그 리스트
		List<String> tagsToRemove = new ArrayList<String>();	// 제거할 태그 리스트. 그냥 둘 태그는 처리하지 않는다.
		
		// 아래: 일단 입력받은 태그에 중복값이 없는지 확인
		// 태그가 있으면 검사하고, 중복된 값이 있으면 리스트에서 제거해준다
		if(tags.size() > 0) {
			List<Integer> duplicatedPosition = new ArrayList<Integer>();
			for(int i=0; i<tags.size()-1; i++) {
				for(int j=i+1; j<tags.size(); j++) {
					if(tags.get(i) == tags.get(j)) {
						duplicatedPosition.add(i);
					}
				}
			}
			if(duplicatedPosition.size() > 0) {
				for(int i=duplicatedPosition.size() - 1; i>0; i--) {
					tags.remove(i);
				}
			}
		}
		
		int checkSum = 0;
		for(int i=0; i<tags.size(); i++) {
			checkSum = 0;
			for(int j=0; j<oriTags.size(); j++) {
				if(!tags.get(i).equals(oriTags.get(i))) {
					checkSum++;
				}
			}
			if(checkSum == oriTags.size()) {
				tagsToAdd.add(tags.get(i));
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
