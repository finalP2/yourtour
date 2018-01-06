<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page </title>
</head>
<body>
    <h2>회원 전용 페이지</h2>
    ${member.email}님으로 로그인 하셨습니다.<br>
    ${member.name}님 환영합니다<br>   
    <input type="button" value="로그아웃" onclick="location.href='member/logout.go'">  
    <input type="button" value="모든회원보기" onclick="location.href='memberList.do'">
    <input type="button" value="회원수정페이지" onclick="location.href='memberUpdateForm.do'">
    
</body>
</html>
