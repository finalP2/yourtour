package net.nigne.yourtour.area;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class AreaService implements AreaDao {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	//스케쥴- 여행지 검색
	@Override
	public List<AreaModel> schAreaSearch(int city_no, String searchKeyword) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("city_no", city_no);
		map.put("searchKeyword", "%"+searchKeyword+"%");
		return sqlSessionTemplate.selectList("area.schAreaSearch", map);
	}

	//스케쥴- 여행지 리스트
	@Override
	public List<AreaModel> schAreaList(int city_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.schAreaList", city_no);
	}

	//스케쥴- 마커 찍을 장소 리스트
	@Override
	public List<AreaModel> markerAreaList(int city_no) {
		// TODO Auto-generated method stub
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("city_no", city_no);
		
		return sqlSessionTemplate.selectList("area.markerAreaList", map);
	}

	//스케쥴- 지역 번호로 여행지 리스트 불러오기
	@Override
	public List<AreaModel> cityAreaList(int city_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.cityAreaList", city_no);
	}

	//여행지 리스트 보기
	@Override
	public List<AreaModel> areaList(int city_no) {
		// TODO Auto-generated method stub
		
		
		return sqlSessionTemplate.selectList("area.areaList", city_no);
	}

	//여행지 리스트- 검색
	@Override
	public List<AreaModel> areaSearch(String searchKeyword, int city_no) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("searchKeyword", "%" + searchKeyword + "%");
		hm.put("city_no", city_no);
		
		return sqlSessionTemplate.selectList("area.areaSearch", hm);
	}

	//메인에서 인기 여행지 리스트 Like1로 불러오기
	@Override
	public List<AreaModel> areaLikeList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.areaLikeList");
	}

	//여행지 글 상세보기
	@Override
	public AreaModel areaDetail(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("areaDetail", no);
	}

	//여행지 글 상세보기 할 때 이미지 리스트 같이 불러오기
	@Override
	public List<AreaImgModel> area_imgList(int city_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.area_imgList", city_no);
	}

	//여행지 글 상세보기 할 때 이미지 갤러리의 메인 이미지 불러오기
	@Override
	public String area_mainImg(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("area.area_mainImg", no);
	}

	//여행지 상세보기에서 리뷰 리스트 불러오기
	@Override
	public List<AreaReviewModel> areaReviewList(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.areaReviewList", no);
	}

	//여행지 글 수정할 때 이미지 원본이름 같이 불러오기
	@Override
	public List<AreaModel> imgOrgName(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.imgOrgName", no);
	}

	//여행지 글 수정하기
	@Override
	public void areaModify(AreaModel areaModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("area.areaModify", areaModel);
	}

	//수정할 때 이미지 첨부파일이 새로 입력되면 기존의 이미지 첨부파일 삭제하기
	@Override
	public void fileDelete(int no) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("area.fileDelete", no);
		
	}

	//여행지 리뷰 개수 구하기
	@Override
	public int revCount(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("area.revCount", no);
	}

	//여행지 글쓰기
	@Override
	public int areaWrite(AreaModel areaModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("area.areaWrite", areaModel);
	}

	//파일 업로드 할 때 no 값 보내주기
	@Override
	public int selectSeq() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("area.selectSeq");
	}

	//파일 업로드
	@Override
	public void fileupload(AreaImgModel areaimgModel) {
		// TODO Auto-generated method stub
		
		sqlSessionTemplate.insert("area.fileupload", areaimgModel);
	}

	//여행지 리뷰 쓰기
	@Override
	public void areaReviewWrite(AreaReviewModel areaReviewModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("area.areaReviewWrite", areaReviewModel);
	}

	//여행지 리뷰 삭제하기
	@Override
	public void areaReviewDelete(int no) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("area.areaReviewDelete", no);
	}

	//여행지 글 삭제하기
	@Override
	public void areaDelete(int no) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("area.areaDelete", no);
	}
	//여행지 가장최근에 올린 글 불러오기
	@Override
	   public AreaModel areaLastWrite() {
	      return sqlSessionTemplate.selectOne("area.areaLastWrite");
	   }
	

}
