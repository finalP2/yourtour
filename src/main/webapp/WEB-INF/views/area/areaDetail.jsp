<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Free Bootstrap 4 Theme by ProBootstrap.com">
<meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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

<title>YOURTOUR &mdash; AREA DETAIL</title>

<style>

       #map {
        height: 400px;
        width: 100%;
       }

</style>

<script type="text/javascript">


//게시글 삭제 스크립트
function areaDelete(){
	if(confirm("글을 삭제하시겠습니까?") == true){
		location.href='areaDelete.go?no=${areaModel.no}&keyword=${param.keyword}';
	}else{
		return;
	}
}

//댓글 삭제 스크립트
function areaReviewDelete(no){
	if(confirm("댓글을 삭제하시겠습니까?") == true){
		location.href='areaReviewDelete.go?no=${areaReviewModel.no }&keyword=${param.keyword}';
	}else{
		return;
	}
}

</script>

</head>
<body>
<script>
function initMap() {
   	var at = ${at}
   	var ng = ${ng}
       var uluru = {lat: at, lng: ng};
       var map = new google.maps.Map(document.getElementById('map'), {
         zoom: 14,
         center: uluru
         });
       var marker = new google.maps.Marker({
           position: uluru,
           map: map
         });
       }
 </script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsYawDeNCfjwnKdxLZjT8SmRA8UG3pYa0&callback=initMap"
    async defer></script>


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


<section class="probootstrap_section" id="section-feature-testimonial">
<div class="container">
	<div class="row justify-content-center mb-5">
		<div class="col-md-12 text-center mb-5 probootstrap-animate">
			<h2 class="display-4 border-bottom probootstrap-section-heading">${areaModel.NAME}</h2><br>
			<a href="/yourtour/area/areaList.go?city_no=${areaModel.CITY_NO}&keyword=${param.keyword}">여행지</a>
			<a data-toggle="modal" data-target="#scheduleList">여행일정 보기</a><br>
			<c:if test="${member.EMAIL == 'admin' }">
				<tr>
					<td align="right">
						<button type="button" class="btn btn-default" onclick="cityModify();">수정</button>
						<button type="button" class="btn btn-default" onclick="cityDelete();">삭제</button>
					</td>
				</tr>
			</c:if>
		
		
				<%-- <p class="probootstrap-author">
					<a href="https://probootstrap.com/" target="_blank"> 
						<img src="../resources/area_img/${areaModel.MAIN_IMG }" alt="Free Template by ProBootstrap.com" class="rounded-circle" height="400" width="400"><br>
					
					</a>
				</p> --%>

				<p class="lead mb-4">
					<img src="../resources/area_img/${areaModel.MAIN_IMG}" height="450" width="800"/><br/><br/>
					<em><font size="3">${areaModel.CONTENT }</font></em> <br/><br/><br/>
				
				<c:if test="${areaModel.ADDRESS != null }">
				<em><font size="3">#주소</font><br/>
				${areaModel.ADDRESS }</em><br/><br/>
				</c:if>
				
				<c:if test="${areaModel.WAY != null }">
				<em><font size="3">#가는 방법</font><br/>
				${areaModel.WAY }</em><br/><br/>
				</c:if>
				
				<c:if test="${areaModel.TEL != null }">
				<em><font size="3">#전화번호</font><br/>
				${areaModel.TEL }</em><br/><br/>
				</c:if>
				
				<c:if test="${areaModel.HOURS != null }">
				<em><font size="3">#영업 시간</font><br/>
				${areaModel.HOURS }</em><br/><br/>
				</c:if>
				
				<c:if test="${areaModel.WEB != null }">
				<em><font size="3">#웹 사이트</font>><br/>
				<a href="http://${areaModel.WEB }" >${areaModel.WEB}</a></em><br/>
				</c:if>
			
				</p>
		
		</div>
	</div>
</div>
</section>
<!-- END section -->

<table width="70%" align="center">
	<c:if test="${member.EMAIL == 'admin' }">
	<tr>
		<td align="right" colspan="2">
			<button type="button" class="btn btn-default" onclick="areaModify();">수정</button>
			<button type="button" class="btn btn-default" onclick="areaDelete();">삭제</button>
		</td>
	</tr>
	</c:if>
</table>

<br/><br/>

<table width="70%" align="center">


<!-- 지도 들어가야함 -->
<tr><td>


        <div id="map" style="position: relative; overflow: hidden;" align="center"></div>  
<!-- 지도 -->
</td></tr></table>




<!-- 리뷰 -->
<table border="0" width="70%" align="center">
  <tr>
      <td><b>REVIEW</b>&nbsp;${revCount }</td>
  </tr>
  
<c:if test="${member.EMAIL == null }">

<tr>
    <td align="center">
    <br/><br/>댓글을 쓰시려면 로그인하세요.<br/><br/>
    </td>
</tr>
</c:if>

<c:if test="${member.EMAIL != null }">
<tr>
    <td><form action="areaReview.go" method="post">
        <input type="hidden" name="keyword" value="${param.keyword }"/>
        <input type="hidden" name="no" value="${areaModel.NO }"/>
        <input type="hidden" name="email" value="${member.EMAIL }"/>
        
        <b>작성자: ${member.NICKNAME }</b>
        <textarea class="form-control" rows="5" id="comment" name="content" placeholder="리뷰내용을 입력해주세요."></textarea>
        <div class="col-sm-12" style="text-align: right; padding-right: 0px;">
  		<button type="submit" class="button">등록하기</button>
		</div>
        </form>
    </td>
</tr>
</c:if>
</table>

<br/><br/>
<%-- 
<table border="0" width="70%">
    <c:forEach var="areaReviewList" items="${areaReviewList }">
    <tr>
        <td>
            <br/>
            <b><font color="gray" size="3">${areaReviewList.email }</font></b>
            / <fmt:formatDate value="${areaReviewList.date }" pattern="yyyy.MM.dd"/>
            <c:if test="${session_email == areaReviewList.email }">
            &nbsp;/&nbsp;
            <button type="button" class="btn btn-link" onClick="areaReviewDelete(${areaReviewList.no});">x</button>
            </c:if>
            <br/><br/>
            </td>
            </tr>
            </c:forEach>
</table> --%>
</body>
</html>