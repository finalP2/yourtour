<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �����</title>
<style>
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

    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '����', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #d95050;border-bottom: 1px solid #ddd;font-size: 12px;font-weight: bold; font-size:12px;color: #fff;}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden; border-radius: 3px;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;} 
    .label {margin-bottom: 96px;}
    
.label * {display: inline-block;vertical-align: top;}
.label .left {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
.label .center {background: url(http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;color: black;}
.label .right {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}

.modal{
padding-top:50px; 
}

.panel-body { padding:0px; }
.panel-body table tr td { padding-left: 15px }
.panel-body .table {margin-bottom: 0px;}

$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
})

</style>
</head>
<body>
<div style="padding-top: 15px;">
<form:form class="form-inline" action="scheduleComplete.go">
  <div class="form-group" style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;">
    <label for="exampleInputName2"><font size="5"><span class="glyphicon glyphicon-tags"></span></font>&nbsp;&nbsp;</label>
    <input type="text" class="form-control" name="s_name" value="${sch.s_name }" placeholder="���� �̸��� �Է����ּ���.">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </div>
  
  <c:if test="${not empty togetherList }">
	  <button class="btn btn-default btn-md" type="button" onclick="#" data-toggle="modal" data-target="#together">
	     	<span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;���� ģ�� ���
	  </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </c:if>
  								 <div id="together" class="modal fade" role="dialog">
					               <div class="modal-dialog">
					               <!-- Modal content-->
					               	<div class="modal-content">
						                <div class="modal-header">
							                <button type="button" class="close" data-dismiss="modal">&times;</button>
							                <h4 class="modal-title">���� ģ�� ���</h4>
						                </div>
						                <div class="modal-body">
  	<c:forEach var="togetherList" items="${togetherList }">
    		<span class="glyphicon glyphicon-user"></span>&nbsp;${togetherList.s_together }
    		<c:if test="${togetherList.s_state == 0 }">
				(��û��...)&nbsp;
			</c:if>
			<br/>
    </c:forEach>
						                </div>                 
						                <div class="modal-footer">
						                	<button type="button" class="btn btn-default" data-dismiss="modal">������</button>
						                </div>
					               	</div>
					               </div>
					             </div>
  
  <input type="hidden" name="s_no" value="${param.s_no }">
  <button class="button" type="submit">���� �ϼ�!</button>
</form:form>
</div>

<div class="row" style="padding-top: 5px;">
        <div class="col-sm-3 col-md-3" style="padding-right: 0px; padding-left: 20px;">
            <div class="panel-group" id="accordion">
            
                <div class="panel panel-default">
                    <div class="list-group-item active" style="text-align:center;">
                        <h4 class="panel-title">
                        	<span class="glyphicon glyphicon-calendar"></span>&nbsp;${sch.s_start_date} ~ ${sch.s_end_date }
                        	<div style="padding-top: 5px;">
							<div class="btn-group" >
							<c:forEach var="a" begin="1" end="${sch.s_idx+1}" step="1">
								<c:if test="${param.a_cate == null }">
								  <button type="button" onclick="javascript:location.href='scheduleArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${a}'" class="btn btn-default btn-xs">
								  	${a }����
								  </button>
							    </c:if>
							    <c:if test="${param.a_cate != null }">
								  <button type="button" onclick="javascript:location.href='scheduleArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&a_cate=${param.a_cate }&s_idx=${a}'" class="btn btn-default btn-xs">
								  	${a }����
								  </button>
							    </c:if>
							</c:forEach>	
							</div>
							</div>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" style="height:650px; overflow:auto">
                        <div class="panel-body">
                            <table class="table">
                            	<tr>
                            		<td style="text-align:center; font-weight:bold;">
                            			<c:if test="${empty scheduleList }">
                            				������ �߰����ּ���.
                            			</c:if>
                            			<c:if test="${not empty scheduleList }">
                            				<span class="glyphicon glyphicon-th-list"></span>&nbsp;${param.s_idx }���� ���� ���
                            			</c:if>
                            		</td>
                            	</tr>
	                            <c:forEach var="scheduleList" items="${scheduleList }" varStatus="stat">
	                                <tr>
	                                   <td class="col-xs-6">
	                                   	<span class="label label-primary">${stat.count }</span>
	                                   	<c:if test="${scheduleList.a_cate == 0 }">
	                                   		<span class="glyphicon glyphicon-camera"></span>
	                                   	</c:if>
	                                    <c:if test="${scheduleList.a_cate == 1 }">
	                                   		<span class="glyphicon glyphicon-cutlery"></span>
	                                   	</c:if>
	                                   	${scheduleList.a_name } 
	                                   </td>
	                                   <td class="col-xs-2" style="text-align:right">
	                                   	<button onclick="#" data-toggle="modal" data-target="#memo_${stat.count }" class="btn btn-default btn-xs">�޸�</button>
	                                   </td>
	                                   <td class="col-xs-2" style="text-align:right">
	                                   	<c:if test="${param.a_cate == null }">
	                                   		<c:if test="${!stat.first }">
	                                   			<span class="glyphicon glyphicon-chevron-up"
	                                   				data-toggle="tooltip" title="�� �������� ������ �����մϴ�."
	                                   				style="cursor:pointer;"
	                                   				onclick="javascript:location.href='turnDown.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${scheduleList.a_no }&s_detail_turn=${scheduleList.s_detail_turn }'"></span>
								        	</c:if>
								        	<c:if test="${!stat.last }">
								        		<span class="glyphicon glyphicon-chevron-down"
								        			data-toggle="tooltip" title="�� �������� ������ �����մϴ�."
								        			style="cursor:pointer;"
								        			onclick="javascript:location.href='turnUp.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${scheduleList.a_no }&s_detail_turn=${scheduleList.s_detail_turn }'"></span>
								        	</c:if>
								        </c:if>
								        <c:if test="${param.a_cate != null }">
	                                   		<c:if test="${!stat.first }">
	                                   			<span class="glyphicon glyphicon-chevron-up"
	                                   				data-toggle="tooltip" title="�� �������� ������ �����մϴ�."
	                                   				style="cursor:pointer;"
	                                   				onclick="javascript:location.href='turnDown.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&a_cate=${param.a_cate }&s_idx=${param.s_idx}&a_no=${scheduleList.a_no }&s_detail_turn=${scheduleList.s_detail_turn }'"></span>
								        	</c:if>
								        	<c:if test="${!stat.last }">
								        		<span class="glyphicon glyphicon-chevron-down"
								        			data-toggle="tooltip" title="�� �������� ������ �����մϴ�."
								        			style="cursor:pointer;"
								        			onclick="javascript:location.href='turnUp.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&a_cate=${param.a_cate }&s_idx=${param.s_idx}&a_no=${scheduleList.a_no }&s_detail_turn=${scheduleList.s_detail_turn }'"></span>
								        	</c:if>
								        </c:if>
								       </td>
								       <td class="col-xs-1" style="text-align:right">
								       		<c:if test="${param.a_cate ==null }">
											<span class="glyphicon glyphicon-remove"
								        		data-toggle="tooltip" title="�� �������� �������� �����մϴ�." 
								        		style="cursor:pointer;"
								        		onclick="javascript:location.href='deleteArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${scheduleList.a_no }&s_detail_turn=${scheduleList.s_detail_turn }'">
								        	</span>
								        	</c:if>
								        	<c:if test="${param.a_cate !=null }">
											<span class="glyphicon glyphicon-remove"
								        		data-toggle="tooltip" title="�� �������� �������� �����մϴ�." 
								        		style="cursor:pointer;"
								        		onclick="javascript:location.href='deleteArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_cate=${param.a_cate }&a_no=${scheduleList.a_no }&s_detail_turn=${scheduleList.s_detail_turn }'">
								        	</span>
								        	</c:if>
										</td>
	                                </tr>
	                                
	                                 <div id="memo_${stat.count }" class="modal fade" role="dialog">
					                 <div class="modal-dialog">
					                     <!-- Modal content-->
					                     <form:form commandName="scheduleModel" id="writeMemo" action="writeMemo.go" method="post" class="form-inline">
					                     <div class="modal-content">
					                        <div class="modal-header">
					                        <button type="button" class="close" data-dismiss="modal">&times;</button>
					                        <h4 class="modal-title">�޸�</h4>
					                        </div>
					                     
					                        <div class="modal-body">
											    <textarea class="form-control" rows="5" cols="70" name="s_detail_memo">${scheduleList.s_detail_memo }</textarea>
												<input type="hidden" name="s_detail_no" value="${scheduleList.s_detail_no }">
												<input type="hidden" name="state_no" value="${param.state_no }">
												<input type="hidden" name="c_no" value="${param.c_no }">
												<input type="hidden" name="s_idx" value="${param.s_idx }">
												<input type="hidden" name="s_no" value="${param.s_no }">
												<c:if test="${param.a_cate != null }">
													<input type="hidden" name="a_cate" value="${param.a_cate }">
												</c:if>
					                        </div>
					                                                    
					                           <div class="modal-footer">
					                              <input type="submit" class="btn btn-primary odom-submit" value="����" onclick='document.forms["schDownload"].submit();'/>
					                              <button type="button" class="btn btn-default" data-dismiss="modal">������</button>
					                           </div>
					                        </div>
					                     </form:form>
					                     </div>
					               </div>
	                            </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-2 col-md-2" style="padding-right: 5px; padding-left: 5px;">
            <div class="panel-group" id="accordion">
            
                <div class="panel panel-default">
                    <div class="list-group-item active" style="text-align:center;">
                        <h4 class="panel-title">
                        	<button onclick="javascript:location.href='scheduleCity.go?s_no=${param.s_no}&state_no=${param.state_no}'" 
                        		class="btn btn-default btn-xs"
                        		style="margin-bottom: 5px;">
                        				<span class="glyphicon glyphicon-refresh"></span>&nbsp;���� ����
                        	</button>
                        	<br>
                        	������
							<div style="padding-top: 5px;">
								<form action="scheduleArea.go">
									<div class="input-group">
										<input type="hidden" value="${param.s_no }" name="s_no">
										<input type="hidden" value="${param.state_no }" name="state_no">
										<input type="hidden" value="${param.c_no }" name="c_no">
										<c:if test="${param.a_cate != null }">
											<input type="hidden" value="${param.a_cate }" name="a_cate">
										</c:if>
										<input type="hidden" value="${param.s_idx }" name="s_idx">
										<input type="text" class="form-control input-sm" placeholder="������ �̸�" name="searchKeyword">
									    <div class="input-group-btn">
										        <button type="submit" 
										        		class="btn btn-default btn-sm">�˻�</button>
									    </div>
								    </div>
								</form>
							</div>
							<div class="btn-group" style="padding-top: 5px;" >
							  <button type="button" onclick="javascript:location.href='scheduleArea.go?s_no=${param.s_no }&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx }'" class="btn btn-default btn-xs">
							  	<span class="glyphicon glyphicon-th-list"></span>&nbsp;��ü
							  </button>
							  <button type="button" onclick="javascript:location.href='scheduleArea.go?s_no=${param.s_no }&state_no=${param.state_no}&c_no=${param.c_no}&a_cate=0&s_idx=${param.s_idx }'" 
							  	data-toggle="tooltip" title="������ �� �������� �˻��մϴ�." 
							  	class="btn btn-default btn-xs">
							  		<span class="glyphicon glyphicon-camera"></span>&nbsp;������
							  </button>
							  <button type="button" onclick="javascript:location.href='scheduleArea.go?s_no=${param.s_no }&state_no=${param.state_no}&c_no=${param.c_no}&a_cate=1&s_idx=${param.s_idx }'" 
							  	data-toggle="tooltip" title="������ �� ������ �˻��մϴ�." 
							  	class="btn btn-default btn-xs">
							  		<span class="glyphicon glyphicon-cutlery"></span>&nbsp;����
							  </button>
							</div>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" style="height:585px; overflow:auto">
                        <div class="panel-body">
                            <table class="table">
                            	<c:if test="${param.searchKeyword==null }">
		                            <c:forEach var="schAreaList" items="${schAreaList }" varStatus="stat">
		                                <tr>
		                                   <td>
		                                   	<c:if test="${schAreaList.a_cate == 0 }">
		                                   		<span class="glyphicon glyphicon-camera"></span>
		                                   	</c:if>
		                                   	<c:if test="${schAreaList.a_cate == 1 }">
		                                   		<span class="glyphicon glyphicon-cutlery"></span>
		                                   	</c:if>
		                                   	${schAreaList.a_name }
		                                   </td>
		                                   <td 
	                                   		style="cursor:pointer;" 
	                                   		onclick="window.open('http://localhost:8080/gokkiri/area/areaDetail.go?a_no=${schAreaList.a_no}&keyword=info','������ ����','width=550, height=500, toolbar=no, menubar=no, scrollbars=yes,status=no, resizable=yes');return false;">
		                                   	<span class="glyphicon glyphicon-info-sign"></span>
		                                   </td>
		                                   <td>
		                                   	<span data-toggle="tooltip" title="�αⰡ ���� ������" class="glyphicon glyphicon-paperclip">${schAreaList.a_count }</span>
		                                   </td>
		                                   <td style="text-align:right">
		                                   <c:if test="${param.a_cate!=null }">
		                                   	<span class="glyphicon glyphicon-plus"
		                                   		data-toggle="tooltip" title="�� �������� ������ �߰��մϴ�." 
		                                   		style="cursor:pointer;"
		                                   		onclick="javascript:location.href='insertArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_cate=${param.a_cate }&a_no=${schAreaList.a_no }'">
		                                   	</span>
		                                   </c:if>
		                                   <c:if test="${param.a_cate==null }">
		                                   	<span class="glyphicon glyphicon-plus"
		                                   		data-toggle="tooltip" title="�� �������� ������ �߰��մϴ�." 
		                                   		style="cursor:pointer;"
		                                   		onclick="javascript:location.href='insertArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${schAreaList.a_no }'">
		                                   	</span>
		                                   </c:if>
									       </td>
		                                </tr>
		                            </c:forEach>
	                            </c:if>
	                            <c:if test="${param.searchKeyword != null }">
		                            <c:forEach var="schAreaSearch" items="${schAreaSearch }" varStatus="stat">
		                                <tr>
		                                   <td>
		                                   	<c:if test="${schAreaSearch.a_cate == 0 }">
		                                   		<span class="glyphicon glyphicon-camera"></span>
		                                   	</c:if>
		                                   	<c:if test="${schAreaSearch.a_cate == 1 }">
		                                   		<span class="glyphicon glyphicon-cutlery"></span>
		                                   	</c:if>
		                                   	${schAreaSearch.a_name }
		                                   </td>
		                                   <td
	                                   		style="cursor:pointer;" 
											onclick="window.open('http://localhost:8080/gokkiri/area/areaDetail.go?a_no=${schAreaSearch.a_no}&keyword=info','������ ����','width=550, height=500, toolbar=no, menubar=no, scrollbars=yes,status=no, resizable=yes');return false;">
		                                   	<span class="glyphicon glyphicon-info-sign"></span>
		                                   </td>
		                                   <td>
		                                   	<span class="glyphicon glyphicon-paperclip">${schAreaSearch.a_count }</span>
		                                   </td>
		                                   <td>
		                                   	<span class="glyphicon glyphicon-plus"
		                                   		data-toggle="tooltip" title="�� �������� ������ �߰��մϴ�." 
		                                   		style="cursor:pointer;"
		                                   		onclick="javascript:location.href='insertArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${schAreaSearch.a_no }'"></span>
									       </td>
		                                </tr>
		                            </c:forEach>
	                            </c:if>
	                            
	                            <div id="info" class="modal fade" role="dialog">
					               <div class="modal-dialog">
					               <!-- Modal content-->
					               	<div class="modal-content">
						                <div class="modal-header">
							                <button type="button" class="close" data-dismiss="modal">&times;</button>
							                <h4 class="modal-title"></h4>
						                </div>
						                	<div class="modal-body">
						                </div>                 
						                <div class="modal-footer">
						                	<button type="button" class="btn btn-default" data-dismiss="modal">������</button>
						                </div>
					               	</div>
					               </div>
					             </div>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-7 col-md-7" style="padding-left: 0px;">
            <div class="well" style="padding-top: 5px; padding-left: 5px; padding-bottom: 5px; padding-right: 5px;">
                <div id="map" style="width:100%; height:700px;"></div>
            </div>
        </div>
    	</div>
  
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=431016a3643e6541b4ac065848f17cb3&libraries=services"></script>
<script async="async">
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new daum.maps.LatLng(37.534584, 126.983512), // ������ �߽���ǥ
        level: 8 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new daum.maps.Map(mapContainer, mapOption); 

//���� Ÿ�� ���� ��Ʈ���� �����Ѵ�
var mapTypeControl = new daum.maps.MapTypeControl();
// ������ ��� ������ ���� Ÿ�� ���� ��Ʈ���� �߰��Ѵ�
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	
//������ Ȯ�� ��� ��Ʈ���� �����Ѵ�
var zoomControl = new daum.maps.ZoomControl();
// ������ ������ Ȯ�� ��� ��Ʈ���� �߰��Ѵ�
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
var geocoder = new daum.maps.services.Geocoder();

//������ �缳���� ���������� ������ ���� LatLngBounds ��ü�� �����մϴ�
var bounds = new daum.maps.LatLngBounds(); 

window.onload = function setBounds() {
    // LatLngBounds ��ü�� �߰��� ��ǥ���� �������� ������ ������ �缳���մϴ�
    // �̶� ������ �߽���ǥ�� ������ ����� �� �ֽ��ϴ�
    map.setBounds(bounds);
}

var linePath = new Array(); 

<c:forEach var="scheduleList" items="${scheduleList }" varStatus="status">
geocoder.addr2coord('${scheduleList.a_addr}', function(status, result) {
	// ���������� �˻��� �Ϸ������ 
     if (status === daum.maps.services.Status.OK) {

    	var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		
    	//����
    	if(${scheduleList.a_cate}==1){
    	var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_r.png', 
	    markerImageSize = new daum.maps.Size(27, 27), // ��Ŀ �̹����� ũ��
	    markerImageOptions = { 
	        spriteOrigin : new daum.maps.Point(46, 154), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
	        spriteSize : new daum.maps.Size(72, 648), // ��������Ʈ �̹����� ��ü ũ�� 
	        offset : new daum.maps.Point(11, 27)// ��Ŀ ��ǥ�� ��ġ��ų �̹��� ���� ��ǥ
	    };

		// ��Ŀ �̹����� �����Ѵ�
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
	
		// ������ ��Ŀ�� �����ϰ� ǥ���Ѵ�
		var marker = new daum.maps.Marker({
		    position: coords, // ��Ŀ�� ��ǥ
		    image : markerImage, // ��Ŀ�� �̹���
		    map: map // ��Ŀ�� ǥ���� ���� ��ü
		});
    	}
        
    	//������
    	if (${scheduleList.a_cate}==0) {
		// ��Ŀ �̹����� �ּ�
		var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_r.png', 
		    markerImageSize = new daum.maps.Size(27, 27), // ��Ŀ �̹����� ũ��
		    markerImageOptions = { 
		        spriteOrigin : new daum.maps.Point(46, 118), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
		        spriteSize : new daum.maps.Size(72, 648), // ��������Ʈ �̹����� ��ü ũ�� 
		        offset : new daum.maps.Point(11, 27)// ��Ŀ ��ǥ�� ��ġ��ų �̹��� ���� ��ǥ
		    };

		// ��Ŀ �̹����� �����Ѵ�
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

		// ������ ��Ŀ�� �����ϰ� ǥ���Ѵ�
		var marker = new daum.maps.Marker({
		    position: coords, // ��Ŀ�� ��ǥ
		    image : markerImage, // ��Ŀ�� �̹���
		    map: map // ��Ŀ�� ǥ���� ���� ��ü
		});
     	}
       
   	    // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
        bounds.extend(coords);
   	    
   		 if(linePath.length == ${status.index}){
   	    	 linePath.push(coords);
   	     } 
   	     // ������ ǥ���� ���� �����մϴ�
   	     var polyline = new daum.maps.Polyline({
   	         path: linePath, // ���� �����ϴ� ��ǥ�迭 �Դϴ�
   	         strokeWeight: 2, // ���� �β� �Դϴ�
   	         strokeColor: '#db4040', // ���� �����Դϴ�
   	         strokeOpacity: 0.9, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
   	         endArrow : true,
   	         map : map
   	     });

   
         // Ŀ���� �������̿� ǥ���� �����Դϴ�     
	     // HTML ���ڿ� �Ǵ� Dom Element �Դϴ� 
	    var content = '<div class ="label">'+
	     			   '<span class="left"></span><span class="center"><bold>${status.index+1}</bold> ${scheduleList.a_name}</span><span class="right"></span>'+
	     			   '</div>';

	     // Ŀ���� �������̸� �����մϴ�
	     var customOverlay = new daum.maps.CustomOverlay({
	    	 map: map,
	         position: coords,
	         content: content,
	         yAnchor: 2.2
	     });
         
	  	// ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
        daum.maps.event.addListener(marker, 'click', function() {
             // ��Ŀ ���� ���������츦 ǥ���մϴ�
         	 location.href='insertArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${scheduleList.a_no }';
      	 });  

     }
    
});
</c:forEach>

<c:if test="${empty param.a_cate}">
<c:forEach var="areaList" items="${areaList }" varStatus="status">
geocoder.addr2coord('${areaList.a_addr}', function(status, result) {
	// ���������� �˻��� �Ϸ������ 
     if (status === daum.maps.services.Status.OK) {

    	var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		
    	//����
    	<c:if test="${areaList.a_cate == 1}">
    	var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_r.png', 
	    markerImageSize = new daum.maps.Size(27, 27), // ��Ŀ �̹����� ũ��
	    markerImageOptions = { 
	        spriteOrigin : new daum.maps.Point(10, 154), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
	        spriteSize : new daum.maps.Size(72, 648), // ��������Ʈ �̹����� ��ü ũ�� 
	        offset : new daum.maps.Point(11, 27)// ��Ŀ ��ǥ�� ��ġ��ų �̹��� ���� ��ǥ
	    };

		// ��Ŀ �̹����� �����Ѵ�
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
	
		// ������ ��Ŀ�� �����ϰ� ǥ���Ѵ�
		var marker = new daum.maps.Marker({
		    position: coords, // ��Ŀ�� ��ǥ
		    image : markerImage, // ��Ŀ�� �̹���
		    map: map // ��Ŀ�� ǥ���� ���� ��ü
		});
        </c:if>
        
    	//������
    	<c:if test="${areaList.a_cate == 0}">
		// ��Ŀ �̹����� �ּ�
		   var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_r.png', 
		    markerImageSize = new daum.maps.Size(27, 27), // ��Ŀ �̹����� ũ��
		    markerImageOptions = { 
		        spriteOrigin : new daum.maps.Point(10, 118), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
		        spriteSize : new daum.maps.Size(72, 648), // ��������Ʈ �̹����� ��ü ũ�� 
		        offset : new daum.maps.Point(11, 27)// ��Ŀ ��ǥ�� ��ġ��ų �̹��� ���� ��ǥ
		    };

		// ��Ŀ �̹����� �����Ѵ�
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

		// ������ ��Ŀ�� �����ϰ� ǥ���Ѵ�
		var marker = new daum.maps.Marker({
		    position: coords, // ��Ŀ�� ��ǥ
		    image : markerImage, // ��Ŀ�� �̹���
		    map: map // ��Ŀ�� ǥ���� ���� ��ü
		});
        </c:if>
        
   	    // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
        bounds.extend(coords);
   	    
   	    var content = '<div class="wrap">' + 
			'    <div class="info">' + 
			'        <div class="title">' + 
			'            ${areaList.a_name}' +
			'        </div>' + 
			'        <div class="body">' + 
			'            <div class="img">' +
			'                <img src="/gokkiri/resources/area_img/${areaList.a_img_sav }" width="73" height="70" />' +
			'           </div>' + 
			'            <div class="desc">' + 
			'                <div class="ellipsis">${areaList.a_addr}</div>' + 
			'                <div class="jibun ellipsis">${areaList.a_way}</div>' + 
			'                <div class="link">${areaList.a_tel}</div>'+
			'            </div>' + 
			'        </div>' + 
			'    </div>' +    
			'</div>'; 
			
         // ��Ŀ�� ���콺���� �̺�Ʈ�� ����մϴ�
         daum.maps.event.addListener(marker, 'mouseover', function() {
           // ��Ŀ�� ���콺���� �̺�Ʈ�� �߻��ϸ� ���������츦 ��Ŀ���� ǥ���մϴ�
        	 overlay = new daum.maps.CustomOverlay({
        		    content: content,
        		    map: map,
        		    position: marker.getPosition()
        		 });
        	 daum.maps.event.addListener(marker, 'mouseout', function() {
                 // ��Ŀ�� ���콺�ƿ� �̺�Ʈ�� �߻��ϸ� ���������츦 �����մϴ�
        		 overlay.setMap(null);
             }); 
         });
         
     	 // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
         daum.maps.event.addListener(marker, 'click', function() {
             // ��Ŀ ���� ���������츦 ǥ���մϴ�
         	 location.href='insertArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&s_idx=${param.s_idx}&a_no=${areaList.a_no }';
      	 });      	 
     }
    
});
</c:forEach>
</c:if>

<c:if test="${not empty param.a_cate}">
<c:forEach var="areaCateList" items="${areaCateList }" varStatus="stat">
geocoder.addr2coord('${areaCateList.a_addr}', function(status, result) {
    // ���������� �˻��� �Ϸ������ 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

      //����
    	<c:if test="${areaCateList.a_cate == 1}">
    	var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_r.png', 
	    markerImageSize = new daum.maps.Size(27, 27), // ��Ŀ �̹����� ũ��
	    markerImageOptions = { 
	        spriteOrigin : new daum.maps.Point(10, 154), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
	        spriteSize : new daum.maps.Size(72, 648), // ��������Ʈ �̹����� ��ü ũ�� 
	        offset : new daum.maps.Point(11, 27)// ��Ŀ ��ǥ�� ��ġ��ų �̹��� ���� ��ǥ
	    };

		// ��Ŀ �̹����� �����Ѵ�
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
	
		// ������ ��Ŀ�� �����ϰ� ǥ���Ѵ�
		var marker = new daum.maps.Marker({
		    position: coords, // ��Ŀ�� ��ǥ
		    image : markerImage, // ��Ŀ�� �̹���
		    map: map // ��Ŀ�� ǥ���� ���� ��ü
		});
        </c:if>
        
    	//������
    	<c:if test="${areaCateList.a_cate == 0}">
		// ��Ŀ �̹����� �ּ�
		var markerImageUrl = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_r.png', 
		    markerImageSize = new daum.maps.Size(27, 27), // ��Ŀ �̹����� ũ��
		    markerImageOptions = { 
		        spriteOrigin : new daum.maps.Point(10, 118), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
		        spriteSize : new daum.maps.Size(72, 648), // ��������Ʈ �̹����� ��ü ũ�� 
		        offset : new daum.maps.Point(11, 27)// ��Ŀ ��ǥ�� ��ġ��ų �̹��� ���� ��ǥ
		    };

		// ��Ŀ �̹����� �����Ѵ�
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);

		// ������ ��Ŀ�� �����ϰ� ǥ���Ѵ�
		var marker = new daum.maps.Marker({
		    position: coords, // ��Ŀ�� ��ǥ
		    image : markerImage, // ��Ŀ�� �̹���
		    map: map // ��Ŀ�� ǥ���� ���� ��ü
		});
        </c:if>
     

        var content = '<div class="wrap">' + 
			'    <div class="info">' + 
			'        <div class="title">' + 
			'            ${areaCateList.a_name}  ' + 
			'        </div>' + 
			'        <div class="body">' + 
			'            <div class="img">' +
			'                <img src="../resources/area_img/${areaCateList.a_img_sav }" width="73" height="70" />' +
			'           </div>' + 
			'            <div class="desc">' + 
			'                <div class="ellipsis">${areaCateList.a_addr}</div>' + 
			'                <div class="jibun ellipsis">${areaCateList.a_way}</div>' + 
			'                <div class="link">${areaCateList.a_tel}</div>'+
			'            </div>' + 
			'        </div>' + 
			'    </div>' +    
			'</div>';
			
			// LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
	        bounds.extend(coords);
           
        // ��Ŀ�� ���콺���� �̺�Ʈ�� ����մϴ�
        daum.maps.event.addListener(marker, 'mouseover', function() {
          // ��Ŀ�� ���콺���� �̺�Ʈ�� �߻��ϸ� ���������츦 ��Ŀ���� ǥ���մϴ�
       	 overlay = new daum.maps.CustomOverlay({
       		    content: content,
       		    map: map,
       		    position: marker.getPosition()
       		 });
       	 daum.maps.event.addListener(marker, 'mouseout', function() {
                // ��Ŀ�� ���콺�ƿ� �̺�Ʈ�� �߻��ϸ� ���������츦 �����մϴ�
       		 overlay.setMap(null);
            }); 
        });
        
    	 // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
        daum.maps.event.addListener(marker, 'click', function() {
            // ��Ŀ ���� ���������츦 ǥ���մϴ�
        	 location.href='insertArea.go?s_no=${param.s_no}&state_no=${param.state_no}&c_no=${param.c_no}&a_cate=${param.a_cate}&s_idx=${param.s_idx}&a_no=${areaCateList.a_no }';
        	 
     	 }); 
     }
    
});
</c:forEach>
</c:if>
</script>
</body>
</html>