<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	${member.email}님으로 로그인 하셨습니다.<br>
    ${member.name}님 환영합니다<br>   
    <input type="button" value="로그아웃" onclick="location.href='member/logout.go'">  
    <input type="button" value="모든회원보기" onclick="location.href='memberList.do'">
    <input type="button" value="회원수정페이지" onclick="location.href='memberUpdateForm.do'"><br/>
    
    <a href="/yourtour/schedule/scheduleWriteForm.go" >일정만들기</a><br/>
<a href="schedule/scheduleList.go">일정리스트</a><br/>
<a href="area/areaWriteForm.go">여행지등록</a>
</body>
</html>