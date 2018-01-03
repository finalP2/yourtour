<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �����</title>
<style>
.label {margin-bottom: 96px;}
.label * {display: inline-block;vertical-align: top;}
.label .left {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
.label .center {background: url(http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;color: black;}
.label .right {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}

.panel-body { padding:0px; }
.panel-body table tr td { padding-left: 15px }
.panel-body .table {margin-bottom: 0px; }

.overlay {
    position:absolute;
    left: -50px;
    top:0;
    width:370px;
    height: 30px;
    background: #fff;
    border:1px solid #ccc;
    border-radius: 5px;
    padding:5px;
    font-size:12px;
    text-align: center;
    white-space: pre;
    word-wrap: break-word;
}	
</style>
</head>
<body>
<div style="padding-top: 20px;">
<h3 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;"><span class="glyphicon glyphicon-tags"></span>&nbsp;${sch.s_name }</h3>
</div>
 <div class="row" style="padding-top: 5px;">
        <div class="col-sm-2 col-md-2" style="padding-right: 5px; padding-left: 20px;">
            <div class="panel-group" id="accordion">
            
                <div class="panel panel-default">
                    <div class="list-group-item active" style="text-align:center;">
                        <h4 class="panel-title">
                        	���� ����
                        	<div style="padding-top: 5px;">
								<form action="scheduleState.go">
									<div class="input-group">
										<c:if test="${param.s_no != null }">
										<input type="hidden" value="${param.s_no }" name="s_no">
										</c:if>
										<input type="text" class="form-control input-sm" placeholder="���� �̸�" name="keyword">
									    <div class="input-group-btn">
										        <button type="submit" 
										        		class="btn btn-default btn-sm">�˻�</button>
									    </div>
								    </div>
								</form>
							</div>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" style="height:635px; overflow:auto">
                        <div class="panel-body">
                            <table class="table">
                            	<c:if test="${param.keyword == null}">
	                            <c:forEach var="stateList" items="${stateList }" varStatus="stat">
	                                <tr>
	                                   <td style="cursor:pointer;" onclick="javascript:location.href='scheduleCity.go?s_no=${sch.s_no}&state_no=${stateList.state_no}'">
	                                   	 ${stateList.state_name }
	                                   </td>
	                                   <td style="text-align:right; cursor:pointer;" onclick="javascript:location.href='scheduleCity.go?s_no=${sch.s_no}&state_no=${stateList.state_no}'"">
	                                   	<span class="glyphicon glyphicon-chevron-right"></span>
	                                   </td>
	                                </tr>
	                            </c:forEach>
	                            </c:if>
	                            <c:if test="${param.keyword != null}">
	                            <c:forEach var="stateSearchList" items="${stateSearchList }" varStatus="stat">
	                                <tr>
	                                   <td style="cursor:pointer;" onclick="javascript:location.href='scheduleCity.go?s_no=${sch.s_no}&state_no=${stateSearchList.state_no}'">
	                                   	 ${stateSearchList.state_name }
	                                   </td>
	                                   <td style="text-align:right">
	                                   	<span class="glyphicon glyphicon-chevron-right"></span>
	                                   </td>
	                                </tr>
	                            </c:forEach>
	                            </c:if>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-10 col-md-10" style="padding-left: 0px;">
            <div class="well" style="padding-top: 5px; padding-left: 5px; padding-bottom: 5px; padding-right: 5px;">
                <div id="map" style="width:100%; height:700px;"></div>
            </div>
        </div>
    </div>
  
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=431016a3643e6541b4ac065848f17cb3&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new daum.maps.LatLng(35.287058, 127.840157), // ������ �߽���ǥ
        level: 13 // ������ Ȯ�� ����
    };  
    
// ������ �����մϴ�    
var map = new daum.maps.Map(mapContainer, mapOption);

//���� Ÿ�� ���� ��Ʈ���� �����Ѵ�
var mapTypeControl = new daum.maps.MapTypeControl();

// ������ ��� ������ ���� Ÿ�� ���� ��Ʈ���� �߰��Ѵ�
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	

//������ �缳���� ���������� ������ ���� LatLngBounds ��ü�� �����մϴ�
var bounds = new daum.maps.LatLngBounds(); 

window.onload = function setBounds() {
    // LatLngBounds ��ü�� �߰��� ��ǥ���� �������� ������ ������ �缳���մϴ�
    // �̶� ������ �߽���ǥ�� ������ ����� �� �ֽ��ϴ�
    map.setBounds(bounds);
}

// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
var geocoder = new daum.maps.services.Geocoder();

<c:if test="${param.keyword == null}">
<c:forEach var="stateList" items="${stateList }" varStatus="stat">
// �ּҷ� ��ǥ�� �˻��մϴ�
geocoder.addr2coord('${stateList.state_name}', function(status, result) {
    // ���������� �˻��� �Ϸ������ 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });
        
        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
        bounds.extend(coords);
        
	     // Ŀ���� �������̿� ǥ���� �����Դϴ�     
	     // HTML ���ڿ� �Ǵ� Dom Element �Դϴ� 
	     var content = '<div class ="label"><a href="scheduleCity.go?s_no=${sch.s_no}&state_no=${stateList.state_no}">'+
	     			   '<span class="left"></span><span class="center">${stateList.state_name}</span><span class="right"></span>'+
	     			   '</a></div>';

	     // Ŀ���� �������̸� �����մϴ�
	     var customOverlay = new daum.maps.CustomOverlay({
	    	 map: map,
	         position: coords,
	         content: content,
	         yAnchor: 2.6
	     });
   
        // ��Ŀ�� Ŭ���̺�Ʈ5�� ����մϴ�
        daum.maps.event.addListener(marker, 'click', function() {
            // ��Ŀ ���� ���������츦 ǥ���մϴ�
        	 location.href='scheduleCity.go?s_no=${sch.s_no}&state_no=${stateList.state_no}';
     	 });
     }
});
</c:forEach>
</c:if>

<c:if test="${param.keyword != null}">
<c:forEach var="stateSearchList" items="${stateSearchList }" varStatus="stat">
//�ּҷ� ��ǥ�� �˻��մϴ�
geocoder.addr2coord('${stateSearchList.state_name}', function(status, result) {
 // ���������� �˻��� �Ϸ������ 
  if (status === daum.maps.services.Status.OK) {

     var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

     // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
     var marker = new daum.maps.Marker({
         map: map,
         position: coords
     });
     
     // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
     bounds.extend(coords);
     
	     // Ŀ���� �������̿� ǥ���� �����Դϴ�     
	     // HTML ���ڿ� �Ǵ� Dom Element �Դϴ� 
	     var content = '<div class ="label"><a href="scheduleCity.go?s_no=${sch.s_no}&state_no=${stateSearchList.state_no}">'+
	     			   '<span class="left"></span><span class="center">${stateSearchList.state_name}</span><span class="right"></span>'+
	     			   '</a></div>';

	     // Ŀ���� �������̸� �����մϴ�
	     var customOverlay = new daum.maps.CustomOverlay({
	    	 map: map,
	         position: coords,
	         content: content,
	         yAnchor: 2.6
	     });

     // ��Ŀ�� Ŭ���̺�Ʈ5�� ����մϴ�
     daum.maps.event.addListener(marker, 'click', function() {
         // ��Ŀ ���� ���������츦 ǥ���մϴ�
     	 location.href='scheduleCity.go?s_no=${sch.s_no}&state_no=${stateSearchList.state_no}';
  	 });
  }
});
</c:forEach>
</c:if>

//Ŀ���� �������� ������Ʈ�� �����, �������� �߰��մϴ�
var content = document.createElement('div');
content.className = 'overlay';
content.innerHTML = '<div><span class="glyphicon glyphicon-info-sign"></span> ��Ŀ�� ��ǳ���� Ŭ���ϸ� �ش� ������ ���÷� �̵��մϴ�.'
				   +'<div class="close" onclick="closeOverlay()" title="�ݱ�">X</div></div>';

// Ŀ���� �������̸� �����մϴ� 
var customoverlay = new daum.maps.CustomOverlay({
    map: map,
    content: content,
    position: new daum.maps.LatLng(38.632872355882476, 122.5418078002513)
});

// Ŀ���� �������̸� �巡�� �ϱ� ���� �ʿ���  
// �巡�� ������ǥ, Ŀ���� ���������� ��ġ��ǥ�� ���� ������ �����մϴ�
var startX, startY, startOverlayPoint;

// Ŀ���� �������̿� mousedown�̺�Ʈ�� ����մϴ� 
addEventHandle(content, 'mousedown', onMouseDown);

// mouseup �̺�Ʈ�� �Ͼ���� mousemove �̺�Ʈ�� �����ϱ� ����
// document�� mouseup �̺�Ʈ�� ����մϴ� 
addEventHandle(document, 'mouseup', onMouseUp);

// Ŀ���� �������̿� mousedown ���� �� ȣ��Ǵ� �ڵ鷯 �Դϴ� 
function onMouseDown(e) {
    // Ŀ���� �������̸� �巡�� �� ��, ���� �ؽ�Ʈ�� ���� ���õǴ� ������ �����ݴϴ�.
    if (e.preventDefault) {
        e.preventDefault();
    } else {
        e.returnValue = false;
    }

    var proj = map.getProjection(), // ���� ��ü�� ���� ȭ���ȼ���ǥ, ������ǥ�� ��ȯ�� ���� MapProjection ��ü�� ���ɴϴ� 
        overlayPos = customoverlay.getPosition(); // Ŀ���� ���������� ���� ��ġ�� �����ɴϴ�

    // Ŀ���ҿ������̿��� ���콺 ���� �̺�Ʈ�� �߻��ص� ������ �������� �ʵ��� �մϴ�
    daum.maps.event.preventMap();

    // mousedown�� ��ǥ�� �����մϴ� 
    startX = e.clientX; 
    startY = e.clientY;

    // mousedown���� ���� Ŀ���� ���������� ��ǥ��
    // ���� �����̳ʳ� �ȼ� ��ǥ�� ��ȯ�մϴ� 
    startOverlayPoint = proj.containerPointFromCoords(overlayPos);

    // document�� mousemove �̺�Ʈ�� ����մϴ� 
    addEventHandle(document, 'mousemove', onMouseMove);       
}

// Ŀ���� �������̿� mousedown �� ���¿��� 
// mousemove �ϸ� ȣ��Ǵ� �ڵ鷯 �Դϴ� 
function onMouseMove(e) {
    // Ŀ���� �������̸� �巡�� �� ��, ���� �ؽ�Ʈ�� ���� ���õǴ� ������ �����ݴϴ�.
    if (e.preventDefault) {
        e.preventDefault();
    } else {
        e.returnValue = false;
    }

    var proj = map.getProjection(),// ���� ��ü�� ���� ȭ���ȼ���ǥ, ������ǥ�� ��ȯ�� ���� MapProjection ��ü�� ���ɴϴ� 
        deltaX = startX - e.clientX, // mousedown�� �ȼ���ǥ���� mousemove�� ��ǥ�� ���� ������ ���콺�� �̵��� �ȼ���ǥ�� ���մϴ� 
        deltaY = startY - e.clientY,
        // mousedown���� ���� Ŀ���� ���������� ��ǥ�� ������ ���콺�� �̵��� �ȼ���ǥ�� �ݿ��մϴ� 
        newPoint = new daum.maps.Point(startOverlayPoint.x - deltaX, startOverlayPoint.y - deltaY), 
        // ���� �ȼ� ��ǥ�� ���� �����̳ʿ� �ش��ϴ� ���� ��ǥ�� �����մϴ� 
        newPos = proj.coordsFromContainerPoint(newPoint);

    // Ŀ���� ���������� ��ǥ�� �����մϴ� 
    customoverlay.setPosition(newPos);
}

// mouseup ���� �� ȣ��Ǵ� �ڵ鷯 �Դϴ� 
function onMouseUp(e) {
    // ��ϵ� mousemove �̺�Ʈ �ڵ鷯�� �����մϴ� 
    removeEventHandle(document, 'mousemove', onMouseMove);
}

// target node�� �̺�Ʈ �ڵ鷯�� ����ϴ� �Լ����ϴ�  
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// target node�� ��ϵ� �̺�Ʈ �ڵ鷯�� �����ϴ� �Լ����ϴ� 
function removeEventHandle(target, type, callback) {
    if (target.removeEventListener) {
        target.removeEventListener(type, callback);
    } else {
        target.detachEvent('on' + type, callback);
    }
}

function closeOverlay() {
	customoverlay.setMap(null);     
}
</script>
</body>
</html>