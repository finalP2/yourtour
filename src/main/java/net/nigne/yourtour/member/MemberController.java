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

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	/*
	@Resource(name="pushService")
	private PushService pushService;
	*/
	ModelAndView mav = new ModelAndView();
	
	//ȸ������ ��
	@RequestMapping("joinForm.go")
	public String joinForm(){
		return "member/joinForm";
	}
	
	 @RequestMapping("loginpage.go")
	    public String login(){
	        return "member/login";    // views/member/login.jsp�� ������
	    }
	
	//ȸ������
	@RequestMapping(value="/join.go", method=RequestMethod.GET)
	public ModelAndView join(@ModelAttribute("member") MemberModel member, HttpServletRequest request) throws Exception {
		
		 int joinError;
		 
		 String email = (String)request.getParameter("email");
		 String pw = (String)request.getParameter("pw");
		 String name = (String)request.getParameter("name");
		 String nickname = (String)request.getParameter("nickname");
		
		 System.out.println(email + " " + pw + " " + name + " " + nickname);
		 /*
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
		*/
			
		//�̸���, �г��� �ߺ��Ǹ� ���Ծȵǵ���	
		 /*
		MemberModel emailChk = memberService.getEmailDuplChk(m_email);
		MemberModel nameChk = memberService.getNameDuplChk(m_name);
		*/
		
		memberService.insertMember(email, pw, name, nickname);
		
		mav.setViewName("member/login");
		 return mav;
	    
	    /*
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
		*/
				
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
		  String email = member.getEmail();
		  String pw = member.getPw();
		  MemberModel result = null;
	      result = memberService.memberLogin(member);
	      
	      if(result==null){
	    	  	memberLoginChk=3;
				mav.addObject("msg", "failure");
				mav.setViewName("member/login");
			    return mav;
			    
	      } else if(result!=null){//ȸ���̰� �̸������� ��
	         
	    	 memberLoginChk = 0; //�α��� ����
	         HttpSession session = request.getSession();     
	         session.setAttribute("member", result);
	         session.setAttribute("session_m_email", result.getEmail());
	         session.setAttribute("session_m_name", result.getName());
	         session.setAttribute("session_m_nickname", result.getNickname());
	    	

	         mav.addObject("msg", "success");
	         mav.setViewName("member/main");
	         return mav;
	         
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
	      mav.addObject("msg","logout");
	      mav.setViewName("member/login");
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
	  			
	  			if (member.getEmail().equals(member.getName()) || member.getEmail().equals(member.getEmail())) {
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
				session.setAttribute("session_m_name", result.getName());
				
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
  		if(memberModel.getPw().equals(m_pw)) {
  			
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
