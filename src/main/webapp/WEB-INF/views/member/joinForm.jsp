<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Free Bootstrap 4 Theme by ProBootstrap.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

<title>YOURTOUR &mdash;JOIN</title>

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
	
<script language="javascript">
function myFunction() {
    var x = document.getElementById("snackbar")
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 9000);
}

function check(){
	var reg = document.joinForm;
	
	if(reg.email.value==""){
		alert("이메일을 입력해주세요.");
		reg.email.focus();
		return false;
	}
	
	else if(reg.pw.value==""){
		alert("비밀번호를 입력해주세요");
		reg.pw.focus();
		return false;
	}
	else if(reg.pw.value != reg.pw2.value){
		alert("비밀번호가 일치하지 않습니다.");
		reg.pw.focus();
		return false;
	}
	else if(reg.pw.value.length < 6 || reg.pw.value.length > 13){
		alert("비밀번호를 6~13자까지 입력해주세요.");
		reg.pw.focus();
		return false;
	}
	else if(reg.name.value==""){
		alert("이름을 입력해주세요");
		reg.name.focus();
		return false;
	}
	else if(reg.nickname.value==""){
		alert("닉네임을 입력해주세요");
		reg.nickname.focus();
		return false;
	}
	
}
function openIdChk(joinForm){
	var url="duplChk.go?email="+document.joinForm.email.value;
	var reg=document.joinForm;
	for (i=0;i<reg.email.value.length;i++ ){
		var ch = document.joinForm.email.value.charAt(i)
		if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z')&&!(ch=='@')&&!(ch=='.')){
	  		alert ("이메일은 소문자, 숫자만 입력가능합니다.")
	  		reg.email.focus();
	  		return false;
	  	}
	}
	if(reg.email.value==""){
		alert("이메일을 입력해주세요");
		reg.email.focus();
		return false;
	}
	
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}
$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
}) 

function openNameChk(joinForm){
	var url="nameDuplChk.go?nickname="+document.joinForm.nickname.value;
	var reg=document.joinForm;
	
	if(reg.nickname.value==""){
		alert("닉네임을 입력해주세요");
		reg.nickname.focus();
		return false;
	}
	
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}
$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
})

function emailAuth(joinForm){
	var url="emailAuth.go?email="+document.joinForm.email2.value;
	var reg=document.joinForm;
	
	if(reg.email2.value==""){
		alert("이메일을 입력해주세요");
		reg.email.focus();
		return false;
	}
	
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}
$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
})

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
			<li class="nav-item active"><a class="nav-link" href="/yourtour/member/joinForm.go">JOIN</a></li>
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
			<h2 class="heading mb-2 display-4 font-light probootstrap-animate fadeInUp probootstrap-animated">JOIN</h2>
		</div>
	</div>
</div>
</section>
<!-- END section -->

<section class="probootstrap_section bg-light" id="section-contact">

<!-- 본문 -->
<div class="container">
	<form name="joinForm" method="post" action="join.go"
		onsubmit="return check();" enctype="multipart/form-data"
		class="probootstrap-form probootstrap-form-box">

		<div class="form-group">
			<label>Email</label>
			<div class="input-group">
				<span class="input-group-addon">
				<span class="glyphicon glyphicon-user"></span></span> 
				<input type="email" name="email" class="form-control" placeholder="Requested Email">
				<button onclick="openIdChk(this.form)" name="confirmId"
					type="button" class="btn btn-primary">check duplicates</button>
			</div>
		</div>
			
		<div class="form-group">
			<label>Confirm Email</label>
			<div class="input-group">
				<span class="input-group-addon">
				<span class="glyphicon glyphicon-user"></span></span> 
				<input type="text" class="form-control" name="email2" placeholder="Confirm Email">
				<button onclick="emailAuth(this.form)" name="confirmemail"
					type="button" class="btn btn-primary">Confirm Email</button>
			</div>
		</div>
		

		<div class="form-group">
			<label>Statement of Confirmation</label>
			<div class="input-group">
				<span class="input-group-addon">
				<span class="glyphicon glyphicon-user"></span></span> 
				<input type="text" class="form-control" name="mailCheck" placeholder="not checked" readonly>
			</div>
		</div>

		<div class="form-group">
			<label>Password</label>
			<div class="input-group">
				<span class="input-group-addon">
				<span class="glyphicon glyphicon-lock"></span></span> 
				<input type="password" class="form-control" name="pw" placeholder="Password">
			</div>
		</div>

		<div class="form-group">
			<label>Confirm Password</label>
			<div class="input-group">
				<span class="input-group-addon">
				<span class="glyphicon glyphicon-resize-vertical"></span></span> 
				<input type="password" class="form-control" name="pw2" placeholder="Confirm Password">
			</div>
		</div>

		<div class="form-group">
			<label>Name</label>
			<div class="input-group">
				<span class="input-group-addon">
				<span class="glyphicon glyphicon-user"></span></span> 
				<input type="text" class="form-control" name="name" placeholder="Requested Name">
			</div>
		</div>

		<div class="form-group">
			<label>Nickname</label>
			<div class="input-group">
				<span class="input-group-addon">
				<span class="glyphicon glyphicon-user"></span></span> 
				<input type="text" class="form-control" name="nickname" id="nickname"
					placeholder="Requested Nickname">
				<button onclick="openNameChk(this.form)" name="confirmName"
					type="button" class="btn btn-primary">Confirm nickname</button>
			</div>
		</div>
			
		<div class="form-group">
			<label>Profile</label>
			<div class="input-group">
				<input type="file" name="member_img" >
			</div>
		</div> 

		<div class="form-group" align="center">
			<button type="reset" class="btn btn-primary">Reset</button>
			<button type="submit" class="btn btn-primary">Join</button><br><br>
			<a href="/yourtour/member/loginpage.go">로그인</a>
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