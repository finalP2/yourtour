<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<title>YOURTOUR &mdash; AREA DETAIL</title>

<style>
#map {
        height: 400px;
        width: 100%;
       }
</style>


</head>
<body>
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
<section class="probootstrap_section" id="section-feature-testimonial">
<div class="container">
   <div class="row justify-content-center mb-5">
      <div class="col-md-12 text-center mb-5 probootstrap-animate">
         <h2 class="display-4 border-bottom probootstrap-section-heading">${areaModel.NAME}</h2><br>


<p class="lead mb-4">
               <img src="../resources/area_img/${areaModel.MAIN_IMG}" width="90%"/><br/><br/>
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

<!-- 지도 -->





<!-- 리뷰 -->

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