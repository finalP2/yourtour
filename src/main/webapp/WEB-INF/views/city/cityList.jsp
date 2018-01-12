<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<style>

 .panel{
 background-color: #FFF;
 text-align:center;

} 

div.panel-heading{
width: 120px;
height: 50px;
display: inline-block;
}

div.panel-body{
width: 120px;
height: 50px;
display: inline-block;
}

</style>


</head>
<body>
    
<!-- 도시 카테고리 -->
<table width="80%" align="center">
<tr>
<td align="center">

<div class="panel-group" id="accordion">

   <!-- 첫째줄 -->
   <div class="panal panel-default">
   <!-- 상위 메뉴(Country) -->
   <!-- 1.프랑스 -->
   <div class="panel-heading">
       <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#France" id="predict"><b>프랑스</b><span class="caret"></span>
       </a>
       </span>
   </div>
   
   <!-- 2.영국 -->
   <div class="panel-heading">
       <span class="strong"><a data-toggle="collapse" data-parent="#accordion" href="#England" id="predict"><b>영국</b><span class="caret"></span>
       </a>
       </span>
   </div>
   
   <!-- 나머지 도시 들어가야함 -->
   
   
   
   <!-- 첫째줄 하위메뉴(Area) -->
   <!-- 1.프랑스 -->
   <div id="France" class="panel-collapse collapse">
       <c:forEach var="franceList" items="${franceList }">
       <div class="panel-body">
       <p><a href="cityDetail.go?no=${franceList.no }&keyword=프랑스">${franceList.name }</a></p>
   </div>
       </c:forEach>
   </div>
   
   <!-- 나머지 여행지 들어가야함 -->

</div>
</table>
</body>
</html>