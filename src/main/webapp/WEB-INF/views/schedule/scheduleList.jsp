<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table class="table">
        <c:forEach var="scheduleList" items="${scheduleList }" varStatus="stat">
            <tr>
            <td >
	          	${scheduleList.no } -
	          </td>
               <td >
               <a href="scheduleDetail.go?no=${scheduleList.no }">${scheduleList.name }</a>
               	
               </td>
            </tr>
        </c:forEach>
      </table>    
</body>
</html>