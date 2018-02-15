<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Free Bootstrap 4 Theme by ProBootstrap.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

<title>YOURTOUR &mdash; MY PAGE</title>

<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700" rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/fonts/ionicons/css/ionicons.min.css">
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/owl.carousel.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-datepicker.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/select2.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/helpers.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/NewFile.css">

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
			<li class="nav-item "><a class="nav-link" href="/yourtour/">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="/yourtour/member/joinForm.go">JOIN</a></li>
			<li class="nav-item"><a class="nav-link" href="/yourtour/member/loginpage.go">LOGIN</a></li>
			<li class="nav-item active"><a class="nav-link" href="/yourtour/member/myPage.go">My page</a></li>
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
			<h2 class="heading mb-2 display-4 font-light probootstrap-animate fadeInUp probootstrap-animated">MY PAGE</h2>
		</div>
	</div>
</div>
</section>
<!-- END section -->

<section id="services">
<div class="container">
	<div class="row justify-content-center mb-5"></div>
</div>

<div class="container">
	<div align="center">
		<c:if test="${member.MEMBER_IMG == null}">
			<img src="/yourtour/resources/mem_img/images.png" />
			<br>
		</c:if>
		<c:if test="${member.MEMBER_IMG != null}">
			<img src="/yourtour/resources/mem_img/${member.MEMBER_IMG }" />
			<br>
		</c:if>
		${member.MEMBER_IMG}<br> ${member.EMAIL}님으로 로그인 하셨습니다.
		${member.NAME}님 환영합니다<br> 
	</div>
		
	<div class="container">
		<div class="row justify-content-center mb-5"></div>
	</div>
	
	<div class="row">
		<div class="col-lg-3 col-md-6 text-center">
			<div class="service-box mt-5 mx-auto probootstrap-animate mb-3 fadeInUp probootstrap-animated">
				<i class="fa fa-4x fa-diamond text-primary mb-3 sr-icons"
					onclick="location.href='/yourtour/schedule/scheduleWriteForm.go'"></i>
				<h3 class="mb-3"
					onclick="location.href='/yourtour/schedule/scheduleWriteForm.go'">일정만들기</h3>
				<p class="text-muted mb-0">Make Your Own Tour Schedule!</p>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 text-center">
			<div class="service-box mt-5 mx-auto probootstrap-animate mb-3 fadeInUp probootstrap-animated">
				<i class="fa fa-4x fa-paper-plane text-primary mb-3 sr-icons"
					onclick="location.href='/yourtour/schedule/scheduleList.go'"></i>
				<h3 class="mb-3" onclick="location.href='/yourtour/schedule/scheduleList.go'">일정리스트</h3>
				<p class="text-muted mb-0">You can see your schedule Lists you made!</p>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 text-center">
			<div class="service-box mt-5 mx-auto probootstrap-animate mb-3 fadeInUp probootstrap-animated">
				<i class="fa fa-4x fa-newspaper-o text-primary mb-3 sr-icons"
					onclick="location.href='/yourtour/city/cityList.go'"></i>
				<h3 class="mb-3" onclick="location.href='/yourtour/city/cityList.go'">여행지 보기</h3>
				<p class="text-muted mb-0">You can see the city List we recommend!</p>
			</div>
		</div>

		<div class="col-lg-3 col-md-6 text-center">
			<div class="service-box mt-5 mx-auto probootstrap-animate mb-3 fadeInUp probootstrap-animated">
				<c:if test="${member.EMAIL == 'admin'}">
					<i class="fa fa-4x fa-heart text-primary mb-3 sr-icons"
						onclick="location.href='/yourtour/area/areaWriteForm.go'"></i>
					<h3 class="mb-3" onclick="location.href='/yourtour/area/areaWriteForm.go'">여행지 등록</h3>
					<p class="text-muted mb-0">If you're a administrator, You can register areas!</p>
				</c:if>
			</div>
		</div>
		
	</div>
</div>
	
<div class="container" align="center">
	<div>
		<div>
		<br><br><br>
			<button type="button" class="btn btn-primary"
				onclick="location.href='logout.go'">로그아웃</button>
			<button type="button" class="btn btn-primary"
				onclick="location.href='memberModifyForm.go'">회원수정</button>
			<button type="button" class="btn btn-primary"
				onclick="location.href='memberDeleteForm.go'">회원탈퇴</button>
		</div>
	</div>
</div>
</section>

<footer class="probootstrap_section probootstrap-border-top">

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
</footer>
	
</body>
</html>
