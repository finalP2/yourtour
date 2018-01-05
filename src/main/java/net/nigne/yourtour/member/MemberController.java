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
	
	//회원가입 폼
	@RequestMapping("joinForm.go")
	public String joinForm(){
		return "member/joinForm";
	}
	
	 @RequestMapping("loginpage.go")
	    public String login(){
	        return "member/login";    // views/member/login.jsp로 포워드
	    }
	
	//회원가입
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
			
		//이메일, 닉네임 중복되면 가입안되도록	
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
		
		//인증 실패
		if (auth == 0) {
			System.out.println("1111");
			mav.setViewName("member/emailAuthFail");
		//인증됨	
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
		
	//회원가입시 이메일 중복체크
	@RequestMapping("/duplChk.go")
	public ModelAndView emailDuplChk(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

		  int memberEmailChk;
		  		
		  String m_email = request.getParameter("m_email");
		  member = memberService.getEmailDuplChk(m_email);
		  		
		  		if (member == null) {
		  			
		  			memberEmailChk = 0; //사용가능 이메일
		  			mav.addObject("member", member);
		  			mav.addObject("memberEmailChk", memberEmailChk);
		  			mav.setViewName("member/idChk");
		  			return mav;

		  		} else {
		  			
		  			memberEmailChk = 1; // 사용불가능 이메일
		  			/*System.out.println("사용불가능이메일");*/
		  			mav.addObject("member", member);
		  			mav.addObject("memberEmailChk", memberEmailChk);
		  			mav.setViewName("member/idChk");
		  			return mav;
		  		}
		  	}
	
	//이름(닉네임)중복체크
	@RequestMapping("/nameDuplChk.go")
	public ModelAndView getEmailDuplChk(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {
		
			  int memberNameChk;
			  		
			  String m_name = request.getParameter("m_name");
			  member = memberService.getNameDuplChk(m_name);
			  		
			  		if (member == null) {
			  			
			  			memberNameChk = 0; //사용가능 닉네임
			  			mav.addObject("member", member);
			  			mav.addObject("memberNameChk", memberNameChk);
			  			mav.setViewName("member/nameChk");
			  			return mav;

			  		} else {
			  			
			  			memberNameChk = 1; // 사용불가능 닉네임
			  			System.out.println("사용불가능닉네임");
			  			mav.addObject("member", member);
			  			mav.addObject("memberNameChk", memberNameChk);
			  			mav.setViewName("member/nameChk");
			  			return mav;
			  		}
			  	}
	
	
	
	//로그인 폼- 모달로함
	/*@RequestMapping(value="/loginForm.go", method=RequestMethod.GET)
	public String loginForm() {
	     return "";
	  }*/

	 //로그인동작 및 세션 생성
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
			    
	      } else if(result!=null){//회원이고 이메일인증 함
	         
	    	 memberLoginChk = 0; //로그인 성공
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
	 
	  //로그아웃
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
      
	 
	 //이메일/비밀번호 찾기 폼
	 @RequestMapping(value = "/findForm.go", method = RequestMethod.GET)
	 public ModelAndView memberFindForm() {
	  		mav.setViewName("emailpwFindForm");
	  		return mav;
	  	}
	
	 //이메일 찾기
	 @RequestMapping(value = "/emailFind.go", method = RequestMethod.POST)
	 public ModelAndView memberEmailFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

	  		int memberFindChk;
	  		member = memberService.emailFindByName(member);
	  		
	  		if (member == null) {
	  			memberFindChk = 0; // 비회원;
	  			mav.addObject("memberFindChk", memberFindChk);
	  			mav.setViewName("findError");
	  			return mav;

	  		} else {
	  		
	  				mav.addObject("member", member);
	  				mav.setViewName("emailFind");
	  				return mav;
	  		}
	  	}
	 
	 
	/* //비밀번호찾기 폼
	 @RequestMapping(value = "/pwFindForm.go", method = RequestMethod.GET)
	 public ModelAndView memberPwFindForm() {
	  		mav.setViewName("emailpwFindForm");
	  		return mav;
	  	}*/
	 
	 //비밀번호 찾기
	 @RequestMapping(value = "/pwFind.go", method = RequestMethod.POST)
	 public ModelAndView memberPwFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

	  		int memberFindChk;
	  		member = memberService.pwFindByEmail(member);
	  		
	  		if (member== null) {
	  			memberFindChk = 0; // 비회원;
	  			mav.addObject("memberFindChk", memberFindChk);
	  			mav.setViewName("findError");
	  			return mav;

	  		} else {
	  			
	  			if (member.getEmail().equals(member.getName()) || member.getEmail().equals(member.getEmail())) {
	  				memberFindChk = 1; // 회원, 이름/이메일 일치
	  				mav.addObject("member", member);
	  				mav.addObject("memberFindChk", memberFindChk);
	  				mav.setViewName("pwFind");
	  				return mav;
	  			} else {
	  				memberFindChk = -1; // 이름/이메일 불일치
	  				mav.addObject("memberFindChk", memberFindChk);
	  				mav.setViewName("findError");
	  				return mav;
	  			}
	  		}
	  	}
	  	
	 
	 
	 //회원정보수정 폼
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

	 //회원정보 수정 완료
	 @RequestMapping("/memberModify.go")
	 public ModelAndView memberModify(HttpServletRequest request, HttpSession session,@ModelAttribute("member") MemberModel member) {
		 
		if(session.getAttribute("session_m_email") != null) { 
			
		/*String m_email = (String) request.getParameter("m_email");*/
		String m_email = (String) session.getAttribute("session_m_email");
		String m_pw = (String) request.getParameter("m_pw");
		String m_name = (String) request.getParameter("m_name");

		//이메일, 닉네임 중복되면 가입안되도록	
		MemberModel nameChk = memberService.getNameDuplChk(m_name);
				  	
			if(nameChk==null){
				//회원정보 수정
				memberService.memberModify(m_email, m_pw, m_name);
				
				// 회원정보 수정 후 헤더의 세션 이름 바뀌도록.
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
				mav.setViewName("loginConfirm"); //로그인x
				return mav;
		 }

	}
	 
	 
	 
	 //회원 탈퇴 폼
	 @RequestMapping("/memberDeleteForm.go")
		public ModelAndView memberDeleteForm(){
		 	mav.setViewName("memberDeleteForm");
			return mav;
		}
	 
	 //회원 탈퇴
	 @RequestMapping("/memberDelete.go")
  	 public ModelAndView memberDelete(@ModelAttribute("member") MemberModel member, BindingResult result, HttpSession session, HttpServletRequest request) {
		
		
  		MemberModel memberModel; // 쿼리 결과 값을 저장할 객체
  		
  		String m_email;
  		String m_pw;
  		m_pw = request.getParameter("m_pw");
  		int deleteCheck;
  		
  		//해당 이메일의 정보를 가져온다
  		m_email = session.getAttribute("session_m_email").toString();
  		memberModel = (MemberModel) memberService.getMember(m_email);
  		
  		
  		if(session.getAttribute("session_m_email") != null) { 
  		if(memberModel.getPw().equals(m_pw)) {
  			
  			deleteCheck = 1; //패스워드 일치
  			
  			//삭제 쿼리 수행
  			memberService.memberDelete(m_email);
  			session.removeAttribute("session_m_email");
  			session.removeAttribute("session_m_name");
  		
  		} else {
  			deleteCheck = -1; //패스워드 불일치
  		}
  		
  		mav.addObject("deleteCheck", deleteCheck);
  		mav.setViewName("memberDelete");
  		return mav;
  	}
  		else {

			mav.setViewName("loginConfirm"); //로그인x
			return mav;
	}
	  	

}
}
