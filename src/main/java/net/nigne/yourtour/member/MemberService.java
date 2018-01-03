package net.nigne.yourtour.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.mybatis.spring.SqlSessionTemplate;

import net.nigne.yourtour.member.MemberModel;

@Service
public class MemberService implements MemberDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	//�α���
	@Override
	public MemberModel memberLogin(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.login", member);
	}
	
	//�̸��� �̾ƿ���
	@Override
	public MemberModel getMember(String email) {
		return sqlSessionTemplate.selectOne("member.getMember", email);
	}
	
	//�̸��� �ߺ�üũ
	@Override
	public MemberModel getEmailDuplChk(String email){
		return sqlSessionTemplate.selectOne("member.emailCheck", email);
	}
	
	//�̸�(�г���) �ߺ�üũ
	@Override
	public MemberModel getNameDuplChk(String name){
		return sqlSessionTemplate.selectOne("member.nameCheck", name);
	}
	
	
	//�̸��� �˻�
	@Override
	public MemberModel getEmail(MemberModel member){
		return sqlSessionTemplate.selectOne("member.searchEamil", member);
	}
	
	//�̸��� ã��
	@Override
	public MemberModel emailFindByName(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.emailFind", member);
	}
	
	//��й�ȣ ã��
	@Override
	public MemberModel pwFindByEmail(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.pwFind", member);
	}
	

	//ȸ������
	@Override
	public Object insertMember(String m_email, String m_pw, String m_name, String m_auth) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("m_email", m_email);
		hm.put("m_pw", m_pw);
		hm.put("m_name", m_name);
		hm.put("m_auth", m_auth);
		return sqlSessionTemplate.insert("member.insertMem", hm);
	}
	
	//ȸ������ ����
	@Override
	public void memberModify(String m_email, String m_pw, String m_name) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("m_email", m_email);
		hm.put("m_pw", m_pw);
		hm.put("m_name", m_name);
		sqlSessionTemplate.update("member.updateMem", hm);
	}
	
	//ȸ��Ż��
	@Override
	public void memberDelete(String email) {
		sqlSessionTemplate.delete("member.deleteMem", email);
	}
	
		//�̸��� ����
		@Override
		public int emailAuth(String m_email, String m_auth) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("m_auth", m_auth);
			map.put("m_email", m_email);
			
			return sqlSessionTemplate.update("member.emailAuth", map);
		}
		@Override
		//������ȣ ����
		public int changeAuth(String m_email,String m_auth) {
			// TODO Auto-generated method stub
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("m_auth", m_auth);
			map.put("m_email", m_email);
			
			return sqlSessionTemplate.update("member.changeAuth", map);
		}
	
}
