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
               	${cityList.NAME }
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