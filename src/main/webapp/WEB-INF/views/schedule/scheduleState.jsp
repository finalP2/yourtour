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
	<h3 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;"><span class="glyphicon glyphicon-tags"></span>&nbsp;${sch.NAME}</h3>
	</div>
	<input type="button" value="프랑스" onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleCity.go?no=${sch.NO}&country=1'">
	<input type="button" value="영국|아일랜드" onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleCity.go?no=${sch.NO}&country=2'">
	<input type="button" value="이탈리아" onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleCity.go?no=${sch.NO}&country=3'">
	<input type="button" value="스위스|체코" onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleCity.go?no=${sch.NO}&country=4'">
	<input type="button" value="독일" onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleCity.go?no=${sch.NO}&country=5'">
	<input type="button" value="포르투갈|스페인" onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleCity.go?no=${sch.NO}&country=6'">
	<input type="button" value="크로아티아" onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleCity.go?no=${sch.NO}&country=7'">
	<input type="button" value="러시아" onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleCity.go?no=${sch.NO}&country=8'">
</body>
</html>              