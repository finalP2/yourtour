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
				<ul class="nav nav-tabs nav-justified" >
  					<li><a href="/yourtour/city/cityDetail.go?no=${cityModel.no}&keyword=${param.keyword}">홈</a></li>
					<li><a href="/yourtour/area/areaList.go?no=${areaModel.no }&keyword=${param.keyword}">여행지</a></li>
					<li><a data-toggle="modal" data-target="#scheduleList">여행일정 보기</a></li>
				</ul>
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