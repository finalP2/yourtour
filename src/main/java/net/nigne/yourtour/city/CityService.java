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

	//���� �����- ���� ����Ʈ �˻�
	@Override
	public List<CityModel> schcitySearch(int no, String keyword) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("keyword", "%"+keyword+"%");
		
		return sqlSessionTemplate.selectList("city.schcitySearch");
	}
	
	//���� �����- ���� ����Ʈ ����
	@Override
	public List<CityModel> schCityList(String country) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("city.schCityList", country);
	}

	//������ �ǿ��� ���� ����Ʈ �ҷ�����
	@Override
	public List<CityModel> cityList(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("city.cityList", no);
	}

	//���� �� �󼼺���
	@Override
	public CityModel cityDetail(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("city.cityDetail", no);
	}

	//���� �۾���
	@Override
	public Object cityWrite(CityModel cityModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("city.cityWrite", cityModel);
	}

	//���� ���ε� ���� ���� ��ȣ �� �����ֱ�
	@Override
	public int selectSeq() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("city.selectSeq");
	}

	//���� ���ε�
	@Override
	public void fileupload(String org_name, String sav_name, int city_no) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("org_name", org_name);
		hm.put("sav_name", sav_name);
		hm.put("city_no", city_no);
	}

	//���� �󼼺��� �� �� �̹��� ����Ʈ ���� �ҷ�����
	@Override
	public List<CityModel> city_imgList(int city_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("city.city_imgList", city_no);
	}

	//���� �󼼺��� �� �� ���� �̹��� �ҷ�����
	@Override
	public CityModel main_ing(int city_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
