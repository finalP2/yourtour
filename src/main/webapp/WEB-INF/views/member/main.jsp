<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page </title>
</head>
<body>
<%@ include file="../member/menu.jsp" %>
    <h2>회원 전용 페이지</h2>
    ${session_m_email}님으로 로그인 하셨습니다.<br>
    ${session_m_name}님 환영합니다<br>
    닉네임 : ${session_m_nickname}<br>   
    <input type="button" value="로그아웃" onclick="location.href='logout.go'">  
    <input type="button" value="회원수정" onclick="location.href='memberModifyForm.go'">
    <input type="button" value="회원탈퇴" onclick="location.href='memberDeleteForm.go'">
    <a href="/yourtour/schedule/scheduleWriteForm.go" >일정만들기</a><br/>
	<a href="/yourtour/schedule/scheduleList.go">일정리스트</a>
</body>
</html>
