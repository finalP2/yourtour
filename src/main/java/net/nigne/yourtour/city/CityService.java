package net.nigne.yourtour.city;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class CityService implements CityDao {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	//일정 만들기- 도시 리스트 검색
	@Override
	public List<CityModel> schCitySearch(String country, String keyword) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("country", country);
		map.put("keyword", "%"+keyword+"%");
		
		return sqlSessionTemplate.selectList("city.schcitySearch");
	}
	
	//일정 만들기- 도시 리스트 보기
	@Override
	public List<CityModel> schCityList(String country) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("city.schCityList", country);
	}

	//여행지 탭에서 도시 리스트 불러오기
	@Override
	public List<CityModel> cityList(String country) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("city.cityList", country);
	}

	//도시 글 상세보기
	@Override
	public CityModel cityDetail(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("city.cityDetail", no);
	}

	/*//도시 글쓰기
	@Override
	public Object cityWrite(CityModel cityModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("city.cityWrite", cityModel);
	}

	//파일 업로드 전에 도시 번호 값 보내주기
	@Override
	public int selectSeq() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("city.selectSeq");
	}

	//파일 업로드
	@Override
	public void fileupload(String org_name, String sav_name, int city_no) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("org_name", org_name);
		hm.put("sav_name", sav_name);
		hm.put("city_no", city_no);
	}*/

	
	//도시 상세보기 할 때 이미지 리스트 같이 불러오기
	@Override
	public List<CityModel> city_imgList(int city_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("city.city_imgList", city_no);
	}

	//도시 상세보기 할 때 메인 이미지 불러오기
	@Override
	public CityModel city_mainImg(int city_no) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<CityModel> citySelectOne(String city_name) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("city.citySelectOne", city_name);
	}
	
}
