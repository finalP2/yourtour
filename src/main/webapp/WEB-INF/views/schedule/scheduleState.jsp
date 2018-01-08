<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>일정 만들기</title>

</head>
<body>
	<div style="padding-top: 20px;">
	<h3 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;"><span class="glyphicon glyphicon-tags"></span>&nbsp;${sch.name}</h3>
	</div>
	<input type="button" value="프랑스" onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleCity.go?no=${sch.no}'">
</body>
</html>