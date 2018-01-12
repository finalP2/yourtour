package net.nigne.yourtour.city;

import java.util.List;

public interface CityDao {
	
	//���� �˻�
	public List<CityModel> schcitySearch(int no, String keyword);
	
	//������ - ���� ����Ʈ ����
	public List<CityModel> schCityList(String country);
	
	//���� ����Ʈ ����
	public List<CityModel> cityList(int no);
	
	//���� �󼼺���
	public CityModel cityDetail(int no);

	//���� �۾���
	public Object cityWrite(CityModel cityModel);
	
	//���� ���ε� �� �� ���� ��ȣ(no) �����ֱ�
	public int selectSeq();
	
	//���� ���ε�
	public void fileupload(String org_name, String sav_name, int city_no);
	
	//���� �󼼺��� �� �� �̹��� ����Ʈ�� ���� �ҷ�����
	public List<CityModel> city_imgList(int city_no);
	
	public CityModel main_ing(int city_no);

}
