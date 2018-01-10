package net.nigne.yourtour.area;

import java.util.List;

public interface AreaDao {
	
	//������- ������ �˻��ϱ�
	public List<AreaModel> schAreaSearch(int city_no, String searchKeyword);
	
	//������- ������ ����Ʈ �ҷ�����
	public List<AreaModel> schAreaList(int city_no);
	
	//������- ��Ŀ ���� ������ ����Ʈ �ҷ�����
	public List<AreaModel> markerAreaList(int city_no);
	
	//������- ���� ��ȣ�� ������ ����Ʈ �ҷ�����
	public List<AreaModel> cityAreaList(int city_no);
	
	//������ ����Ʈ ����
	public List<AreaModel> areaList(int city_no);
	
	//������ ����Ʈ- �˻�
	public List<AreaModel> areaSearch(String searchKeyword, int city_no);
	
	//���ο��� �α� ������ ����Ʈ �ҷ�����
	public List<AreaModel> areaLikeList();
	
	//������ �󼼺���
	public List<AreaModel> areaDetail(int no);

	//������ �󼼺��� �� �� �̹��� ����Ʈ �ҷ�����
	public List<AreaModel> area_imgList(int no);
	
	//������ �󼼺��� �� �� �̹��� ������ ���� �̹��� �ҷ�����
	public String area_mainImg(int no);
	
	//������ �󼼺��� �� �� ���� ����Ʈ �ҷ�����
	public List<AreaReviewModel> areaReviewList(int no);
	
	//������ �� ������ �� �̹��� �����̸� �ҷ�����
	public List<AreaModel> imgOrgName(int no);
	
	//������ �� �����ϱ�
	public void areaModify(AreaModel areaModel);
	
	//������ �� ������ �� �̹��� ÷�������� ���� �ԷµǸ� ������ �̹��� ÷������ �����ϱ�
	public void fileDelete(int no);
	
	//������ ���� ���� ���ϱ�
	public int revCount(int no);
	
	//������ �۾���
	public int areaWrite(AreaModel areaModel);
	
	//���� ���ε� ���� no �� �����ֱ�
	public int selectSeq();
	
	//���� ���ε�
	public void fileupload(String org_name, String sav_name, int no);
	
	//������ ���� ����
	public void areaReviewWrite(AreaReviewModel areaReviewModel);
	
	//������ ���� �����ϱ�
	public void areaReviewDelete(int no);
	
	//������ �� �����ϱ�
	public void areaDelete(int no);
}
