<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Free Bootstrap 4 Theme by ProBootstrap.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

<title>YOURTOUR &mdash; STATEMENT OF SCHEDULE</title>

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

	<script
		src="<c:url value="resources/assets/js/bootstrap-datepicker.js" />"></script>
	<script
		src="<c:url value="resources/assets/js/jquery.waypoints.min.js" />"></script>
	<script
		src="<c:url value="resources/assets/js/jquery.easing.1.3.js" />"></script>

	<script src="<c:url value="resources/assets/js/select2.min.js" />"></script>

	<script src="<c:url value="resources/assets/js/main.js" />"></script>


	<nav
		class="navbar navbar-expand-lg navbar-dark probootstrap_navbar scrolled sleep awake"
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
				<li class="nav-item active"><a class="nav-link"
					href="/yourtour/">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/yourtour/member/joinForm.go">JOIN</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/yourtour/member/loginpage.go">LOGIN</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/yourtour/member/login.go">My page</a></li>
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
				<h2
					class="heading mb-2 display-4 font-light probootstrap-animate fadeInUp probootstrap-animated">AREA LIST</h2>
			</div>

		</div>
	</div>
	</section>
	<!-- END section -->
	
	
	<section class="probootstrap_section bg-light" id="section-contact">

 	<!-- 여백 -->
<!--	<div class="container" align="center"><h2>LOG-IN</h2>
		<div class="row justify-content-center mb-5"></div>
	</div>
	 -->

    
<table width="100%" border="0" align="center">
	<tr>
		<td colspan="3">
			<a href="/yourtour/city/cityDetail.go?no=${cityList.NO}&keyword=${param.keyword}">홈</a>
			<a href="/yourtour/area/areaList.go?city_no=${cityModel.NO}&keyword=${param.keyword}">여행지</a>
			<a data-toggle="modal" data-target="#scheduleList">여행일정 보기</a>
		</td>
	</tr>
</table>


<table width="100%" border="0" align="center">
	<tr>
		<td colspan="2" style="text-align:left;">
		<br/><br/><br/>
		<img src="../resources/area_img/"/> / 총 게시글<c:out value="${totalCount }"/>개
		<c:if test="${fn:length(searchKeyword) gt 1 && searchKeyword != '' }">
		<font color="red"> / *[<c:out value="${searchKeyword}"/>] 을(를) 검색한 결과</font>
		</c:if>
		
		<td style="text-align:right;">
		<br/><br/><br/>
		<form action="areaList.go">
		<input type="hidden" name="keyword" value="${param.keyword }"/>
		<div class="row row-centered" >
 				<div class="col-lg-12 col-centered">
				<div class="input-group ">
				<input type="text" name="searchKeyword" class="form-control" placeholder="여행지를 입력해주세요.">
				<input type="hidden" name="no" value="${param.no }" />
				<span class="input-group-btn">
        			<button class="btn btn-default" type="submit" >검색</button>
				</span>
				</div>
  				</div>
				</div>
		</form>
</table>

<table width="80%" border="0" cellspacing="0" cellpadding="2" align="center" class="table table-hover">

	<thead>
	<tr height="10" >
		<th style="text-align:center;">이름</th>
		<th style="text-align:center;">이미지</th>
		<th style="text-align:center;">내용</th>
	</tr>
	</thead>
	
	<tbody>
	
	<c:if test="${fn:length(areaList) le 0 }">
		<tr align="center">
			<td colspan="3">등록된 게시물이 없습니다.</td>
		</tr>
	</c:if>

	<c:forEach var="areaList" items="${areaList }" varStatus="stat">
		
		<tr height="200">
			<td>
				<a href="areaDetail.go?no=${areaList.NO }&keyword=${keyword}">
					<h2><b>${areaList.NAME }</b></h2>
				</a>
			</td>
			<td align="center" width="300">
				<a href="areaDetail.go?no=${areaList.NO }&keyword=${param.keyword}">
				<img src="../resources/area_img/${ areaList.MAIN_IMG }" class="img-rounded" alt="Cinque Terre" width="250" height="200"
						onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'"/>
					
				</a>
				<br>
			</td>
			<td align="center" width="300">
				<!-- 글자 수를 초과하면 ...으로 보이도록 설정 -->
		 		<c:if test="${fn:length(areaList.CONTENT) gt 200 }">
					<c:out value="${fn:substring(areaList.COTNENT, 0, 200) }"/>......
				</c:if>
				<c:if test="${fn:length(areaList.CONTENT) le 200 }">
					${areaList.CONTENT }
				</c:if> 

				<br>
			</td>
		</tr>
	</c:forEach>
	
	<c:if test="${session_email == 'admin' }">
		<tr>
			<td colspan="3" align="right">
				<button type="button" class="button" onclick="javascript:location.href='areaWriteForm.go?city_no=${param.city_no}&keyword="${param.keyword }'">글쓰기</button>
			</td>
		</tr>
	</c:if>
</tbody>
</table>
</section>
</body>
</html>