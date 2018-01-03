package net.nigne.yourtour.member;

import java.util.List;


public interface MemberDao {
	
	//�α���
	public MemberModel memberLogin(MemberModel member);
	
	//�̸��ϻ̾ƿ���
	public MemberModel getMember(String email);
	
	//�̸��� �ߺ�üũ
	public MemberModel getEmailDuplChk(String email);
	

	
	//�̸��� �˻�
	public MemberModel getEmail(MemberModel member);
	
	//�̸�(�г���) �ߺ�üũ
	public MemberModel getNameDuplChk(String name);
	
	
	//�̸��� ã��
	public MemberModel emailFindByName(MemberModel member);
	
	//��й�ȣ ã��
	public MemberModel pwFindByEmail(MemberModel member);
	
	//ȸ������
	public Object insertMember(String m_email, String m_pw, String m_name, String m_auth);
	
	//ȸ����������
	public void memberModify(String m_email, String m_pw, String m_name);
	
	//ȸ��Ż��
	public void memberDelete(String email);
	
	//�̸��� ����
	public int emailAuth(String m_email,String m_auth);
	//������ȣ ����
	public int changeAuth(String m_auth, String m_email);
	
}
