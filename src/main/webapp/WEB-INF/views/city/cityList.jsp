<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Free Bootstrap 4 Theme by ProBootstrap.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

<title>YOURTOUR &mdash; CITY LIST</title>


<script type="text/javascript">
	$(function() {
		$('a[title]').tooltip();
	});
</script>

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
			<h2 class="heading mb-2 display-4 font-light probootstrap-animate fadeInUp probootstrap-animated">CITY LIST</h2>
		</div>
	</div>
</div>
</section>
<!-- END section -->
	
<section class="probootstrap_section bg-light" id="section-contact">

<div class="container">
	<form class="probootstrap-form probootstrap-form-box" >

		<div class="form-group" align="center">
			<h3>France</h3>
			<c:forEach var="franceList" items="${franceList }" varStatus="stat">
				<tr>
					<td>
						<button class="btn btn-primary">
							<a href="cityDetail.go?no=${franceList.NO}&keyword=프랑스">${franceList.NAME}</a>
						</button>
					</td>
				</tr>
			</c:forEach>
		</div>

		<div class="form-group" align="center">
			<h3>Germany</h3>
			<c:forEach var="germanyList" items="${germanyList }"
				varStatus="stat">
				<tr>
					<td>
						<button class="btn btn-primary">
							<a href="cityDetail.go?no=${germanyList.NO}&keyword=독일">${germanyList.NAME}</a>
						</button>
					</td>
				</tr>
			</c:forEach>
		</div>
	</form>
</div>
</section>
<!-- END section -->

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