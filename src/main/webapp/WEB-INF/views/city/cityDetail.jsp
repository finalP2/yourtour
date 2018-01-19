<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도시 상세보기</title>
<script>

//게시글 수정 스크립트
function cityModify(){
	if(confirm("글을 수정하시겠습니까?") == true){
		location.href='cityModifyForm.go?no=${cityModel.no}&keyword=${param.keyword}';	
	}else{
		return;
	}
}

//게시글 삭제 스크립트
function cityDelete(){
	if(confirm("글을 삭제하시겠습니까?") == true){
		location.href='cityDelete.go?no=${cityModel.no}';
	}else{
		return;
	}
}
</script>
</head>
<body>

<table width="85%" border="0" align="center">

		<tr>
			<td colspan="3">
			<center><h2>${cityModel.NAME }</h2>
				<a href="/yourtour/area/areaList.go?city_no=${cityModel.NO }&keyword=${param.keyword}">여행지</a>
				<a data-toggle="modal" data-target="#scheduleList">여행일정 보기</a></center>
			</td>
		</tr>
</table>

<table width="70%" align="center">
	<c:if test="${session_email == 'admin' }">
	<tr>
		<td align="right">
			<button type="button" class="btn btn-default" onclick="cityModify();">수정</button>
			<button type="button" class="btn btn-default" onclick="cityDelete();">삭제</button>
		</td>
	</tr>
	</c:if>
</table>

<br/><br/>


<center>
<img src="../resources/city_img/${cityImgModel.SAV_NAME}"/>
<table width="70%" align="center">
</center>
	<tr>
		<td>#설명</td>
		<td>${cityModel.CONTENT }</td>
</table>
<br/><br/>

<!-- 인기 여행지 리스트  -->
<h1 class="text-center" text align="center">
#인기 여행지
</h1>
<br/>
<table width="70%" align="center" cellpadding="1" cellspacing="1">
<tr>

<td align="center">

        	<!-- 첫번째 슬라이드(기준) -->
			<div class="item active">
				<div class="row" >
				
				<c:forEach var="areaList" items="${areaList }" varStatus="stat">
				<c:if test="${stat.index lt 4 }">
					<div class="col-xs-6 col-md-3">
						 <a href="/yourtour/area/areaDetail.go?no=${areaList.no }&keyword=${fn:substring(areaList.address, 0, 2) }" class="thumbnail">
							<img src="/yourtour/resources/area_img/${ areaList.sav_name }"><br/>
							<font size="4"><b>
							<c:if test="${fn:length(areaList.name) gt 7 }">
							<c:out value="${fn:substring(areaList.name, 0, 7) }" />..
							</c:if>
							<c:if test="${fn:length(areaList.name) le 7 }">
								${areaList.a_name }
							</c:if>
							&nbsp;&nbsp;<span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>${areaList.like1 }</b></font>
						</a> 
					</div>
				</c:if>
				</c:forEach>
				
				</div>
			</div>  
			<!-- 첫번째 슬라이드(기준) 끝 -->

	</td>
	
	</tr>
</table>


</body>
</html>