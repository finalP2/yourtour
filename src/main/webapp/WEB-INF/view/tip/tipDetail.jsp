<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title> 

<style type="text/css">


/*���� �ε��*/
#container {overflow:hidden;height:300px;position:relative;}
#btnRoadview,  #btnMap {position:absolute;top:5px;left:5px;padding:7px 12px;font-size:14px;border: 1px solid #dbdbdb;background-color: #fff;border-radius: 2px;box-shadow: 0 1px 1px rgba(0,0,0,.04);z-index:1;cursor:pointer;}
#btnRoadview:hover,  #btnMap:hover{background-color: #fcfcfc;border: 1px solid #c1c1c1;}
#container.view_map #mapWrapper {z-index: 10;}
#container.view_map #btnMap {display: none;}
#container.view_roadview #mapWrapper {z-index: 0;}
#container.view_roadview #btnRoadview {display: none;}
/*���� �ε�� ��*/

/* Ŀ���� �������� */
.label {margin-bottom: 96px;}
.label * {display: inline-block;vertical-align: top;}
.label .left {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
.label .center {background: url(http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;color: black;}
.label .right {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}

img {
    border-radius: 3px;
}

/*����ϱ� ��ư */
.button {
  padding: 10px 10px;
  font-size: 16px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #f4511e;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}
.button:hover {background-color: #cc441a}
.button:active {
  background-color: #cc441a;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

/*��� ��ư */
.listButton {
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 16px;
  padding: 10px;
  width: 120px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}
.listButton span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}
.listButton span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}
.listButton:hover span {
  padding-right: 25px;
}
.listButton:hover span:after {
  opacity: 1;
  right: 0;
}
</style>

<script type="text/javascript">
   function tipDelete() {
      if (confirm("���� �Ͻðڽ��ϱ�?") == true) {
         location.href = 'tipDelete.go?t_no=${tipModel.t_no}';
      } else {
         return;
      }
   }

   function tipModify() {
      if (confirm("���� �Ͻðڽ��ϱ�?") == true) {
         location.href = 'tipModify.go?t_no=${tipModel.t_no}';
      } else {
         return;
      }
   }
   
    function tipCommentDelete(t_co_no){
      if(confirm("����� �����Ͻðڽ��ϱ�?") == true){
         location.href = 'tipcommDelete.go?t_co_no='+t_co_no+'&t_no=${tipModel.t_no}&m_email=${session_m_email}';
      }else{
         return;
      }
      
   }
</script>
</head>

<body>

<br/><br/><br/>


<table align="center" width="60%">
<tr><td align="right">

<button type="button" class="listButton" onclick="javascript:location.href='tipList.go?currentPage=${param.currentPage}'" ><span>�������</span></button>
<c:if test="${session_m_email == tipModel.m_email }">
   <button type="button" class="btn btn-default" onclick="tipModify()" >����</button>
   <button type="button" class="btn btn-default" onclick="tipDelete()" >����</button>
</c:if>
<br/><br/>
</td></tr>
<tr><td>

<div class="panel panel-default">
  <div class="list-group-item active" align="center">
     <b><font size="5"><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;${tipModel.t_sub }</font></b><br/>
     �� �ۼ��� : ${tipModel.m_email }&nbsp;&nbsp;&nbsp;&nbsp;�� ��ȸ�� : ${tipModel.t_hit }&nbsp;&nbsp;&nbsp;&nbsp;�� �ۼ��� : <fmt:formatDate value="${tipModel.t_date }" pattern="yyyy.MM.dd" /><br/>
  </div>

  <div class="panel-body" align="center">
   <img  src="/gokkiri/resources/tip_img/${tip_imgList.t_img_sav}" width="100%"/><br/>
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-heading" align="center">
     <b><font size="3"><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;���� / �ε��</font></b>
  </div>

<div id="container" class="view_map">
    <div id="mapWrapper" style="width:100%;height:300px;position:relative;">
        <div id="map" style="width:100%;height:100%"></div> <!-- ������ ǥ���� div �Դϴ� -->
        <input type="button" id="btnRoadview" onclick="toggleMap(false)" title="�ε�� ����" value="�ε��">
    </div>
    <div id="rvWrapper" style="width:100%;height:300px;position:absolute;top:0;left:0;">
        <div id="roadview" style="width:100%;height:100%;position:relative;"></div> <!-- �ε�並 ǥ���� div �Դϴ� -->
        <input type="button" id="btnMap" onclick="toggleMap(true)" title="���� ����" value="����">
    </div>
</div>

<!-- ���� -->
<script src="//apis.daum.net/maps/maps3.js?apikey=431016a3643e6541b4ac065848f17cb3&libraries=services"></script>
<script>
var container = document.getElementById('container'), // ������ �ε�並 ���ΰ� �ִ� div �Դϴ�
mapWrapper = document.getElementById('mapWrapper'), // ������ ���ΰ� �ִ� div �Դϴ�
btnRoadview = document.getElementById('btnRoadview'), // ���� ���� �ε�� ��ư, Ŭ���ϸ� ������ �������� �ε�䰡 ���Դϴ� 
btnMap = document.getElementById('btnMap'), // �ε�� ���� ���� ��ư, Ŭ���ϸ� �ε��� �������� ������ ���Դϴ� 
roadviewContainer = document.getElementById('roadview'), // �ε�並 ǥ���� div �Դϴ�
mapContainer = document.getElementById('map'); // ������ ǥ���� div �Դϴ�

//������ �ε�� ���� ��Ŀ�� ǥ���� Ư�� ����� ��ǥ�Դϴ� 
var placePosition = new daum.maps.LatLng(33.450701, 126.570667);

//���� �ɼ��Դϴ� 
var mapOption = {
center: placePosition, // ������ �߽���ǥ 
level: 3 // ������ Ȯ�� ����
};


//�ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
var geocoder = new daum.maps.services.Geocoder();



// �ּҷ� ��ǥ�� �˻��մϴ�
geocoder.addr2coord('${tipModel.a_addr}', function(status, result) {

    // ���������� �˻��� �Ϸ������ 
     if (status === daum.maps.services.Status.OK) {

       var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
    
       //�ε�� ��ü�� �����Ѵ�
       var roadview = new daum.maps.Roadview(roadviewContainer, {
          pan: 47, // �ε�� ó�� ����ÿ� �ٶ���� �� ���� ��
          tilt: 0, // �ε�� ó�� ����ÿ� �ٶ���� �� ���� ��
          zoom: 0 // �ε�� �� �ʱⰪ
       }); 

       //��ǥ�κ��� �ε�� �ĳ�ID�� ������ �ε�� helper��ü�� �����Ѵ�
       var roadviewClient = new daum.maps.RoadviewClient(); 

       // Ư�� ��ġ�� ��ǥ�� ����� �ε���� panoId�� �����Ͽ� �ε�並 ����
       roadviewClient.getNearestPanoId(coords, 50, function(panoId) {
          // panoId�� �߽���ǥ�� ���� �ε�並 �����Ѵ�
           roadview.setPanoId(panoId, coords); 
       });
       
       //�ε�� �ʱ�ȭ�� �Ϸ�Ǹ� 
       daum.maps.event.addListener(roadview, 'init', function() {

       // �ε�信 Ư�� ��Ҹ� ǥ���� ��Ŀ�� �����ϰ� �ε�� ���� ǥ���մϴ� 
       var rvMarker = new daum.maps.Marker({
          map: roadview,
          position: coords
       });
       });

        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // Ŀ���� �������̿� ǥ���� �����Դϴ�     
        // HTML ���ڿ� �Ǵ� Dom Element �Դϴ� 
        var content = '<div class ="label">'+
                    '<span class="left"></span><span class="center">${tipModel.a_name}</span><span class="right"></span>'+
                    '</div>';

        // Ŀ���� �������̸� �����մϴ�
        var customOverlay = new daum.maps.CustomOverlay({
           map: map,
            position: coords,
            content: content,
            yAnchor: 2.7
        });

        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
        map.setCenter(coords);
    } 
}); 



//������ ǥ���� div�� ���� �ɼ����� ������ �����մϴ�
var map = new daum.maps.Map(mapContainer, mapOption);


//������ �ε�並 ���ΰ� �ִ� div�� class�� �����Ͽ� ������ ����ų� ���̰� �ϴ� �Լ��Դϴ� 
function toggleMap(active) {
if (active) {

    // ������ ���̵��� ������ �ε�並 ���ΰ� �ִ� div�� class�� �����մϴ�
    container.className = "view_map"
    
} else {

    // ������ ���������� ������ �ε�並 ���ΰ� �ִ� div�� class�� �����մϴ�
    container.className = "view_roadview"  
    
}
}
</script>
<!-- ���� �� -->

</div>

<div class="panel panel-default">
   <div class="panel-heading" align="center">
      <font size="3"><b><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;���</b></font>
   </div>
     <div class="panel-body" align="center">
        <b>${tipModel.a_addr}&nbsp${tipModel.a_name}</b>     
     </div>
</div>

<div class="panel panel-default">
   <div class="panel-heading" align="center">
      <font size="3"><b><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;Tip</b></font>
   </div>
     <div class="panel-body" align="center">
        <b>${tipModel.t_con }</b><br/>
     </div>
</div>


</td></tr>
</table>

<br/><br/>

<!-- ��� ���� -->
<table width="60%" align="center">

   <c:if test="${session_m_email == null}">
   <tr>
      <td align="center">
         <br/><br/>��۾��� ������ �����ϴ�. �α��� ���ּ���.<br/><br/><br/>
      </td>
   </tr>
   </c:if>
   
   <c:if test="${session_m_email != null }">
   <tr>
      <td align="left">
         <form action="tipcommWrite.go" method="post">
               <input type="hidden" name="t_no" value="${tipcoModel.t_no }" />
               <input type="hidden" name="m_email" value="${session_m_email }" />
               <b>�ۼ��� : ${session_m_email }</b>
               <div class="row">
                  <div class="col-sm-12">
                     <div class="form-group">
                          <textarea class="form-control" rows="5" id="comment" name="t_co_con" placeholder="��۳����� �Է����ּ���"></textarea>
                       </div>
                       <div class="col-sm-2-left" align="right">
                          <button type="submit" class="button">����ϱ�</button>
                     </div>
                  </div>
               </div>
         </form>
      </td>
   </tr>
   </c:if>

</table>



<c:if test="${fn:length(tipcommList) eq 0}">
<table width="60%" align="center">   

   <tr><td align="center">
   <br />
   <center>��ϵ� ����� �����ϴ�</center>
   <br />
   </td></tr>

</table>
</c:if>

<table width="60%" align="center">   
   <c:forEach var="tipcommList" items="${tipcommList }">
   <tr>
      <td>
         <br/>
         <b><font color="gray" size="3">${tipcommList.m_email }</font></b>
          / <fmt:formatDate value="${tipcommList.t_co_date }" pattern="yyyy.MM.dd" />
          
          <c:if test="${session_m_email == tipcommList.m_email || session_m_email == 'admin' }">
         &nbsp;/&nbsp;
         <button type="button" class="btn btn-link" onclick="tipCommentDelete(${tipcommList.t_co_no});">x</button>
         
         </c:if>
         <br/><br/>
         ${tipcommList.t_co_con }
         <br/><br/>
      </td>
   </tr>
   <tr height="1">
      <td bgcolor="gray" colspan="2"></td>
   </tr>
   </c:forEach>
</table>

<br/><br/><br/>
<div>
    <a href="#" class="jcm-top"><img src="../resources/img/arrow-up.png" style="margin-bottom: 40px;width: 40px;"></a>
</div>
</body>
</html>
