<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행지 리스트</title>

</head>
<body>
<table width="100%" border="0" align="center">
	<tr>
		<td colspan="3">
			<a href="/yourtour/city/cityDetail.go?no=${cityList.NO}&keyword=${param.keyword}">홈</a>
			<a href="/yourtour/area/areaList.go?city_no=${cityModel.NO}&keyword=${param.keyword}">여행지</a>
			<a data-toggle="modal" data-target="#scheduleList">여행일정 보기</a>
		</td>
	</tr>
</table>

<%-- <!-- 관련 여행일정 보기 -->
			
<div id="scheduleList" class="modal fade" role="dialog">
<div class="modal-dialog" style="width:80%;">
	<!-- Modal content-->
				<form action="/gokkiri/schedule/scheduleList.go">
				<div class="modal-content">
					<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><b><font color="#266eb7">＜${param.keyword }＞</font>&nbsp;</b>관련 여행일정 보기</h4>
					</div>
				
					<div class="modal-body" style="padding-left: 0px; padding-right: 35px;">
					
					<table width="100%" align="center"><tr><td>
					<input type="hidden" name="currentPage" value="1">
					<input type="hidden" name="keyword" value="${param.keyword }" />
					<ul class="thumbnails" id="hover-cap-4col">
					<c:forEach var="scheduleList" items="${scheduleList }" varStatus="stat">
					<c:if test="${stat.index lt 8 }">
					
				    <li class="col-md-3">
				   		<font size="2" color="#266eb7"><b>no.&nbsp;${scheduleList.s_no}</font><br/>
				   		<font size="4" color="#266eb7">
				   		<c:if test="${fn:length(scheduleList.s_name) gt 13 }">
							<c:out value="${fn:substring(scheduleList.s_name, 0, 13) }" />..
						</c:if>
						<c:if test="${fn:length(scheduleList.s_name) le 13 }">
							${scheduleList.s_name }
						</c:if>
				   		</b></font>
				        <div class="thumbnail">
				            <div class="caption">
				                <p><h5>≪&nbsp;${scheduleList.s_start_date }박 ${scheduleList.s_start_date + 1 }일 일정&nbsp;≫</h5></p>
				                <p></p>
				                <p>작성자 : ${scheduleList.m_email }</p>
				                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp;${scheduleList.s_hit }</p>
				                
				                <p><a href="/gokkiri/schedule/scheduleDetail.go?s_no=${scheduleList.s_no }&s_cate=0" data-toggle="tooltip" title="상세보기"><img src="/gokkiri/resources/img/view.png" width="25" /></a></p>
				                
				                <p><h4>${scheduleList.s_detail_memo } 출발~</h4></p>
				            </div>
				            <!-- a_img_sav 컬럼을 s_together 컬럼명으로 바꿔서 불러옴↓↓↓ -->
				            <img src="/gokkiri/resources/area_img/${scheduleList.s_together }" alt="ALT NAME" class="img-responsive"  style="max-width: 100%; height: 100%;" >
				        </div>
					</li>
					
					</c:if>
					</c:forEach>
					</ul>
					</td></tr>
					
					<tr><td>
					</td></tr>
					</table>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">더보기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
			</div>
		</div>
		</form>
</div>
</div>
 			
			<!-- 관련 여행일정 보기 끝 --> --%>

<table width="100%" border="0" align="center">
	<tr>
		<td colspan="2" style="text-align:left;">
		<br/><br/><br/>
		<img src="../resources/area_img/"/> / 총 게시글<c:out value="${totalCount }"/>개
		<c:if test="${fn:length(searchKeyword) gt 1 && searchKeyword != '' }">
		<font color="red"> / *[<c:out value="${searchKeyword}"/>] 을(를) 검색한 결과</font>
		</c:if>
		
		<td style="text-align:right;">
		<br/><br/><br/>
		<form action="areaList.go">
		<input type="hidden" name="keyword" value="${param.keyword }"/>
		<div class="row row-centered" >
 				<div class="col-lg-12 col-centered">
				<div class="input-group ">
				<input type="text" name="searchKeyword" class="form-control" placeholder="여행지를 입력해주세요.">
				<input type="hidden" name="no" value="${param.no }" />
				<span class="input-group-btn">
        			<button class="btn btn-default" type="submit" >검색</button>
				</span>
				</div>
  				</div>
				</div>
		</form>
</table>

<table width="80%" border="0" cellspacing="0" cellpadding="2" align="center" class="table table-hover">

	<thead>
	<tr height="10" >
		<th style="text-align:center;">이름</th>
		<th style="text-align:center;">이미지</th>
		<th style="text-align:center;">내용</th>
	</tr>
	</thead>
	
	<tbody>
	
	<c:if test="${fn:length(areaList) le 0 }">
		<tr align="center">
			<td colspan="3">등록된 게시물이 없습니다.</td>
		</tr>
	</c:if>

	<c:forEach var="areaList" items="${areaList }" varStatus="stat">
		
		<tr height="200">
			<td>
				<a href="areaDetail.go?no=${areaList.NO }&keyword=${keyword}">
					<h2><b>${areaList.NAME }</b></h2>
				</a>
			</td>
			<td align="center" width="300">
				<a href="areaDetail.go?no=${areaList.NO }&keyword=${param.keyword}">
				<img src="../resources/area_img/${ areaList.MAIN_IMG }" class="img-rounded" alt="Cinque Terre" width="250" height="200"
						onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'"/>
					
				</a>
				<br>
			</td>
			<td align="center" width="300">
				<!-- 글자 수를 초과하면 ...으로 보이도록 설정 -->
		 		<c:if test="${fn:length(areaList.CONTENT) gt 200 }">
					<c:out value="${fn:substring(areaList.COTNENT, 0, 200) }"/>......
				</c:if>
				<c:if test="${fn:length(areaList.CONTENT) le 200 }">
					${areaList.CONTENT }
				</c:if> 

				<br>
			</td>
		</tr>
	</c:forEach>
	
	<c:if test="${session_email == 'admin' }">
		<tr>
			<td colspan="3" align="right">
				<button type="button" class="button" onclick="javascript:location.href='areaWriteForm.go?city_no=${param.city_no}&keyword="${param.keyword }'">글쓰기</button>
			</td>
		</tr>
	</c:if>
</tbody>
</table>

</body>
</html>