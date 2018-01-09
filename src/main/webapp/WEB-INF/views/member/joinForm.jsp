<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script language="javascript">
function myFunction() {
    var x = document.getElementById("snackbar")
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 9000);
}

function check(){
	var reg = document.joinForm;
	
	if(reg.email.value==""){
		alert("이메일을 입력해주세요.");
		reg.email.focus();
		return false;
	}
	
	else if(reg.pw.value==""){
		alert("비밀번호를 입력해주세요");
		reg.pw.focus();
		return false;
	}
	else if(reg.pw.value != reg.pw2.value){
		alert("비밀번호가 일치하지 않습니다.");
		reg.pw.focus();
		return false;
	}
	else if(reg.pw.value.length < 6 || reg.pw.value.length > 13){
		alert("비밀번호를 6~13자까지 입력해주세요.");
		reg.pw.focus();
		return false;
	}
	else if(reg.name.value==""){
		alert("이름을 입력해주세요");
		reg.name.focus();
		return false;
	}
	else if(reg.nickname.value==""){
		alert("닉네임을 입력해주세요");
		reg.nickname.focus();
		return false;
	}
	
}
function openIdChk(joinForm){
	var url="duplChk.go?email="+document.joinForm.email.value;
	var reg=document.joinForm;
	for (i=0;i<reg.email.value.length;i++ ){
		var ch = document.joinForm.email.value.charAt(i)
		if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z')){
	  		alert ("이메일은 소문자, 숫자만 입력가능합니다.")
	  		reg.email.focus();
	  		return false;
	  	}
	}
	if(reg.email.value==""){
		alert("이메일을 입력해주세요");
		reg.email.focus();
		return false;
	}
	
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}
$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
}) 

function openNameChk(joinForm){
	var url="nameDuplChk.go?nickname="+document.joinForm.nickname.value;
	var reg=document.joinForm;
	
	if(reg.nickname.value==""){
		alert("닉네임을 입력해주세요");
		reg.nickname.focus();
		return false;
	}
	
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}
$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
})
</script>
</head>
<body>
    <center>
        <h1>회원가입 페이지</h1>
 
        <form name="joinForm" action="join.go" onsubmit="return check();">
            <table>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" name="email" >
                    <input onclick="openIdChk(this.form)" name="confirmId" type="button" value="중복확인"></button>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pw" ></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="pw2" ></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" ></td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td><input type="text" name="nickname" >
                    <input onclick="openNameChk(this.form)" name="confirmName" type="button" value="중복확인"></button>
                    </td>
                </tr>
 
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="가입하기"><input type="reset" value="다시작성"><a href="/yourtour/member/loginpage.go">로그인</a></td>
                    
                </tr>
            </table>
 
        </form>
    </center>
</body>
</html>