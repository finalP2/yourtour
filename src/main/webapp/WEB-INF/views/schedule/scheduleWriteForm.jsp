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

<title>YOURTOUR &mdash; MAKE YOUR OWN SCHEDULE</title>

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
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">

function check(){
	
	var write = document.sForm;	   
	if(write.name.value==""){
		alert("일정 이름을 입력해주세요.");
		write.name.focus();
		return false;
	}
	else if(write.start_date.value==""){
		alert("출발일을 설정해주세요.");
		write.start_date.focus();
		return false;
	}
	else if(write.end_date.value==""){
		alert("종료일을 설정해주세요.");
		write.end_date.focus();
		return false;
	}

}

    function check_only(chk){
        var obj = document.getElementsByName("season");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != chk){
                obj[i].checked = false;
            }
        }
    }
    function check_only1(chk){
        var obj = document.getElementsByName("theme");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != chk){
                obj[i].checked = false;
            }
        }
    }
</script>
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
			<h2 class="heading mb-2 display-4 font-light probootstrap-animate fadeInUp probootstrap-animated">MAKE YOUR OWN SCHEDULE</h2>
		</div>
	</div>
</div>
</section>
<!-- END section -->

<section class="probootstrap_section bg-light" id="section-contact">

<div class="container">
<form commandName="scheduleModel" name="sForm" class="probootstrap-form probootstrap-form-box"
	action="scheduleState.go" method="post" onsubmit="return check();" enctype="multipart/form-data" >
		
	<script>
	$(function() {
		$("#start_date").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$("#end_date").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
	</script>

	<div class="form-group">
		<label class="control-label ">일정 이름:</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" name="name" data-placement="bottom" data-toggle="tooltip" title="필수입력 항목 입니다."
					placeholder="일정 이름을 입력하세요." />
		</div>
	</div>

	<div class="form-group">
		<label class="control-label ">날짜 설정:</label>
		<div class="col-sm-3">
			<div class="input-group">
				<span class="input-group-addon">출발일</span> 
				<input type=text id=start_date name=start_date size=12 placeholder="출발일 선택">
			</div>
		</div>

		<div class="col-sm-3">
			<div class="input-group">
				<span class="input-group-addon">종료일</span> 
				<input type=text id=end_date name=end_date size=12 placeholder="종료일 선택">
			</div>
		</div>
	</div>

	<div class="form-group">
		<label class="control-label "> 계절 선택 : </label>
		<div class="col-sm-6">
			<div class="checkbox" style="font-size: medium;">
				<label data-toggle="tooltip" title="계절을 선택해 주세요."> 
				<input type="checkbox" name="season" value="봄" onclick="check_only(this)" />봄 
				<input type="checkbox" name="season" value="여름" onclick="check_only(this)" />여름 
				<input type="checkbox" name="season" value="가을" onclick="check_only(this)" />가을 
				<input type="checkbox" name="season" value="겨울" onclick="check_only(this)" />겨울
				</label>
			</div>
		</div>
	</div>
			
	<div class="form-group">
		<label class="control-label ">여행 테마 선택 :</label>
		<div class="col-sm-6">
			<div class="checkbox">
				<label data-toggle="tooltip" title="여행 테마를 선택해 주세요."> 
				<input type="checkbox" name="theme" value="홀로" 	onclick="check_only1(this)" />홀로
				<input type="checkbox" name="theme" value="커플" onclick="check_only1(this)" />커플 
				<input type="checkbox" name="theme" value="친구" onclick="check_only1(this)" />친구
				<input type="checkbox" name="theme" value="가족" onclick="check_only1(this)" />가족
				</label>
			</div>
		</div>
	</div>
			
	<div class="form-group">
		<label class="form-label" for="file">#일정 대표 사진 첨부하기</label>
		<div class="col-sm-6">
			<div class="forms">
				<input id="files-upload" type="file" name="file" multiple>
				<ul id="file-list">
					<li class="no-items">(첨부한 파일 없음)</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="form-group">
		<div class="control-label ">
			<div class="checkbox">
				<label data-toggle="tooltip" title="체크할 시 일정 게시판에 나타나지 않습니다.">
					<input type="checkbox" name="private1" value="1" /> <span
					class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;비밀글
				</label>
			</div>
		</div>
	</div>
			
	<div class="form-group" align="center">
		<button type="submit" class="btn btn-primary">Make the Schedule</button>
	</div>

</form>
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