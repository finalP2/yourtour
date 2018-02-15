package net.nigne.yourtour.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.nigne.yourtour.common.common.CommandMap;
import net.nigne.yourtour.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	int checkAuth = 0;
	@Resource(name="memberService")
	private MemberService memberService;
	ModelAndView mv = new ModelAndView();
	@RequestMapping("joinForm.go")
	public String joinForm(){
		return "member/joinForm";
	}
	@RequestMapping("email.go")
	public String email(){
		return "member/email";
	}
		
	 @RequestMapping("loginpage.go")
	    public String login(){
	        return "member/login";    // views/member/login.jsp
	    }
	
     public static String getRandomString(){
         return UUID.randomUUID().toString().replaceAll("-", "");
     }
     
     /* email 인증 추가 */
     
     @RequestMapping("emailAuth.go")
     public ModelAndView emailAuth(HttpServletResponse reponse, HttpServletRequest request) throws Exception{
    	 
    	 String email = request.getParameter("email");
    	 String authNum = "";
    	 int check = 0;
    	 
    	 authNum = RandomNum();
    	 
    	 sendEmail(email.toString(), authNum);
    	 
    	 ModelAndView mv = new ModelAndView();
    	 mv.setViewName("/member/emailAuth");
    	 mv.addObject("email",email);
    	 mv.addObject("authNum",authNum);
    	 
    	 return mv;
    	 
     }
   //이메일 인증 소스
		public void sendEmail(String email, String authNum) {
			String host = "smtp.gmail.com"; // smtp 서버
			String subject = "yourtour 인증번호 전달";
			String fromName = "yourtour 관리자";
			String from = "kh18final2@gmail.com"; //보내는 메일
			String to1 = email;
			final String username = "kh18final2";
			final String password = "academy";
			
			
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
						String un = username;
						String pw = password;
						return new PasswordAuthentication(un,pw);
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
     
     private static final String filePath = "C:\\Java\\App\\yourtour\\src\\main\\webapp\\resources\\mem_img\\"; 
     
	@RequestMapping(value="/join.go", method=RequestMethod.POST)
	public ModelAndView join(@RequestParam("member_img") MultipartFile file, CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		 int joinError;
		 
	     String originalFileName = null;
	     String originalFileExtension = null;
	     String storedFileName = null;
	     
         String Auth = "인증완료";
		 String email = (String)request.getParameter("email");
		 String pw = (String)request.getParameter("pw");
		 String name = (String)request.getParameter("name");
		 String nickname = (String)request.getParameter("nickname");
		 String AuthCheck = (String)request.getParameter("mailCheck");
		 int member_img = (int)file.getSize();
		 System.out.println(email + " " + pw + " " + name + " " + nickname + " " + member_img);
		 if(member_img!=0) {
	          originalFileName = file.getOriginalFilename();
	          originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	          storedFileName = getRandomString() + originalFileExtension;
		       }
		
		 if(!(email.equals(""))&&!(pw.equals(""))&&!(name.equals(""))&&!(nickname.equals(""))){
			 Map<String,Object> emailChk = memberService.getMember(commandMap.getMap());
			 Map<String,Object> nameChk = memberService.nameCheck(commandMap.getMap());
	    
		 if(emailChk==null && nameChk==null && AuthCheck.equals(Auth)){
				
			 	memberService.insertMem(commandMap.getMap(), request);

			 	 if(member_img!=0) {
				 File f = new File(filePath + storedFileName);
				 file.transferTo(f);
			 	 }
			 	 else {
			 		storedFileName = "images.png";
			 	 }
				 System.out.println(email + "    " + storedFileName);
				 commandMap.put("email", email);
				 commandMap.put("member_img", storedFileName);
				memberService.updateImg(commandMap.getMap());
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
				} else {    // 여기 봐야됨 인증번호 확인란
					joinError=4;
					mv.addObject("joinError",joinError);
				    mv.setViewName("member/joinError");
				    return mv;
				}
				
		 }
		 		 mv.setViewName("member/joinForm");
				 return mv;
				
	}
	
public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
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
		  
		  Map<String,Object> result = null;
		  result = memberService.login(commandMap.getMap());
		  
	      if(result==null){
				mv.addObject("msg", "failure");
				mv.setViewName("member/login");
			    return mv;
	      } else if(result!=null){
	    	 System.out.println("email= "+ result.get("EMAIL").toString());
	    	 String email = (String)result.get("EMAIL").toString();
	    	 commandMap.put("email", email);
	    	 List<Map<String,Object>> Likescheduleresult = memberService.mylikeschedule(commandMap.getMap());
	    	 List<Map<String,Object>> scheduleresult = memberService.myschedule(commandMap.getMap());
	    	 memberLoginChk = 0; 
	         HttpSession session = request.getSession();     
	         session.setAttribute("member", result);
	         session.setAttribute("myList", scheduleresult);
	         session.setAttribute("myLikeList", Likescheduleresult);
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
