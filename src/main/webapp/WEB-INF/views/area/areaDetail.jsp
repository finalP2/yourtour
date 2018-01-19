<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행지 상세보기</title>

<script type="text/javascript">

//게시글 삭제 스크립트
function areaDelete(){
	if(confirm("글을 삭제하시겠습니까?") == true){
		location.href='areaDelete.go?no=${areaModel.no}&keyword=${param.keyword}';
	}else{
		return;
	}
}

//게시글 수정 스크립트
function areaModify(){
	if(confirm("글을 수정하시겠습니까?") == true){
		location.href='areaModifyForm.go?no=${areaModel.no}&keyword=${param.keyword}';	
	}else{
		return;
	}
}

//댓글 삭제 스크립트
function areaReviewDelete(no){
	if(confirm("댓글을 삭제하시겠습니까?") == true){
		location.href='areaReviewDelete.go?no=${areaReviewModel.no }&keyword=${param.keyword}';
	}else{
		return;
	}
}

/* //여행일정 갤러리
$(document).ready(function(){
	 
    $("[rel='tooltip']").tooltip();    
 
    $('#hover-cap-4col .thumbnail').hover(
        function(){
            $(this).find('.caption').slideDown(250); //.fadeIn(250)
        },
        function(){
            $(this).find('.caption').slideUp(250); //.fadeOut(205)
        }
    );    
 
}); */
</script>
</head>
<body>

<table width="80%" border="0" align="center">

		<tr>
			<td colspan="3">
				<ul class="nav nav-tabs nav-justified" >
  					<li><a href="/yourtour/city/cityDetail.go?no=${areaModel.CITY_NO }&keyword=${param.keyword}">홈</a></li>
					<li><a href="/yourtour/area/areaList.go?city_no=${areaModel.CITY_NO }&keyword=${param.keyword}">여행지</a></li>
					<li><a data-toggle="modal" data-target="#scheduleList">여행일정 보기</a></li>
				</ul>
			</td>
		</tr>
</table>

<table width="70%" align="center">
	<c:if test="${session_email == 'admin' }">
	<tr>
		<td align="right" colspan="2">
			<button type="button" class="btn btn-default" onclick="areaModify();">수정</button>
			<button type="button" class="btn btn-default" onclick="areaDelete();">삭제</button>
		</td>
	</tr>
	</c:if>
</table>

<br/><br/>

<table width="70%" align="center">
<tr><td>
<div class="panel panel-default">
  <div class="list-group-item active" align="center">
    <b><font size="5"><span class="glyphicon glyphicon-flag" aria-hidden="true"></span>&nbsp;${areaModel.NAME }</font></b><br/>
  </div>
</div>

<!-- 지도 들어가야함 -->

<tr>
<td><b>#주소</b></td>
<td>${areaModel.ADDRESS }</td>
</tr>

<tr>
<td><b>#가는 방법</b></td>
<td>${areaModel.WAY }</td>
</tr>

<c:if test="${areaModel.tel != null }">
<tr>
<td><b>#전화번호</b></td>
</tr>
</c:if>

<c:if test="${areaModel.hours != null }">
<tr>
<td><b>#영업시간</b></td>
</tr>
</c:if>

<c:if test="${areaModel.web != null }">
<tr>
<td><b>#웹 사이트</b></td>
</tr>
</c:if>

<tr>
<td><b>#상세설명</b></td>
<td>${areaModel.CONTENT }</td>
</tr>
</table>

<!-- 리뷰 -->
<table border="0" width="70%">
  <tr>
      <td><b>REVIEW</b>&nbsp;${revCount }</td>
  </tr>
  
<c:if test="${session_email == null }">
<tr>
    <td align="center">
    <br/><br/>댓글을 쓰시려면 로그인하세요.<br/><br/>
    </td>
</tr>
</c:if>

<c:if test="${session_email != null }">
<tr>
    <td><form action="areaReview.go" method="post">
        <input type="hidden" name="keyword" value="${param.keyword }"/>
        <input type="hidden" name="no" value="${areaModel.NO }"/>
        <input type="hidden" name="email" value="${session_email }"/>
        
        <b>작성자: ${session_email }</b>
        <textarea class="form-control" rows="5" id="comment" name="content" placeholder="리뷰내용을 입력해주세요."></textarea>
        </form>
    </td>
</tr>
</c:if>
</table>

<br/><br/>
<%-- 
<table border="0" width="70%">
    <c:forEach var="areaReviewList" items="${areaReviewList }">
    <tr>
        <td>
            <br/>
            <b><font color="gray" size="3">${areaReviewList.email }</font></b>
            / <fmt:formatDate value="${areaReviewList.date }" pattern="yyyy.MM.dd"/>
            <c:if test="${session_email == areaReviewList.email }">
            &nbsp;/&nbsp;
            <button type="button" class="btn btn-link" onClick="areaReviewDelete(${areaReviewList.no});">x</button>
            </c:if>
            <br/><br/>
            </td>
            </tr>
            </c:forEach>
</table> --%>
</body>
</html>