<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Free Bootstrap 4 Theme by ProBootstrap.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

<title>YOURTOUR &mdash; CITY DETAIL</title>

<script>
//게시글 수정 스크립트
function cityModify() {
	if (confirm("글을 수정하시겠습니까?") == true) {
		location.href = 'cityModifyForm.go?no=${cityModel.no}&keyword=${param.keyword}';
	} else {
		return;
	}
}

//게시글 삭제 스크립트
function cityDelete() {
	if (confirm("글을 삭제하시겠습니까?") == true) {
		location.href = 'cityDelete.go?no=${cityModel.no}';
	} else {
		return;
	}
}
</script>

<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/animate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-datepicker.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/select2.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/helpers.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/NewFile.css">

</head>
<body>

<script src="<c:url value="resources/assets/js/jquery.min.js" />"></script>
<script src="<c:url value="resources/assets/js/popper.min.js" />"></script>
<script src="<c:url value="resources/assets/js/bootstrap.min.js" />"></script>
<script src="<c:url value="resources/assets/js/owl.carousel.min.js" />"></script>
<script src="<c:url value="resources/assets/js/bootstrap-datepicker.js" />"></script>
<script src="<c:url value="resources/assets/js/jquery.waypoints.min.js" />"></script>
<script src="<c:url value="resources/assets/js/jquery.easing.1.3.js" />"></script>
<script src="<c:url value="resources/assets/js/select2.min.js" />"></script>
<script src="<c:url value="resources/assets/js/main.js" />"></script>

<nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar scrolled sleep awake"
		id="probootstrap-navbar">

<div class="container">
	<a class="navbar-brand" href="/yourtour/">로고넣기</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#probootstrap-menu" aria-controls="probootstrap-menu"
		aria-expanded="false" aria-label="Toggle navigation">
		<span><i class="ion-navicon"></i></span>
	</button>
	
	<div class="collapse navbar-collapse" id="probootstrap-menu">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link" href="/yourtour/">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="/yourtour/member/joinForm.go">JOIN</a></li>
			<li class="nav-item active"><a class="nav-link" href="/yourtour/member/loginpage.go">LOGIN</a></li>
			<li class="nav-item"><a class="nav-link" href="/yourtour/member/login.go">My page</a></li>
		</ul>
	</div>
</div>
</nav>
<!-- END nav -->

<section class="probootstrap-cover overflow-hidden relative"
	style="background-image: url('../resources/assets/images/bg_1.jpg');"
	data-stellar-background-ratio="0.5" id="section-home">
	
<div class="overlay"></div>

<div class="container">
	<div class="row align-items-center text-center">
		<div class="col-md">
			<h2 class="heading mb-2 display-4 font-light probootstrap-animate fadeInUp probootstrap-animated">CITY DETAIL</h2>
		</div>
	</div>
</div>
</section>
<!-- END section -->

<section class="probootstrap_section" id="section-feature-testimonial">
<div class="container">
	<div class="row justify-content-center mb-5">
		<div class="col-md-12 text-center mb-5 probootstrap-animate">
			<h2 class="display-4 border-bottom probootstrap-section-heading">${cityModel.NAME}</h2><br>
			<a href="/yourtour/area/areaList.go?city_no=${cityModel.NO }&keyword=${param.keyword}">여행지</a>
			<a data-toggle="modal" data-target="#scheduleList">여행일정 보기</a><br>
			<c:if test="${session_email == 'admin' }">
				<tr>
					<td align="right">
						<button type="button" class="btn btn-default" onclick="cityModify();">수정</button>
						<button type="button" class="btn btn-default" onclick="cityDelete();">삭제</button>
					</td>
				</tr>
			</c:if>

			<blockquote class="">
				<p class="probootstrap-author">
					<a href="https://probootstrap.com/" target="_blank"> 
						<img src="../resources/city_img/${cityImgModel.SAV_NAME}" alt="Free Template by ProBootstrap.com" class="rounded-circle" height="400" width="400"><br>
					
					</a>
				</p>

				<p class="lead mb-4">
					<%-- <img src="../resources/city_img/${cityImgModel.SAV_NAME}" /><br> --%>
					<em>${cityModel.CONTENT }</em>
				</p>
			</blockquote>
		</div>
	</div>
</div>
</section>
<!-- END section -->

<!-- 인기 여행지 리스트  -->
<h1 class="text-center" text align="center">#인기 여행지</h1><br>

<table width="70%" align="center" cellpadding="1" cellspacing="1">
<tr>
	<td align="center">
		<!-- 첫번째 슬라이드(기준) -->
		<div class="item active">
			<div class="row">
				<c:forEach var="areaList" items="${areaList }" varStatus="stat">
				<c:if test="${stat.index lt 4 }">
					<div class="col-xs-6 col-md-3">
						<a href="/yourtour/area/areaDetail.go?no=${areaList.no }&keyword=${fn:substring(areaList.address, 0, 2) }" class="thumbnail"> 
							<img src="/yourtour/resources/area_img/${ areaList.sav_name }"><br>
							<font size="4"><b> 
							<c:if test="${fn:length(areaList.name) gt 7 }">
								<c:out value="${fn:substring(areaList.name, 0, 7) }" />..
							</c:if> 
							<c:if test="${fn:length(areaList.name) le 7 }"> ${areaList.a_name } </c:if> &nbsp;&nbsp;
							<span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>${areaList.like1 }</b>
							</font>
						</a>
					</div>
				</c:if>
			</c:forEach>
			</div>
		</div> <!-- 첫번째 슬라이드(기준) 끝 -->
	</td>
</tr>
</table>

<!-- <footer class="probootstrap_section probootstrap-border-top">

<div class="container">

	<div class="row mb-5">
		<div class="col-md-3">
			<h3 class="probootstrap_font-18 mb-3">Quick Links</h3>
			<ul class="list-unstyled">
				<li><a href="https://free-template.co" target="_blank">Home</a></li>
				<li><a href="https://free-template.co" target="_blank">About</a></li>
				<li><a href="https://free-template.co" target="_blank">Services</a></li>
				<li><a href="https://free-template.co" target="_blank">Contact</a></li>
			</ul>
		</div>

		<div class="col-md-3">
			<h3 class="probootstrap_font-18 mb-3">Quick Links</h3>
			<ul class="list-unstyled">
				<li><a href="https://free-template.co" target="_blank">Home</a></li>
				<li><a href="https://free-template.co" target="_blank">About</a></li>
				<li><a href="https://free-template.co" target="_blank">Services</a></li>
				<li><a href="https://free-template.co" target="_blank">Contact</a></li>
			</ul>
		</div>
	
		<div class="col-md-3">
			<h3 class="probootstrap_font-18 mb-3">Quick Links</h3>
			<ul class="list-unstyled">
				<li><a href="https://free-template.co" target="_blank">Home</a></li>
				<li><a href="https://free-template.co" target="_blank">About</a></li>
				<li><a href="https://free-template.co" target="_blank">Services</a></li>
				<li><a href="https://free-template.co" target="_blank">Contact</a></li>
			</ul>
		</div>
	
		<div class="col-md-3">
			<h3 class="probootstrap_font-18 mb-3">Quick Links</h3>
			<ul class="list-unstyled">
				<li><a href="https://free-template.co" target="_blank">Home</a></li>
				<li><a href="https://free-template.co" target="_blank">About</a></li>
				<li><a href="https://free-template.co" target="_blank">Services</a></li>
				<li><a href="https://free-template.co" target="_blank">Contact</a></li>
			</ul>
		</div>
	</div>

	<div class="row pt-5">
		<div class="col-md-12 text-center">
			<p class="probootstrap_font-14">
				&copy; 2017. All Rights Reserved. <br> Designed &amp; Developed by 
				<a href="https://probootstrap.com/" target="_blank">ProBootstrap</a>
				<small>(Don't remove credit link on this footer. See 
				<a href="https://probootstrap.com/license/">license</a>)</small>
			</p>
			<p class="probootstrap_font-14">
				Demo Images: <a href="https://unsplash.com/" target="_blank">Unsplash</a>
			</p>
		</div>
	</div>
</div>
</footer> -->

</body>
</html>