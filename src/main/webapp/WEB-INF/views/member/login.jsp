<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 
    More Templates Visit ==> ProBootstrap.com
    Free Template by ProBootstrap.com under the License Creative Commons 3.0 ==> (probootstrap.com/license)

    IMPORTANT: You can do whatever you want with this template but you need to keep the footer link back to ProBootstrap.com
    -->
<meta charset="utf-8">
<meta name="viewport"
	content="text/html; width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Login</title>
<script>
	$(document).ready(function() {
		$("#btnLogin").click(function() {
			// 태크.val() : 태그에 입력된 값
			// 태크.val("값") : 태그의 값을 변경 
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			if (userId == "") {
				alert("아이디를 입력하세요.");
				$("#userId").focus(); // 입력포커스 이동
				return; // 함수 종료
			}
			if (userPw == "") {
				alert("비밀번호를 입력하세요.");
				$("#userPw").focus();
				return;
			}
			// 폼 내부의 데이터를 전송할 주소
			document.form1.action = "${path}/member/login.go"
			// 제출
			document.form1.submit();
		});
	});
</script>
<meta name="description"
	content="Free Bootstrap 4 Theme by ProBootstrap.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">


<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700"
	rel="stylesheet">

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
	href="${pageContext.request.contextPath}/resources/assets/css/select2.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/helpers.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/NewFile.css">

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar"
		id="probootstrap-navbar">
		<div class="container">
			<a class="navbar-brand" href="main.go">Places</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#probootstrap-menu" aria-controls="probootstrap-menu"
				aria-expanded="false" aria-label="Toggle navigation">
				<span><i class="ion-navicon"></i></span>
			</button>
			<div class="collapse navbar-collapse" id="probootstrap-menu">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="main.go">Home</a></li>
					<li class="nav-item "><a class="nav-link" href="joinForm.go">JOIN</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="loginpage.go">LOGIN</a></li>
					<li class="nav-item"><a class="nav-link" href="login.go">My
							page</a></li>
					<li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="travel.html">Travel
							With Us</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
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
			<div class="row align-items-center">
				<div class="col-md">
					<h2 class="heading mb-2 display-4 font-light probootstrap-animate">Login</h2>

				</div>

			</div>
		</div>
	</section>
	<!-- END section -->



	<section class="probootstrap_section bg-light" id="section-contact">

		<div class="container">
			<div class="row justify-content-center mb-5"></div>
		</div>
		<div class="container">

			<div>

				<div>
					<form name="form1" method="post" action="login.go"
						class="probootstrap-form probootstrap-form-box">

						<div class="form-group">
							<label>Email</label>
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-envelope"></span></span> <input type="text"
									class="form-control" name="email" id="email"
									placeholder="Requested Email">
							</div>
						</div>
						<div class="form-group">
							<label>Password</label>
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-lock"></span></span> <input type="text"
									class="form-control" name="pw" id="pw" placeholder="Password">
							</div>
						</div>
						<div class="form-group" align="center">
							<button type="submit" id="btnLogin" class="btn btn-primary">Login</button>
							<c:if test="${msg == 'failure'}">
								<div style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.</div>
							</c:if>
							<c:if test="${msg == 'logout'}">
								<div style="color: red">로그아웃되었습니다.</div>
							</c:if>
						</div>
					</form>
				</div>
				<div class="container">
					<div class="row justify-content-center mb-5"></div>
				</div>
			</div>
		</div>

	</section>
	<!-- END section -->


	<footer class="probootstrap_section probootstrap-border-top">
		<div class="container">
			<div class="row justify-content-center mb-5"></div>
		</div>
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
						&copy; 2017. All Rights Reserved. <br> Designed &amp;
						Developed by <a href="https://probootstrap.com/" target="_blank">ProBootstrap</a><small>
							(Don't remove credit link on this footer. See <a
							href="https://probootstrap.com/license/">license</a>)
						</small>
					</p>
					<p class="probootstrap_font-14">
						Demo Images: <a href="https://unsplash.com/" target="_blank">Unsplash</a>
					</p>
				</div>
			</div>
		</div>
	</footer>


	<script src="<c:url value="resources/assets/js/jquery.min.js"/>"></script>

	<script src="<c:url value="resources/assets/js/popper.min.js"/>"></script>
	<script src="<c:url value="resources/assets/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="resources/assets/js/owl.carousel.min.js"/>"></script>

	<script
		src="<c:url value="resources/assets/js/jquery.waypoints.min.js"/>"></script>
	<script src="<c:url value="resources/assets/js/jquery.easing.1.3.js"/>"></script>

	<script src="<c:url value="resources/assets/js/select2.min.js"/>"></script>

	<script src="<c:url value="resources/assets/js/main.js"/>"></script>
</body>
</html>