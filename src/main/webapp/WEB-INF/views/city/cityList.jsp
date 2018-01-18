<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   <link href="http://fonts.googleapis.com/css?family=Arimo:400" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도시 리스트</title>

</head>
<body>

	<nav>
					<ul>
						<c:forEach var="franceList" items="${franceList }" varStatus="stat">
            					<tr>
			               <td class="col-xs-1"
			               		style="cursor:pointer;" 
			               		onclick="window.open('http://localhost:8080/yourtour/city/cityDetail.go?no=${franceList.no}&keyword=info','도시 정보','width=550, height=500, toolbar=no, menubar=no, scrollbars=yes,status=no, resizable=yes');return false;">
			               	<span class="glyphicon glyphicon-info-sign"></span>
			               </td>
			               <td >
			               	<button><a href="cityDetail.go?no=${franceList.no}&keyword=프랑스">${franceList.name }</a></button>
			               </td>
			               <td>
			               	<span class="glyphicon glyphicon-chevron-right"></span>
			               </td>
			            </tr>
			        </c:forEach>
						
						
					</ul>
					<ul>
					<c:forEach var="germanyList" items="${germanyList }" varStatus="stat">
            					<tr>
			               <td class="col-xs-1"
			               		style="cursor:pointer;" 
			               		onclick="window.open('http://localhost:8080/yourtour/city/cityDetail.go?no=${germanyList.no}&keyword=info','도시 정보','width=550, height=500, toolbar=no, menubar=no, scrollbars=yes,status=no, resizable=yes');return false;">
			               	<span class="glyphicon glyphicon-info-sign"></span>
			               </td>
			               <td >
			               	<button><a href="cityDetail.go?no=${germanyList.no}&keyword=독일">${germanyList.name }</a></button>
			               </td>
			               <td>
			               	<span class="glyphicon glyphicon-chevron-right"></span>
			               </td>
			            </tr>
			        </c:forEach>
			        </ul>
					
		</nav>
</body>
</html>
