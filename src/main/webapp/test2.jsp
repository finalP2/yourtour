<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도시 상세보기</title>
<style>
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
</style>

<script>

//게시글 수정 스크립트
function cityModify(){
	if(confirm("글을 수정하시겠습니까?") == true){
		location.href='cityModifyForm.go?no=${cityModel.no}&keyword=${param.keyword}';	
	}else{
		return;
	}
}

//게시글 삭제 스크립트
function cityDelete(){
	if(confirm("글을 삭제하시겠습니까?") == true){
		location.href='cityDelete.go?no=${cityModel.no}';
	}else{
		return;
	}
}


</script>
</head>
<body>

<!-- 상단 이미지 + 지역검색 -->
<div class="jumbotron text-center">
  <form class="form-inline">
  	<p><font color="#070707" size="10"><b>다양한 지역의 여행지 정보를 찾아보세요!</b></font></p>
  
	<table width="30%" align="center">
	<tr><td>
      <div class="row">
    	<div class="col-sm-3 text-center">
          	<p><font color="#070707" size="6"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></font></p>
          	<p><font color="#070707" size="2">지역 홈</font></p>
    	</div>
        <div class="col-sm-3 text-center">
          	<p><font color="#070707" size="6"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span></font></p>
          	<p><font color="#070707" size="2">관광지</font></p>
    	</div>
        <div class="col-sm-3 text-center">
          	<p><font color="#070707" size="6"><span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span></font></p>
          	<p><font color="#070707" size="2">맛집</font></p>
    	</div>
    	<div class="col-sm-3 text-center">
          	<p><font color="#070707" size="6"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span></font></p>
          	<p><font color="#070707" size="2">여행일정</font></p>
    	</div>
  	</div>
  	</td></tr>
  	</table>
  	<p><font color="#070707" size="3">전국 16개 지역의 카테고리안에 세부 지역을 클릭하시면 해당 지역의 홈이 나옵니다.</font></p>
  </form>
</div>

<table width="85%" border="0" align="center">

		<tr>
			<td colspan="3">
				<ul class="nav nav-tabs nav-justified" >
  					<li><a href="/yourtour/city/cityDetail.go?no=${cityModel.no}&keyword=${param.keyword}">홈</a></li>
					<li><a href="/yourtour/area/areaList.go?no=${areaModel.no }&keyword=${param.keyword}">여행지</a></li>
					<li><a data-toggle="modal" data-target="#scheduleList">여행일정 보기</a></li>
				</ul>
			</td>
		</tr>
</table>

<table width="70%" align="center">
	<c:if test="${session_email == 'admin' }">
	<tr>
		<td align="right">
			<button type="button" class="btn btn-default" onclick="cityModify();">수정</button>
			<button type="button" class="btn btn-default" onclick="cityDelete();">삭제</button>
		</td>
	</tr>
	</c:if>
</table>