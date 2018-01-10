package net.nigne.yourtour.area;

import java.util.List;

public interface AreaDao {
	
	//스케쥴- 여행지 검색하기
	public List<AreaModel> schAreaSearch(int city_no, String searchKeyword);
	
	//스케쥴- 여행지 리스트 불러오기
	public List<AreaModel> schAreaList(int city_no);
	
	//스케쥴- 마커 찍을 여행지 리스트 불러오기
	public List<AreaModel> markerAreaList(int city_no);
	
	//스케쥴- 지역 번호로 여행지 리스트 불러오기
	public List<AreaModel> cityAreaList(int city_no);
	
	//여행지 리스트 보기
	public List<AreaModel> areaList(int city_no);
	
	//여행지 리스트- 검색
	public List<AreaModel> areaSearch(String searchKeyword, int city_no);
	
	//메인에서 인기 여행지 리스트 불러오기
	public List<AreaModel> areaLikeList();
	
	//여행지 상세보기
	public List<AreaModel> areaDetail(int no);

	//여행지 상세보기 할 때 이미지 리스트 불러오기
	public List<AreaModel> area_imgList(int no);
	
	//여행지 상세보기 할 때 이미지 갤러리 메인 이미지 불러오기
	public String area_mainImg(int no);
	
	//여행지 상세보기 할 때 리뷰 리스트 불러오기
	public List<AreaReviewModel> areaReviewList(int no);
	
	//여행지 글 수정할 때 이미지 원본이름 불러오기
	public List<AreaModel> imgOrgName(int no);
	
	//여행지 글 수정하기
	public void areaModify(AreaModel areaModel);
	
	//여행지 글 수정할 때 이미지 첨부파일이 새로 입력되면 기존의 이미지 첨부파일 삭제하기
	public void fileDelete(int no);
	
	//여행지 리뷰 개수 구하기
	public int revCount(int no);
	
	//여행지 글쓰기
	public int areaWrite(AreaModel areaModel);
	
	//파일 업로드 전에 no 값 보내주기
	public int selectSeq();
	
	//파일 업로드
	public void fileupload(String org_name, String sav_name, int no);
	
	//여행지 리뷰 쓰기
	public void areaReviewWrite(AreaReviewModel areaReviewModel);
	
	//여행지 리뷰 삭제하기
	public void areaReviewDelete(int no);
	
	//여행지 글 삭제하기
	public void areaDelete(int no);
}
