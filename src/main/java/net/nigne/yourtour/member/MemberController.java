package net.nigne.yourtour.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.nigne.yourtour.member.MemberModel;
import net.nigne.yourtour.member.MemberService;
/*
import com.gokkiri.push.PushService;
import com.gokkiri.schedule.ScheduleModel;
*/

@Controller
@RequestMapping("/member")
public class MemberController {
	/*
	@Resource(name="memberService")
	private MemberService memberService;
	*/
	/*
	@Resource(name="pushService")
	private PushService pushService;
	*/
	
	ModelAndView mav = new ModelAndView();
	
	//ȸ������ ��
	@RequestMapping(value="/joinForm.go", method=RequestMethod.GET)
	public String joinForm(){
		return "joinForm";
	}
	
	
	
	//ȸ������
	@RequestMapping(value="/join.go", method=RequestMethod.POST)
	public ModelAndView join(@ModelAttribute("member") MemberModel member, HttpServletRequest request) throws Exception {
		
		 int joinError;
		 
		 String m_email = (String)request.getParameter("m_email");
		 String m_pw = (String)request.getParameter("m_pw");
		 String m_name = (String)request.getParameter("m_name");
		 
		 Random rnd = new Random();
		 StringBuffer buf = new StringBuffer();
			for(int i=0;i<10;i++){
			    if(rnd.nextBoolean()){
			        buf.append((char)((int)(rnd.nextInt(26))+97));
			    }else{
			        buf.append((rnd.nextInt(10))); 
			    }
			}
			String m_auth = buf.toString();
			
			String message  = "<center>"
					+"<table cellspacing=\"0\" cellpadding=\"0\" width=\"620\" border=\"0\">"
					+"<!--title-->"
					+"<tbody><tr><td height=\"25\"></td></tr>"
					+"<tr><td align=\"left\" style=\"border-bottom:2px solid #0545b1;\"><a href=\"http://localhost:8080/gokkiri/main.go\" target=\"_blank\"><img src=\"http://postfiles7.naver.net/MjAxNzAxMTNfMzQg/MDAxNDg0Mjc3MDU4NTM3.gBL_URIIpmpwGlXyXlyB75w2E20AX8wrZKfnaxDGhAkg.6os_tlqs7Axoot-zwVg4J_46I2AR9VtnQjCG7K5Uixwg.JPEG.powart1992/welcome.jpg?type=w2\" style=\"height: 240px; width: 620px;\"></a></td></tr>"
					 +"<tr><td height=\"25\"></td></tr>"
					 +"<tr><td align=\"center\">"	
							+"<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"620\">"
							+"<tbody><tr><td height=\"20\"></td></tr>"
							+"<tr><td align=\"center\" valign=\"top\" style=\"text-align:center\"><img src=\"http://entrystatic.afreecatv.com/ems/1/img/join_welcome.gif\" border=\"0\" alt=\"����ȸ�� ������ ȯ�� �մϴ�.\"></td></tr>"
							+"<tr><td height=\"20\"></td></tr>"
							+"<tr align=\"center\" valign=\"top\"><td style=\"font-size:15px;color:#000000;font-family:����,dotum;line-height:1.4em;text-align:center;\"><b>�ȳ��ϼ���.</b> <font color=\"#46484a\"><b><font color=\"#0054e2\">"+m_name+"</font> ����!<br>"
							+"Go���� ȸ���� �Ǿ��ּż� �����մϴ�.<br>"
							+ "�Ʒ��� ��ũ�� Ŭ���Ͽ� �����Ͻø� �̸����ּҰ� <font color=\"#46484a\"><b><font color=\"#0054e2\">"+m_email+"</font> �� ������ ����˴ϴ�.</b></font></td></tr>"
							+"<tr align=\"center\" valign=\"top\"><td style=\"font-size:15px;color:#000000;font-family:����,dotum;line-height:1.4em;text-align:center;\"><a href=http://localhost:8080/gokkiri/member/emailAuth.go?m_email="+m_email+"&m_auth="+buf.toString()+">"
			    			+"<strong>�����ϱ�</strong></font></a></td></tr>"
							+"<tr><td height=\"40\"></td></tr>"
							+"<tr><td height=\"50\"></td></tr>"
							+"<tr><td align=\"center\" style=\"font-size:12px;color:#777;font-family:����,dotum;line-height:18px;text-align:center;\">Go������ ������̳� ����ũž���� ���� ������ ��ȹ�� �� �ִ� ����Ʈ�Դϴ�.<br>"
							+"������ ����� ������ �� �ִ� ��, �ٷ� Go���� �Դϴ�.<br>������ ���Բ� ���� �� ���� ���񽺸� �����帱 �� �ֵ���, �׻� ����ϴ� Go������ �ǰڽ��ϴ�. �����մϴ�.</td></tr>"
							+"</tbody></table>"
							+"<map name=\"join_service\">"
							+"</map>"
						+"</td></tr>"
					+"<!--footer-->"
					+"<tr><td height=\"55\" bgcolor=\"#ffffff\"></td></tr>"
					+"<tr><td height=\"15\" bgcolor=\"#f1f1f1\"></td></tr>"
					+"<tr><td align=\"center\" height=\"64\" bgcolor=\"#f1f1f1\">"
							+"<table cellspacing=\"0\" cellpadding=\"0\" width=\"580\">"
							+"<tbody><tr valign=\"top\" bgcolor=\"#f1f1f1\"><td align=\"left\" width=\"10\"><img src=\"http://www.afreecatv.com/images/mail/common/bul1.gif\" alt=\"\"></td><td align=\"left\" width=\"570\" style=\"font-weight:bold;color:#333;font-size:12px;font-family:����,dotum\">�� ������ �߽� �������� ȸ���Ͻ� ��� �亯 ���� �ʽ��ϴ�.</td></tr>"
							+"<tr><td colspan=\"2\" height=\"5\"></td></tr>"
							+"<tr valign=\"top\" bgcolor=\"#f1f1f1\"><td align=\"left\" width=\"10\" style=\"padding-top:5px;\"><img src=\"http://www.afreecatv.com/images/mail/common/ico_dot2.gif\" alt=\"\"></td><td align=\"left\" width=\"570\" style=\"color:#333;font-size:11px;letter-spacing:-1px;font-family:����,dotum\">�ñ��Ͻ� ���̳� ��������� ��ȭ <span style=\"letter-spacing:0;\">010-4425-0511</span> �Ǵ� �̸���(powart1992@naver.com)�� ���Ͽ� ���� �ֽñ� �ٶ��ϴ�.</td></tr>"
							+"</tbody></table>"
						+"</td></tr>"
					+"<tr><td height=\"4\" bgcolor=\"#cbcbcb\"></td></tr>"
					+"</tbody></table>"
					+"</center>";
			
			//new sendEmail(m_email, message);
		
			
		//�̸���, �г��� �ߺ��Ǹ� ���Ծȵǵ���	
		MemberModel emailChk = memberService.getEmailDuplChk(m_email);
		MemberModel nameChk = memberService.getNameDuplChk(m_name);
		  	
		if(emailChk==null && nameChk==null){
		
		memberService.insertMember(m_email, m_pw, m_name, m_auth);
		
		mav.setViewName("join");
		 return mav;
	    
	    
		} else if(emailChk != null && nameChk==null){ 
			joinError =1;
			mav.addObject("joinError",joinError);
			mav.addObject("m_email",m_email);
		    mav.setViewName("member/joinError");
		    return mav;
		  
		} else if(nameChk != null && emailChk==null) {
			joinError=2;
			mav.addObject("joinError",joinError);
			mav.addObject("m_name",m_name);
		    mav.setViewName("member/joinError");
		    return mav;
		    
		} else if(emailChk != null && nameChk!=null) {
			joinError=3;
			mav.addObject("joinError",joinError);
			mav.addObject("m_email",m_email);
			mav.addObject("m_name",m_name);
		    mav.setViewName("member/joinError");
		    return mav;
		   
		}
		
		
		 return mav;
	   
				
	}
	
	@RequestMapping("/emailAuth.go")
	public ModelAndView emailAuth(HttpServletRequest request) throws Exception{
		
		String m_auth = request.getParameter("m_auth");
		String m_email = request.getParameter("m_email");
		int auth = memberService.emailAuth(m_email, m_auth);
		
		//���� ����
		if (auth == 0) {
			System.out.println("1111");
			mav.setViewName("member/emailAuthFail");
		//������	
		}else if (auth == 1) {
			Random rnd = new Random();
			StringBuffer buf = new StringBuffer();
			for(int i=0;i<10;i++){
			    if(rnd.nextBoolean()){
			        buf.append((char)((int)(rnd.nextInt(26))+97));
			    }else{
			        buf.append((rnd.nextInt(10))); 
			    }
			}
			m_auth = buf.toString();
		    memberService.changeAuth(m_email,m_auth);
		    mav.setViewName("member/emailAuthSuccess");
		}
		
		return mav;
	}
		
	//ȸ�����Խ� �̸��� �ߺ�üũ
	@RequestMapping("/duplChk.go")
	public ModelAndView emailDuplChk(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

		  int memberEmailChk;
		  		
		  String m_email = request.getParameter("m_email");
		  member = memberService.getEmailDuplChk(m_email);
		  		
		  		if (member == null) {
		  			
		  			memberEmailChk = 0; //��밡�� �̸���
		  			mav.addObject("member", member);
		  			mav.addObject("memberEmailChk", memberEmailChk);
		  			mav.setViewName("member/idChk");
		  			return mav;

		  		} else {
		  			
		  			memberEmailChk = 1; // ���Ұ��� �̸���
		  			/*System.out.println("���Ұ����̸���");*/
		  			mav.addObject("member", member);
		  			mav.addObject("memberEmailChk", memberEmailChk);
		  			mav.setViewName("member/idChk");
		  			return mav;
		  		}
		  	}
	
	//�̸�(�г���)�ߺ�üũ
	@RequestMapping("/nameDuplChk.go")
	public ModelAndView getEmailDuplChk(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {
		
			  int memberNameChk;
			  		
			  String m_name = request.getParameter("m_name");
			  member = memberService.getNameDuplChk(m_name);
			  		
			  		if (member == null) {
			  			
			  			memberNameChk = 0; //��밡�� �г���
			  			mav.addObject("member", member);
			  			mav.addObject("memberNameChk", memberNameChk);
			  			mav.setViewName("member/nameChk");
			  			return mav;

			  		} else {
			  			
			  			memberNameChk = 1; // ���Ұ��� �г���
			  			System.out.println("���Ұ��ɴг���");
			  			mav.addObject("member", member);
			  			mav.addObject("memberNameChk", memberNameChk);
			  			mav.setViewName("member/nameChk");
			  			return mav;
			  		}
			  	}
	
	
	
	//�α��� ��- ��޷���
	/*@RequestMapping(value="/loginForm.go", method=RequestMethod.GET)
	public String loginForm() {
	     return "";
	  }*/

	 //�α��ε��� �� ���� ����
	 @RequestMapping(value="/login.go", method=RequestMethod.POST)
	 public ModelAndView memberLogin(HttpServletRequest request, MemberModel member) throws Exception{
		 
		  int memberLoginChk;
	      MemberModel result = memberService.memberLogin(member);
	      
	      if(result==null){
	    	  memberLoginChk=3;
				
				mav.addObject("memberLoginChk",memberLoginChk);
				mav.setViewName("login");
			    return mav;
			    
	      } else{
	      String m_email = result.getM_email();
	      /*String m_email = (String)request.getParameter("m_email");*/
	      System.out.println("m_email : "+m_email);
	      String m_auth = result.getM_auth();
	      System.out.println("m_auth : "+m_auth);
	      
	      
	      //��� �����ϰ� �̸��� �����Ѱ�� admin=1�� �����.
	      memberService.emailAuth(m_email, m_auth);
	      
	      int m_admin = result.getM_admin();
	      System.out.println("m_admin : "+m_admin);

	      if(result!=null && m_admin==1) { //ȸ���̰� �̸������� ��
	         
	    	 memberLoginChk = 0; //�α��� ����
	         HttpSession session = request.getSession();        
	   
	         
	         session.setAttribute("member", result);
	         session.setAttribute("session_m_email", result.getM_email());
	         session.setAttribute("session_m_name", result.getM_name());
	    	
	         
	         //-------------------------�˸� ����� �ֱ�----------------------------//
	    
	         List<ScheduleModel> pushList = pushService.pushList(m_email); // �˸�����Ʈ ������
			 int pushCount = pushService.pushListCount(m_email);
	         
	         session.setAttribute("session_pushList", pushList);
	         session.setAttribute("session_pushCount", pushCount);
	         
	         
		     
		     
		     

	        
	         //-------------------------�˸� ����� �ֱ� ��----------------------------//
	         
	        
	         
	                 
	         mav.addObject("memberLoginChk", memberLoginChk);
	         mav.setViewName("login");
	         return mav;
	         
	      } else if(result != null && m_admin==0){ //ȸ���̰� �̸��� ���� ����
	    	  	memberLoginChk =1;
				mav.addObject("memberLoginChk",memberLoginChk);
			    mav.setViewName("login");
			    return mav;
			  
			    
			} else if(result != null && m_admin==2) { //������
				memberLoginChk=2;
				mav.addObject("memberLoginChk",memberLoginChk);
				mav.setViewName("login");
			    return mav;
			   
			}
	      }
			
			
			
			 return mav;
	      
	      
	      
	      



	         
	   }
	 
	  //�α׾ƿ�
	  @RequestMapping("/logout.go")
	  public ModelAndView memberLogout(HttpServletRequest request, MemberModel member){
	      
	      HttpSession session = request.getSession(false);
	      
	      if(session!=null){
	         session.invalidate();
	      }
	      mav.addObject("member", new MemberModel());
	      mav.setViewName("logout");
	      return mav;
	   }
      
	 
	 //�̸���/��й�ȣ ã�� ��
	 @RequestMapping(value = "/findForm.go", method = RequestMethod.GET)
	 public ModelAndView memberFindForm() {
	  		mav.setViewName("emailpwFindForm");
	  		return mav;
	  	}
	
	 //�̸��� ã��
	 @RequestMapping(value = "/emailFind.go", method = RequestMethod.POST)
	 public ModelAndView memberEmailFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

	  		int memberFindChk;
	  		member = memberService.emailFindByName(member);
	  		
	  		if (member == null) {
	  			memberFindChk = 0; // ��ȸ��;
	  			mav.addObject("memberFindChk", memberFindChk);
	  			mav.setViewName("findError");
	  			return mav;

	  		} else {
	  		
	  				mav.addObject("member", member);
	  				mav.setViewName("emailFind");
	  				return mav;
	  		}
	  	}
	 
	 
	/* //��й�ȣã�� ��
	 @RequestMapping(value = "/pwFindForm.go", method = RequestMethod.GET)
	 public ModelAndView memberPwFindForm() {
	  		mav.setViewName("emailpwFindForm");
	  		return mav;
	  	}*/
	 
	 //��й�ȣ ã��
	 @RequestMapping(value = "/pwFind.go", method = RequestMethod.POST)
	 public ModelAndView memberPwFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

	  		int memberFindChk;
	  		member = memberService.pwFindByEmail(member);
	  		
	  		if (member== null) {
	  			memberFindChk = 0; // ��ȸ��;
	  			mav.addObject("memberFindChk", memberFindChk);
	  			mav.setViewName("findError");
	  			return mav;

	  		} else {
	  			
	  			if (member.getM_name().equals(member.getM_name()) || member.getM_email().equals(member.getM_email())) {
	  				memberFindChk = 1; // ȸ��, �̸�/�̸��� ��ġ
	  				mav.addObject("member", member);
	  				mav.addObject("memberFindChk", memberFindChk);
	  				mav.setViewName("pwFind");
	  				return mav;
	  			} else {
	  				memberFindChk = -1; // �̸�/�̸��� ����ġ
	  				mav.addObject("memberFindChk", memberFindChk);
	  				mav.setViewName("findError");
	  				return mav;
	  			}
	  		}
	  	}
	  	
	 
	 
	 //ȸ���������� ��
	 @RequestMapping("/memberModifyForm.go")
	 public ModelAndView memberModifyForm(HttpSession session) {
		 
	  		session.getAttribute("session_m_email");

	  		if (session.getAttribute("session_m_email") != null) {
	  			String m_email = (String) session.getAttribute("session_m_email");
	  			MemberModel member = memberService.getMember(m_email);

	  			mav.addObject("member", member);
	  			mav.setViewName("memberModifyForm");
	  			return mav;
	  			
	  		} else {

	  			mav.setViewName("loginConfirm");
	  			return mav;
	  		}
	  	}

	 //ȸ������ ���� �Ϸ�
	 @RequestMapping("/memberModify.go")
	 public ModelAndView memberModify(HttpServletRequest request, HttpSession session,@ModelAttribute("member") MemberModel member) {
		 
		if(session.getAttribute("session_m_email") != null) { 
			
		/*String m_email = (String) request.getParameter("m_email");*/
		String m_email = (String) session.getAttribute("session_m_email");
		String m_pw = (String) request.getParameter("m_pw");
		String m_name = (String) request.getParameter("m_name");

		//�̸���, �г��� �ߺ��Ǹ� ���Ծȵǵ���	
		MemberModel nameChk = memberService.getNameDuplChk(m_name);
				  	
			if(nameChk==null){
				//ȸ������ ����
				memberService.memberModify(m_email, m_pw, m_name);
				
				// ȸ������ ���� �� ����� ���� �̸� �ٲ��.
				MemberModel result = memberService.memberLogin(member);
				session.setAttribute("session_m_name", result.getM_name());
				
				mav.setViewName("memberModify");
				 return mav;
			    
			    
				} else {
					int joinError=2;
					mav.addObject("joinError",joinError);
					mav.addObject("m_name",m_name);
				    mav.setViewName("member/joinError");
				    return mav;
				   
				}
		
		 } else{
				mav.setViewName("loginConfirm"); //�α���x
				return mav;
		 }

	}
	 
	 
	 
	 //ȸ�� Ż�� ��
	 @RequestMapping("/memberDeleteForm.go")
		public ModelAndView memberDeleteForm(){
		 	mav.setViewName("memberDeleteForm");
			return mav;
		}
	 
	 //ȸ�� Ż��
	 @RequestMapping("/memberDelete.go")
  	 public ModelAndView memberDelete(@ModelAttribute("member") MemberModel member, BindingResult result, HttpSession session, HttpServletRequest request) {
		
		
  		MemberModel memberModel; // ���� ��� ���� ������ ��ü
  		
  		String m_email;
  		String m_pw;
  		m_pw = request.getParameter("m_pw");
  		int deleteCheck;
  		
  		//�ش� �̸����� ������ �����´�
  		m_email = session.getAttribute("session_m_email").toString();
  		memberModel = (MemberModel) memberService.getMember(m_email);
  		
  		
  		if(session.getAttribute("session_m_email") != null) { 
  		if(memberModel.getM_pw().equals(m_pw)) {
  			
  			deleteCheck = 1; //�н����� ��ġ
  			
  			//���� ���� ����
  			memberService.memberDelete(m_email);
  			session.removeAttribute("session_m_email");
  			session.removeAttribute("session_m_name");
  		
  		} else {
  			deleteCheck = -1; //�н����� ����ġ
  		}
  		
  		mav.addObject("deleteCheck", deleteCheck);
  		mav.setViewName("memberDelete");
  		return mav;
  	}
  		else {

			mav.setViewName("loginConfirm"); //�α���x
			return mav;
	}
	  	

}
}
