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
<h4 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;"><span class="glyphicon glyphicon-tags"></span>&nbsp;${sch.START_DATE }~${sch.END_DATE }</h4>

<c:forEach var="schDayList" items="${schDayList }" varStatus="stat">
            <tr>
               <td >
               <a href="scheduleArea.go?sch_day_no=${schDayList.DAY }&sch_no=${sch.NO}&city_no=${cityOne.NO}" >${schDayList.DAY }일차</a>
               </td>
               <td>
               	<span class="glyphicon glyphicon-chevron-right"></span>
               </td>
            </tr>
 </c:forEach>
</div>
<div>
	<table class="table">
		<tr>
		<td>
			${sch_day_no}일차 일정
		</td>
		</tr>
		<tr>
			<td style="text-align:center; font-weight:bold;">
          			<c:if test="${empty schDetailList }">
          				일정을 추가해주세요.
          			</c:if>
          			<c:if test="${not empty schDetailList }">
          				<c:forEach var="schDetailList" items="${schDetailList }" varStatus="stat">
          					
          					${schDetailList.DETAIL_TURN }--${schDetailList.AREA_NO }<br/>
          				</c:forEach>
          			</c:if>
			</td>
   		</tr>
      </table> 
	
</div>
       <table class="table">
        <c:forEach var="areaList" items="${areaList }" varStatus="stat">
            <tr>
               <td >
               	${areaList.NAME }
               	<input type="button" onclick="javascript:location.href='insertDetail.go?sch_no=${sch.NO}&area_no=${areaList.NO}&sch_day_no=${sch_day_no}&city_no=${cityOne.NO}'" value="+"/>
               </td>
            </tr>
        </c:forEach>
      </table>        
	<div id="map"></div>
</body>
</html>