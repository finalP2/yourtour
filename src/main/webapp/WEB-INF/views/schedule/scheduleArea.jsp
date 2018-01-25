<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일정 만들기</title>
<style>
      #s_left {
       width:190px;
       height: 700px;
       float:left;
       margin: 5px;
       border: 1px solid black;
       
       }
       
       #contents {
       width:240px;
       height:700px;
       float:left;
       margin: 5px;
       border: 1px solid black;
       }
       
       #map {
       width:69%;
       height:700px;
       float:left;
       margin: 5px;
       }

 </style>

</head>
<body>
<script>

      function initMap() {

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          center: {lat: 48.855563, lng: 2.344924}
        });

        // Create an array of alphabetical characters used to label the markers.
        var labels = '123456789';

        // Add some markers to the map.
        // Note: The code uses the JavaScript Array.prototype.map() method to
        // create an array of markers based on a given "locations" array.
        // The map() method here has nothing to do with the Google Maps API.
        var markers = locations.map(function(location, i) {
          return new google.maps.Marker({
            position: location,
            label: labels[i % labels.length]
          });
        });

        // Add a marker clusterer to manage the markers.
        var markerCluster = new MarkerClusterer(map, markers,
            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
      }
      var locations = [
    	{lat: 48.873778, lng: 2.295027},
        {lat: 48.852968, lng: 2.349934},
        {lat: 48.872136, lng: 2.775883},
        {lat: 48.860576, lng: 2.337569},
        {lat: 48.846384, lng: 2.336302},
        {lat: 48.886648, lng: 2.343072},
        {lat: 43.279656, lng: 5.325408},
        {lat: 48.858341, lng: 2.294535},
        {lat: 48.859819, lng: 2.326321},
        {lat: 48.860811, lng: 2.351429},
      ]
    </script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsYawDeNCfjwnKdxLZjT8SmRA8UG3pYa0&callback=initMap">
    </script>
<h3 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;"><span class="glyphicon glyphicon-tags"></span>&nbsp;${sch.NAME }</h3>
<h4 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;"><span class="glyphicon glyphicon-tags"></span>&nbsp;${cityOne.NAME }</h4>
<h4 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;"><span class="glyphicon glyphicon-tags"></span>&nbsp;${sch.START_DATE }~${sch.END_DATE }</h4>
<div class="layout-wrap">
<br/>
<div id="s_left" style="display:table-row">
<div style="display:table-cell">
<c:forEach var="schDayList" items="${schDayList }" varStatus="stat">

               <a href="scheduleArea.go?sch_day_no=${schDayList.DAY }&sch_no=${sch.NO}&city_no=${cityOne.NO}" >${schDayList.DAY }일차</a>
				 </c:forEach><hr>
               	${sch_day_no}일차 일정<br/>
<c:if test="${empty schDetailList }">
                    <b>일정을 추가해주세요.</b><br/><br/>
                </c:if>
<c:if test="${not empty schDetailList }">
<c:forEach var="schDetailList" items="${schDetailList }" varStatus="stat">
                                  ${schDetailList.DETAIL_TURN }--${schDetailList.AREA_NO }<br/>
</c:forEach>
</c:if></div></div>
<div id="contents" style="display:table-row">
<div style="display:table-cell">
<button onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleCity.go?no=${sch.NO}'" style="margin-bottom: 5px;" align="center;">
                                    &nbsp;도시 변경<br/>
                           </button>
                           <br/>
<center><b>여행지</b></center><hr/><br/>
<c:forEach var="areaList" items="${areaList }" varStatus="stat">
            
               ${stat.count}- ${areaList.NAME }<span class="glyphicon glyphicon-plus"
             data-toggle="tooltip" title="이 여행지를 일정에 추가합니다."
             style="cursor:pointer;"
             onclick="javascript:location.href='insertDetail.go?sch_no=${sch.NO}&area_no=${areaList.NO}&sch_day_no=${sch_day_no}&city_no=${cityOne.NO}'"><br/>                       
             </span><br/>
            
               </c:forEach>
</div></div></div>       
	<div id="map"></div>
</body>
</html>