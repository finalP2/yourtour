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
    <c:if test="${member.MEMBER_IMG == null}">
	   <img src="/yourtour/resources/mem_img/images.png"/><br>
 </c:if>
 <c:if test="${member.MEMBER_IMG != null}">
  <img src="/yourtour/resources/mem_img/${member.MEMBER_IMG }"/><br>
 </c:if>
    ${member.MEMBER_IMG}<br>
    ${member.EMAIL}님으로 로그인 하셨습니다.<br>
    ${member.NAME}님 환영합니다<br>   
    <input type="button" value="로그아웃" onclick="location.href='logout.go'">  
    <input type="button" value="회원수정" onclick="location.href='memberModifyForm.go'">
    <input type="button" value="회원탈퇴" onclick="location.href='memberDeleteForm.go'">
    <input type="button" value="일정만들기" onclick="location.href='/yourtour/schedule/scheduleWriteForm.go'">
    <input type="button" value="일정리스트" onclick="location.href='/yourtour/schedule/scheduleList.go'">
    <input type="button" value="여행지보기" onclick="location.href='/yourtour/city/cityList.go'">
    <input type="button" value="여행후기" onclick="location.href='/yourtour/comm/review/openBoardList.go'">
    <input type="button" value="동행찾기" onclick="location.href='/yourtour/comm/accompany/openBoardList.go'">

    <c:if test="${member.EMAIL == 'admin'}">
    	<input type="button" value="여행지등록" onclick="location.href='/yourtour/area/areaWriteForm.go'">
   	</c:if>
</body>
</html>
