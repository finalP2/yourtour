package net.nigne.yourtour.member.service;


import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.nigne.yourtour.common.util.FileUtils;
import net.nigne.yourtour.member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = memberDAO.login(map);
		return tempMap;
	}
	
	@Override
	public void insertMem(Map<String, Object> map, HttpServletRequest request) throws Exception {
		memberDAO.insertMem(map);
	
	}
	
	@Override
	public Map<String, Object> getMember(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = memberDAO.getMember(map);
		return tempMap;
	}
	
	@Override
	public Map<String, Object> nameCheck(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = memberDAO.nameCheck(map);
		return tempMap;
	}
	
	
	@Override
	public Map<String, Object> emailFind(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = memberDAO.emailFind(map);
		return tempMap;
	}
	
	@Override
	public void updateMem(Map<String, Object> map) throws Exception {
		memberDAO.updateMem(map);
		
	}
	
	@Override
	public void updateImg(Map<String, Object> map) throws Exception {
		memberDAO.updateImg(map);
		
	}
	
	@Override
	public Map<String, Object> pwFind(Map<String, Object> map) throws Exception {
		Map<String, Object> tempMap = memberDAO.pwFind(map);
		return tempMap;
	}

	@Override
	public void deleteMem(Map<String, Object> map) throws Exception {
		memberDAO.deleteMem(map);
	}
	
	@Override
	public List<Map<String, Object>> myschedule(Map<String, Object> map) throws Exception {
		return memberDAO.myschedule(map);
	}
	
	@Override
	public List<Map<String, Object>> mylikeschedule(Map<String, Object> map) throws Exception {
		return memberDAO.mylikeschedule(map);
	}
	
	/*
	@Override
	public void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com"; // smtp 서버
		String subject = "yourtour 인증번호 전달";
		String fromName = "yourtour 관리자";
		String from = "rnjsdlfdn41@naver.com"; //보내는 메일
		String to1 = email;
		
		String content = "인증번호 [" + authNum + "]";
		
		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("      ",
							"                ");
				}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			
			Transport.send(msg);
		}catch(MessagingException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i<=6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	*/
	
}
