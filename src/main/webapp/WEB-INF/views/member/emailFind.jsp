<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>아이디 찾기 결과</title>
</head>
<body>
<br><br><br><br><br>

<div class="container">
  <h2>이메일 찾기 결과</h2>
  <hr>
  <form class="form-horizontal">
  <div class="col-xs-4">
 
	<p class="fz15"><center>${member.name}님의 이메일은 <strong>${member.email}</strong>입니다.</center></p>

  <div align="right">
  <a href="/yourtour/member/loginpage.go">로그인</a>
 </div>
 </div>
 </form>
 <br>
</div>

<br><br><br><br><br>
</body>
</html>