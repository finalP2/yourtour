<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table class="table">
	
	<tr>
		<td>
			${sch.no } -
		</td>
    	<td>
    		${sch.email }
		</td>
		<td>
			${sch.name }
   		</td>
	</tr>
	<input type="button" value="���ƿ�" onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleLike.go?no=${sch.no}'"/>
</table>
</body>
</html>