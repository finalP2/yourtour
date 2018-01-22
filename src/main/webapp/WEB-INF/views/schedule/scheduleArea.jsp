<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일정 만들기</title>
<style>
       #map {
       	left: 50%;
        height: 700px;
        width: 45%;
       }

 </style>

</head>
<body>
 <script>
      function initMap() {
        var uluru = {lat: 48.855563, lng: 2.344924};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 11,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
        
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsYawDeNCfjwnKdxLZjT8SmRA8UG3pYa0&callback=initMap">
    </script>
<div style="padding-top: 20px;">
<h3 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;"><span class="glyphicon glyphicon-tags"></span>&nbsp;${sch.NAME }</h3>
<h4 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;"><span class="glyphicon glyphicon-tags"></span>&nbsp;${cityOne.NAME }</h4>
<c:forEach var="schDayList" items="${schDayList }" varStatus="stat">
            <tr>
               <td >
               <a href="" >${schDayList.DAY }일차</a>
               </td>
               <td>
               	<span class="glyphicon glyphicon-chevron-right"></span>
               </td>
            </tr>
 </c:forEach>
</div>   
       <table class="table">
        <c:forEach var="areaList" items="${areaList }" varStatus="stat">
            <tr>
               <td >
               <a href="scheduleArea.go?city_no=${areaList.NO }&sch_no=${sch.NO}" >${areaList.NAME }</a>
               </td>
               <td>
               	<span class="glyphicon glyphicon-chevron-right"></span>
               </td>
            </tr>
        </c:forEach>
      </table>        
	<div id="map"></div>
</body>
</html>