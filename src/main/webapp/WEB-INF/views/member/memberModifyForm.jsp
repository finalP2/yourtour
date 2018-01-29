<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>

<script language="javascript">
function check(){
   var reg = document.memberModifyForm;
   
   if(reg.pw.value==""){
      alert("비밀번호를 입력해주세요");
      reg.pw.focus();
      return false;
   }
   else if(reg.pw.value != reg.pw2.value){
      alert("비밀번호가 일치하지 않습니다.");
      reg.pw2.focus();
      return false;
   }
   else if(reg.pw.value.length < 6 || reg.pw.value.length > 13){
      alert("비밀번호를 6~13자까지 입력해주세요.");
      reg.pw.focus();
      return false;
   }
   else if(reg.nickname.value==""){
      alert("닉네임을 입력해주세요");
      reg.nickname.focus();
      return false;
   }
   
}

function openNameChk(memberModifyForm){
   var url="nameDuplChk.go?nickname="+document.memberModifyForm.nickname.value;
   var reg=document.memberModifyForm;
   
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
        <h1>회원정보수정 페이지</h1>
 
        <form name="memberModifyForm" action="memberModify.go" onsubmit="return check();">
            <table>
                <tr>
                    <td>이메일 : </td>
                    <td>${session_m_email}</td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pw"></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="pw2" ></td>
                </tr>
                <tr>
                    <td>이름 : </td>
                    <td> ${session_m_name}</td>
                    
                </tr>
                <tr>
                    <td>닉네임 </td>
                    <td><input type="text" name="nickname" >
                    <input onclick="openNameChk(this.form)" name="confirmName" type="button" value="중복확인"></button>
                    </td>
                </tr>
 
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="수정하기">
                    <button type="reset" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span>&nbsp;다시작성</button>
                    </td>
                </tr>
            </table>
 
        </form>
    </center>
</body>
</html>