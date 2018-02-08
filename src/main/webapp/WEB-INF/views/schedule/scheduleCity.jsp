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

<style>
       #map {
        height: 700px;
        width: 90%;
       }

 </style>

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
			<li class="nav-item"><a class="nav-link" href="/yourtour/member/loginpage.go">LOGIN</a></li>
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

 <script>
 function initMap() {
   	var at = ${at}
   	var ng = ${ng}
       var uluru = {lat: at, lng: ng};
       var map = new google.maps.Map(document.getElementById('map'), {
         zoom: 5,
         center: uluru
         });
       }
 </script>
 
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsYawDeNCfjwnKdxLZjT8SmRA8UG3pYa0&callback=initMap"></script>

<section class="probootstrap_section" >
	
<div class="container">

	<div class="container" align="center" style="padding-top: 20px;">
		<h3 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;">
			<span class="glyphicon glyphicon-tags"></span>&nbsp;${sch.NAME}</h3>
	</div>
	
	<div class="container">
		<div class="row justify-content-center mb-5"></div>
	</div>
	
	<div>
		<div class="container" align="center">
        <c:forEach var="cityList" items="${cityList }" varStatus="stat">
            <tr>
               <td class="col-xs-1"
               		style="cursor:pointer;" 
               		onclick="window.open('http://localhost:8080/yourtour/city/cityDetail.go?no=${cityList.NO}&keyword=info','도시 정보','width=550, height=500, toolbar=no, menubar=no, scrollbars=yes,status=no, resizable=yes');return false;">
               	<span class="glyphicon glyphicon-info-sign"></span>
               </td>
               <td >
               <a href="scheduleArea.go?city_no=${cityList.NO }&sch_no=${sch.NO}&sch_day_no=1" >${cityList.NAME }</a>
               </td>
            </tr>
        </c:forEach>
		</div>
	</div>
		
      <div id="map" style="position: relative; overflow: hidden;" align="center"></div>  
		
</div>    
	
<%-- <div style="padding-top: 20px;">
<h3 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;"><span class="glyphicon glyphicon-tags"></span>&nbsp;${sch.NAME }</h3>
</div>   
       <table class="table">
        <c:forEach var="cityList" items="${cityList }" varStatus="stat">
            <tr>
               <td class="col-xs-1"
               		style="cursor:pointer;" 
               		onclick="window.open('http://localhost:8080/yourtour/city/cityDetail.go?no=${cityList.NO}&keyword=info','도시 정보','width=550, height=500, toolbar=no, menubar=no, scrollbars=yes,status=no, resizable=yes');return false;">
               	<span class="glyphicon glyphicon-info-sign"></span>
               </td>
               <td >
               <a href="scheduleArea.go?city_no=${cityList.NO }&sch_no=${sch.NO}&sch_day_no=1" >${cityList.NAME }</a>
               </td>
               <td>
               	<span class="glyphicon glyphicon-chevron-right"></span>
               </td>
            </tr>
        </c:forEach>
      </table>        
	<div id="map"></div>
	</div> --%>
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