<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
 .panel{
 background-color: #f5f5f5;
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

.jumbotron{
background-image: url('/gokkiri/resources/img/cloud3.jpg');
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
}

/*이미지 슬라이드*/
  .container {
      padding: 80px 120px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }  
  
  /*검색*/
  .bootstrap-select.btn-group .btn .caret {
	left: 12px;
	}
	.bootstrap-select.btn-group .btn .filter-option {
	text-align: right;
	}
  /*검색 끝*/

</style>
<script>
$('#accordion').on('shown.bs.collapse', function () {
	  
	  var panel = $(this).find('.in');
	  
	  $('html, body').animate({
	        scrollTop: panel.offset().top
	  }, 500);
	  
	});
});

//검색
$('.selectpicker').selectpicker();

</script>

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