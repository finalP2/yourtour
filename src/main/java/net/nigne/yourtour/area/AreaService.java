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

	//������- ������ �˻�
	@Override
	public List<AreaModel> schAreaSearch(int city_no, String searchKeyword) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("city_no", city_no);
		map.put("searchKeyword", "%"+searchKeyword+"%");
		return sqlSessionTemplate.selectList("area.schAreaSearch", map);
	}

	//������- ������ ����Ʈ
	@Override
	public List<AreaModel> schAreaList(int city_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.schAreaList", city_no);
	}

	//������- ��Ŀ ���� ��� ����Ʈ
	@Override
	public List<AreaModel> markerAreaList(int city_no) {
		// TODO Auto-generated method stub
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("city_no", city_no);
		
		return sqlSessionTemplate.selectList("area.markerAreaList", map);
	}

	//������- ���� ��ȣ�� ������ ����Ʈ �ҷ�����
	@Override
	public List<AreaModel> cityAreaList(int city_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.cityAreaList", city_no);
	}

	//������ ����Ʈ ����
	@Override
	public List<AreaModel> areaList(int city_no) {
		// TODO Auto-generated method stub
		
		
		return sqlSessionTemplate.selectList("area.areaList", city_no);
	}

	//������ ����Ʈ- �˻�
	@Override
	public List<AreaModel> areaSearch(String searchKeyword, int city_no) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("searchKeyword", "%" + searchKeyword + "%");
		hm.put("city_no", city_no);
		
		return sqlSessionTemplate.selectList("area.areaSearch", hm);
	}

	//���ο��� �α� ������ ����Ʈ Like1�� �ҷ�����
	@Override
	public List<AreaModel> areaLikeList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.areaLikeList");
	}

	//������ �� �󼼺���
	@Override
	public AreaModel areaDetail(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("areaDetail", no);
	}

	//������ �� �󼼺��� �� �� �̹��� ����Ʈ ���� �ҷ�����
	@Override
	public List<AreaImgModel> area_imgList(int city_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.area_imgList", city_no);
	}

	//������ �� �󼼺��� �� �� �̹��� �������� ���� �̹��� �ҷ�����
	@Override
	public String area_mainImg(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("area.area_mainImg", no);
	}

	//������ �󼼺��⿡�� ���� ����Ʈ �ҷ�����
	@Override
	public List<AreaReviewModel> areaReviewList(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.areaReviewList", no);
	}

	//������ �� ������ �� �̹��� �����̸� ���� �ҷ�����
	@Override
	public List<AreaModel> imgOrgName(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("area.imgOrgName", no);
	}

	//������ �� �����ϱ�
	@Override
	public void areaModify(AreaModel areaModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("area.areaModify", areaModel);
	}

	//������ �� �̹��� ÷�������� ���� �ԷµǸ� ������ �̹��� ÷������ �����ϱ�
	@Override
	public void fileDelete(int no) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("area.fileDelete", no);
		
	}

	//������ ���� ���� ���ϱ�
	@Override
	public int revCount(int no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("area.revCount", no);
	}

	//������ �۾���
	@Override
	public int areaWrite(AreaModel areaModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("area.areaWrite", areaModel);
	}

	//���� ���ε� �� �� no �� �����ֱ�
	@Override
	public int selectSeq() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("area.selectSeq");
	}

	//���� ���ε�
	@Override
	public void fileupload(AreaImgModel areaimgModel) {
		// TODO Auto-generated method stub
		
		sqlSessionTemplate.insert("area.fileupload", areaimgModel);
	}

	//������ ���� ����
	@Override
	public void areaReviewWrite(AreaReviewModel areaReviewModel) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("area.areaReviewWrite", areaReviewModel);
	}

	//������ ���� �����ϱ�
	@Override
	public void areaReviewDelete(int no) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("area.areaReviewDelete", no);
	}

	//������ �� �����ϱ�
	@Override
	public void areaDelete(int no) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("area.areaDelete", no);
	}
	//������ �����ֱٿ� �ø� �� �ҷ�����
	@Override
	   public AreaModel areaLastWrite() {
	      return sqlSessionTemplate.selectOne("area.areaLastWrite");
	   }
	

}
