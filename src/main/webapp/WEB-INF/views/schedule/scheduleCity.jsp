<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일정 만들기</title>
<style>
.label {margin-bottom: 96px;}
.label * {display: inline-block;vertical-align: top;}
.label .left {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
.label .center {background: url(http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;color: black;}
.label .right {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}

.panel-body { padding:0px; }
.panel-body table tr td { padding-left: 15px; }
.panel-body .table {margin-bottom: 0px;}

/* 모달 스크롤 */
.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height: 250px;
    overflow-y: auto;
}

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
<h3 style="margin-top: 0px; margin-bottom: 0px; padding-left: 10px;"><span class="glyphicon glyphicon-tags"></span>&nbsp;${sch.name }</h3>
</div>

        <div class="col-sm-2 col-md-2" style="padding-right: 5px; padding-left: 20px;">
          
                    <div id="collapseOne" class="panel-collapse collapse in" style="height:610px; overflow:auto">
                        <div class="panel-body">
                            <table class="table">
                            	
	                            <c:forEach var="cityList" items="${cityList }" varStatus="stat">
	                                <tr>
	                                   <td class="col-xs-1"
	                                   		style="cursor:pointer;" 
	                                   		onclick="window.open('http://localhost:8080/yourtour/city/cityDetail.go?no=${cityList.no}&keyword=info','도시 정보','width=550, height=500, toolbar=no, menubar=no, scrollbars=yes,status=no, resizable=yes');return false;">
	                                   	<span class="glyphicon glyphicon-info-sign"></span>
	                                   </td>
	                                   <td >
	                                   	${cityList.name }
	                                   </td>
	                                   <td>
	                                   	<span class="glyphicon glyphicon-chevron-right"></span>
	                                   </td>
	                                </tr>
	                            </c:forEach>
	                          </table>
                          </div>
                     </div>
	                           
        <div class="col-sm-10 col-md-10" style="padding-left: 0px;">
            <div class="well" style="padding-top: 5px; padding-left: 5px; padding-bottom: 5px; padding-right: 5px;">
                <div id="map" style="width:100%; height:700px;"></div>
            </div>
        </div>
    </div>

</body>
</html>