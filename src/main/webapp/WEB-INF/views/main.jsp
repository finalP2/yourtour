<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	${member.email}������ �α��� �ϼ̽��ϴ�.<br>
    ${member.name}�� ȯ���մϴ�<br>   
    <input type="button" value="�α׾ƿ�" onclick="location.href='member/logout.go'">  
    <input type="button" value="���ȸ������" onclick="location.href='memberList.do'">
    <input type="button" value="ȸ������������" onclick="location.href='memberUpdateForm.do'"><br/>
    
    <a href="/yourtour/schedule/scheduleWriteForm.go" >���������</a><br/>
<a href="schedule/scheduleList.go">��������Ʈ</a><br/>
<a href="area/areaWriteForm.go">���������</a>
</body>
</html>