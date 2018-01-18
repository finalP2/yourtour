package net.nigne.yourtour.member.controller;

import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.nigne.yourtour.common.common.CommandMap;
import net.nigne.yourtour.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Resource(name="memberService")
	private MemberService memberService;
	ModelAndView mv = new ModelAndView();
	@RequestMapping("joinForm.go")
	public String joinForm(){
		return "member/login";
	}
	
	 @RequestMapping("loginpage.go")
	    public String login(){
	        return "member/login";    // views/member/login.jsp
	    }
	
	@RequestMapping(value="/join.go", method=RequestMethod.GET)
	public ModelAndView join(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		 int joinError;
		 
		 String email = (String)request.getParameter("email");
		 String pw = (String)request.getParameter("pw");
		 String name = (String)request.getParameter("name");
		 String nickname = (String)request.getParameter("nickname");
		
		 System.out.println(email + " " + pw + " " + name + " " + nickname);
			
		
		 if(!(email.equals(""))&&!(pw.equals(""))&&!(name.equals(""))&&!(nickname.equals(""))){
			 Map<String,Object> emailChk = memberService.getMember(commandMap.getMap());
			 Map<String,Object> nameChk = memberService.nameCheck(commandMap.getMap());
	    
		 if(emailChk==null && nameChk==null){
				
			 	memberService.insertMem(commandMap.getMap());
			 	mv.setViewName("member/login");
				 return mv;
			    
			    
				} else if(emailChk != null && nameChk==null){ 
					joinError =1;
					mv.addObject("joinError",joinError);
					mv.addObject("m_email",email);
				    mv.setViewName("member/joinError");
				    return mv;
				  
				} else if(nameChk != null && emailChk==null) {
					joinError=2;
					mv.addObject("joinError",joinError);
					mv.addObject("m_name",nickname);
				    mv.setViewName("member/joinError");
				    return mv;
				    
				} else if(emailChk != null && nameChk!=null) {
					joinError=3;
					mv.addObject("joinError",joinError);
					mv.addObject("m_email",email);
					mv.addObject("m_name",nickname);
				    mv.setViewName("member/joinError");
				    return mv;
				   
				}
				
		 }
		 		 mv.setViewName("member/joinForm");
				 return mv;
				
	}
	
	@RequestMapping("/duplChk.go")
	public ModelAndView emailDuplChk(CommandMap commandMap, HttpServletRequest request) throws Exception {

		  int memberEmailChk;
		  		
		  Map<String,Object> member = memberService.getMember(commandMap.getMap());
		  		
		  		if (member == null) {
		  			
		  			memberEmailChk = 0; 
		  			mv.addObject("member", member);
		  			mv.addObject("memberEmailChk", memberEmailChk);
		  			mv.setViewName("member/idChk");
		  			return mv;

		  		} else {
		  			
		  			memberEmailChk = 1; 
		  			mv.addObject("member", member);
		  			mv.addObject("memberEmailChk", memberEmailChk);
		  			mv.setViewName("member/idChk");
		  			return mv;
		  		}
		  	}
	
	@RequestMapping("/nameDuplChk.go")
	public ModelAndView getEmailDuplChk(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
			  int memberNameChk;

			  Map<String,Object> member = memberService.nameCheck(commandMap.getMap());
			  		
			  		if (member == null) {
			  			
			  			memberNameChk = 0; 
			  			mv.addObject("member", member);
			  			mv.addObject("memberNameChk", memberNameChk);
			  			mv.setViewName("member/nameChk");
			  			return mv;

			  		} else {
			  			
			  			memberNameChk = 1; 
			  			mv.addObject("member", member);
			  			mv.addObject("memberNameChk", memberNameChk);
			  			mv.setViewName("member/nameChk");
			  			return mv;
			  		}
			  	}
	
	
	
	 @RequestMapping(value="/login.go", method=RequestMethod.POST)
	 public ModelAndView memberLogin(HttpServletRequest request, CommandMap commandMap) throws Exception{
		 
		 
		  int memberLoginChk;
		  Map<String,Object> result = memberService.login(commandMap.getMap());
		  System.out.println("email= "+ result.get("EMAIL").toString());
	      if(result==null){
	    	  	memberLoginChk=3;
				mv.addObject("msg", "failure");
				mv.setViewName("member/login");
			    return mv;
			    
	      } else if(result!=null){
	         
	    	 memberLoginChk = 0; 
	         HttpSession session = request.getSession();     
	         session.setAttribute("member", result);
	         session.setAttribute("session_m_email", result.get("EMAIL").toString());
	         session.setAttribute("session_m_name", result.get("NAME").toString());
	         session.setAttribute("session_m_nickname", result.get("NICKNAME").toString());
	         mv.addObject("member", result);
	         mv.setViewName("member/main");
	         return mv;
	         
	      }
	      return mv;
	 }
	 
	  //�α׾ƿ�
	  @RequestMapping("/logout.go")
	  public ModelAndView memberLogout(HttpServletRequest request, CommandMap commandMap){
	      
	      HttpSession session = request.getSession(false);
	      
	      if(session!=null){
	         session.invalidate();
	      }
	      mv.addObject("member", new CommandMap());
	      mv.addObject("msg","logout");
	      mv.setViewName("member/login");
	      return mv;
	   }
      
	 
	 @RequestMapping(value = "/findForm.go", method = RequestMethod.GET)
	 public ModelAndView memberFindForm() {
	  		mv.setViewName("member/emailpwFindform");
	  		return mv;
	  	}
	
	 @RequestMapping(value = "/emailFind.go", method = RequestMethod.POST)
	 public ModelAndView memberEmailFind(CommandMap commandMap, HttpServletRequest request) throws Exception {

	  		int memberFindChk;
	  		 Map<String,Object> member = memberService.emailFind(commandMap.getMap());
	  		
	  		
	  		if (member == null) {
	  			memberFindChk = 0; 
	  			mv.addObject("memberFindChk", memberFindChk);
	  			mv.setViewName("member/emailpwFindform");
	  			return mv;

	  		} else {
	  		
	  				mv.addObject("member", member);
	  				mv.setViewName("member/emailFind");
	  				return mv;
	  		}
	  	}
	 
	 
	 @RequestMapping(value = "/pwFind.go", method = RequestMethod.POST)
	 public ModelAndView memberPwFind(CommandMap commandMap, HttpServletRequest request) throws Exception {

	  		int memberFindChk;
	  		 Map<String,Object> member = memberService.getMember(commandMap.getMap());
	  		
	  		if (member== null) {
	  			memberFindChk = 0;
	  			mv.addObject("memberFindChk", memberFindChk);
	  			mv.setViewName("member/emailpwFindForm");
	  			return mv;

	  		} else {
	  				memberFindChk = 1; 
	  				mv.addObject("member", member);
	  				mv.addObject("memberFindChk", memberFindChk);
	  				mv.setViewName("member/pwFind");
	  				return mv;
	  			}
	  		}
	  	
	 
	 @RequestMapping("/memberModifyForm.go")
	 public ModelAndView memberModifyForm(HttpSession session, CommandMap commandMap) throws Exception {
		 

	  		if (session.getAttribute("session_m_email") != null) {
	  			String m_email = (String) session.getAttribute("session_m_email");
	  			commandMap.put("email", m_email);
	  			Map<String,Object> member = memberService.getMember(commandMap.getMap());
	  			session.setAttribute("session_m_email", member.get("EMAIL").toString());
		        session.setAttribute("session_m_name", member.get("NAME").toString());
		        session.setAttribute("session_m_nickname",member.get("NICKNAME").toString());
	  			mv.addObject("member", member);
	  			mv.setViewName("member/memberModifyForm");
	  			return mv;
	  			
	  		} else {

	  			mv.setViewName("member/login");
	  			return mv;
	  		}
	  	}

	 @RequestMapping("/memberModify.go")
	 public ModelAndView memberModify(HttpServletRequest request, HttpSession session, CommandMap commandMap) throws Exception {
		 
		if(session.getAttribute("session_m_email") != null) { 
			
		String email = (String) session.getAttribute("session_m_email");
		String pw = (String) request.getParameter("pw");
		String nickname = (String) request.getParameter("nickname");		
		commandMap.put("email", email);
				
		Map<String,Object> nameChk = memberService.nameCheck(commandMap.getMap());
				
				
				if(nameChk==null) {
				
				memberService.updateMem(commandMap.getMap());	
					
				Map<String,Object> result = memberService.getMember(commandMap.getMap());
				session.setAttribute("session_m_nickname", result.get("NICKNAME").toString());
				
				mv.setViewName("member/main");
				 return mv;
			    
			    
				} else {
					int joinError=2;
					mv.addObject("joinError",joinError);
					mv.addObject("m_name",nickname);
				    mv.setViewName("member/joinError");
				    return mv;
				   
				}
		
		 } else{
				mv.setViewName("member/memberModifyForm");
				return mv;
		 }

	}
	 
	 
	 

	 @RequestMapping("/memberDeleteForm.go")
		public ModelAndView memberDeleteForm(){
		 	mv.setViewName("member/memberDeleteForm");
			return mv;
		}
	 

	 @RequestMapping("/memberDelete.go")
  	 public ModelAndView memberDelete(CommandMap commandMap, BindingResult result, HttpSession session, HttpServletRequest request) throws Exception {
		
		
 
  		String m_pw;
  		m_pw = request.getParameter("pw");
  		int deleteCheck;
  		
  		String email = session.getAttribute("session_m_email").toString();
  		commandMap.put("email", email);
  		Map<String,Object> member =  memberService.getMember(commandMap.getMap());
  		
  		
  		if(session.getAttribute("session_m_email") != null) { 
  		if(member.get("PW").toString().equals(m_pw)) {
  			
  			deleteCheck = 1; 
  		
  			memberService.deleteMem(commandMap.getMap());
  			session.removeAttribute("session_m_email");
  			session.removeAttribute("session_m_name");
  			session.removeAttribute("session_m_nickname");
  			mv.setViewName("member/login");
  		
  		}
  		
  		mv.setViewName("member/login");
  		return mv;
  	}
  		else {
			mv.setViewName("member/memberDeleteForm"); //�α���x
			return mv;
	}
	  	

}
}
