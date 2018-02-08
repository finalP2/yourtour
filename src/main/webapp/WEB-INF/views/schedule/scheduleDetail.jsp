<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 상세보기</title>

<style>

/*일정 검색*/
 .panel{
 background-color: #f5f5f5;
 text-align:center;

} 

div.panel-heading{ 
width: 120px;
height: 50px;
display: inline-block;
}

div.panel-body{
width: 120px;
height: 50px;
display: inline-block;
}

.jumbotron{
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
}

.panel{
background: rgba(0,0,0, 0.1);
}

.panel2 {
width: 180px;
float: left;
}

/*일정내용*/
.list-group-item-center{
text-align:center;
}

/*사이드 스크롤 리스트*/
.table-fixed thead {
  width: 97%;
}
.table-fixed tbody {
  height: 130px;
  overflow-y: auto;
  width: 100%;
}
.table-fixed thead, .table-fixed tbody, .table-fixed tr, .table-fixed td, .table-fixed th {
  display: block;
}
.table-fixed tbody td, .table-fixed thead > tr> th {
  float: left;
  border-bottom-width: 0;
}
/*사이드 스크롤 리스트 끝*/

/*지도*/
.label {margin-bottom: 96px;}
.label * {display: inline-block;vertical-align: top;}
.label .left {display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
.label .center {display: inline-block;height: 24px;font-size: 12px;line-height: 24px;color: black;}
.label .right {display: inline-block;height: 24px;overflow: hidden;width: 6px;}
/*지도 끝*/

/*테이블 정렬*/
.table>thead>tr>th {
    /* vertical-align: top; */
    text-align:center;
}


img {
    border-radius: 3px;
}

/*등록하기 버튼 */
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

/*목록 버튼 */
.listButton {
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 16px;
  padding: 10px;
  width: 80px;
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
<script>

//일정 상세정보
$('#accordion').on('shown.bs.collapse', function () {
     
     var panel = $(this).find('.in');
     
     $('html, body').animate({
           scrollTop: panel.offset().top
     }, 500);
     
   });

//댓글 삭제 스크립트
function schCommentDelete(s_co_no){
   if(confirm("댓글을 삭제하시겠습니까?") == true){
      location.href='schCommentDelete.go?s_no=${param.s_no }&s_co_no='+s_co_no;
   }else{
      return;
   }
}
</script>

</head>
<body>

<br/>
<!--main-->
<div class="container">
<!--left-->
<div class="col-lg-1">
  <div class="panel2" data-spy="affix" >
     <button type="button" class="listButton" onclick="location.href='/yourtour/schedule/scheduleList.go'" ><span>목록</span></button>
      <c:forEach var="schDayList" items="${schDayList }" varStatus="stat">
        <div class="panel-heading"><a href="#sec${stat.index+1 }">DAY ${stat.index+1 }
        <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
        </a></div><br/>
   </c:forEach>   
  </div>
</div><!--/left-->

<!--right-->
<div class="col-md-7">
      
<!-- 일정 상세정보 -->

<div class="jumbotron text-center" style="background-image: url('/yourtour/resources/sch_img/${sch.MAIN_IMG}');">



   <form class="form-inline">
      <br/><br/>
      
      <table width="70%" align="center" style="background:rgba(256,256,256,0.6) !important;">
      <tr height="50"><td>
      <br/>
      <font size="4">
      ${sch.START_DATE} ~ ${sch.END_DATE }<br/><br/>
      </font>
      <font size="6"><b><span class="glyphicon glyphicon-flag" aria-hidden="true"></span>&nbsp;${sch.NAME }</b></font>
      <br/><br/>
        <font><b>작성자 : ${sch.EMAIL } / 좋아요 : ${sch.LIKE1 }</b></font><br/><br/>
        
        
        
        <!-- 로그인되어있으면 찜하기/가져오기 버튼 보이도록 -->
           <!-- 이미 찜하기 등록되어있으면 찜 해제 버튼 -->
        <c:choose>
          <c:when test = "${msg == 'failure' }">
                    <div style="color: red">
                        	이미 좋아요 하셨습니다.
                    </div>

         </c:when>
     
         <c:otherwise>
         <c:if test = "${msg == 'true' }">
            <span class="glyphicon glyphicon-heart-empty" data-toggle="modal" data-target="#like1" style="cursor:pointer;">
                 <a href="#" data-toggle="tooltip" title="좋아요">
                 </a>
              </span>
         </c:if>
         </c:otherwise>
         </c:choose>
         &nbsp;&nbsp;

         <!-- 작성자나 공유자일 경우 일정 수정하기 버튼 -->        
           <c:forEach var="email" items="${s_together }">
              <c:set var="together" value="${together } / ${m_email.s_together }" />
           </c:forEach>
           
           <c:if test="${member.EMAIL != null }">
           <c:if test="${member.EMAIL == scheduleModel.EMAIL || fn:contains(together, member.EMAIL)}">
              &nbsp;&nbsp;|&nbsp;&nbsp;
              <span data-toggle="modal" data-target="#modify">
                 <a href="#" data-toggle="tooltip" title="일정 수정하기"><img src="/gokkiri/resources/img/modify.png" width="25" /></a>
              </span>
           </c:if>
           </c:if>
           &nbsp;&nbsp;
           
           <!-- 작성자인경우에만 삭제 가능 -->
           <c:if test="${member.EMAIL != null && member.EMAIL == scheduleModel.EMAIL}">
              <span data-toggle="modal" data-target="#delete">
                 <a href="#" data-toggle="tooltip" title="일정 삭제하기"><img src="/gokkiri/resources/img/trashcan.png" width="25" /></a>
              </span>
           </c:if>
           
           <br/>&nbsp;<br/>
           </td></tr>
           </table>
           <br/>
   </form>      
</div>   

         
         <!-- 일정 삭제하기 모달 -->
            <div id="delete" class="modal fade" role="dialog">
                 <div class="modal-dialog">
                     <!-- Modal content-->
                     <div class="modal-content">
                        <div class="modal-body">
                           <br/>
                           
                        		   일정을 삭제하시겠습니까?<br/>
                           (*원작성자의 일정이 삭제되면 공유한 친구의 일정도 동시삭제됩니다.)
                           <br/><br/><br/>
                           <input type="submit" class="btn btn-primary odom-submit" value="확인" 
                            onclick='s_delete(${scheduleModel.s_no},${param.currentPage });'/>                                                       
                           <button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
                        </div>
                     </div>
               </div>
            </div>
         <!-- 일정 삭제하기 모달 끝 -->
         
         <!-- 찜하기/해제 모달 -->
         <form>
            <div id="like1" class="modal fade" role="dialog">
                 <div class="modal-dialog">
                     <!-- Modal content-->
                     <div class="modal-content">
                        <div class="modal-body">
                           <br/>
                           
                           
                          		 좋아요 하시겠습니까?
                           		<br/><br/><br/>
                           
	                           <input type="button" class="btn btn-primary odom-submit" value="확인" onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleLike.go?sch_day_no=1&sch_cate=1&no=${sch.NO}'"/>
	                           <button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
                       
                           
                           </div>
         </form>
                           

                        </div>
                     </div>
               </div>
            </div>
         <!-- 찜하기/해제 모달 끝 -->


<thead><tr><th><b><font color="gray" size="3">#지도</font></b></th></tr>
<tbody>
<tr><td>
 <table class="table table-fixed">
<div id="map" style="width:400px;height:200px;"></div>
<!-- 지도 -->
<!-- <tr>
  
    <thead>
      <tr>
        <th class="col-xs-12" text-align="center";><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
        &nbsp;여행지 리스트(일정순)</th>
      </tr>
    </thead>
    <tbody> -->
      <%-- <c:forEach var="mapList" items="${mapList }" varStatus="stat">
         <tr>
           <td class="col-xs-3">
                <font color="#266eb7">
                 <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>${stat.count}
              </font>
           </td>
           
           <td class="col-xs-8" align="left">
              <!-- 관광지 -->
              <c:if test="${mapList.a_cate == 0 }">
                 <span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
              </c:if>
              <!-- 맛집 -->
              <c:if test="${mapList.a_cate == 1 }">
                 <span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span>
              </c:if>
               ${mapList.a_name }
           </td>
         </tr>
      </c:forEach> --%>
 
  </table>
</tr></tbody>

<!-- 일정표/댓글 버튼 -->


<ul class="nav nav-tabs nav-justified" >
    
   <li><a href="scheduleDetail.go?sch_day_no=1&no=${sch.NO }&sch_cate=1"><b>일정표</b>&nbsp;<span class="glyphicon glyphicon-th-large"></span></a></li>
   <li><a href="scheduleDetail.go?sch_day_no=1&no=${sch.NO }&sch_cate=2"><b>댓글</b>&nbsp;<span class="badge" items="${clist }"></span></a></li>
</ul>

<!-- 스케쥴 상세보기 -->
<c:if test="${sch_cate == 1 }">
      	

            
            <div class="list-group" >

             
               <c:forEach var="schDayList" items="${schDayList}" varStatus="stat2">
               <div class="list-group-item list-group-item-success">
              
              <h2 id="sec${stat2.count }">DAY ${stat2.count }</h2></div>
                  <c:forEach var="schDetailList" items="${schDetailList }" varStatus="stat">
                  
             <c:if test="${schDetailList.SCH_DAY_NO ==stat2.count}">
                <div class="list-group-item">
                   <img src="/yourtour/resources/area_img/${schDetailList.MAIN_IMG }" width="200" height="120">
                   &nbsp;&nbsp;&nbsp;<font size="5" color="#3b9342"><b>${schDetailList.DETAIL_TURN }. ${schDetailList.NAME}&nbsp;&nbsp;
                   <span class="glyphicon glyphicon-info-sign" 
                         style="cursor:pointer;"
                               onclick="window.open('http://localhost:8080/yourtour/area/areaDetail2.go?no=${schDetailList.NO }&keyword=info','여행지 정보','width=550, height=500, toolbar=no, menubar=no, scrollbars=yes,status=no, resizable=yes');return false;">
                   </span>
                   </b></font></div>
                

              
                <div class="list-group-item">
                   <b><font color="gray">&nbsp;· 여행지 : </font></b>&nbsp;&nbsp;${schDetailList.NAME }
                </div>
                
                <%-- <c:if test="${schDetailList.MAIN_IMG != null }">
                <div class="list-group-item">
                   <b><img src="/yourtour/resources/area_img/${schDetailList.MAIN_IMG }" width="300" height="200" />
                </div>
                </c:if> --%>
                
                <div class="list-group-item">
                   <b><font color="gray">&nbsp;· 주소 : </font></b>&nbsp;&nbsp;${schDetailList.ADDRESS }
                </div>
                
                <c:if test="${schDetailList.TEL != null }">
                <div class="list-group-item">
                   <b><font color="gray">&nbsp;· 전화번호 : </font></b>&nbsp;&nbsp;${schDetailList.TEL }
                </div>
                </c:if>
                
                <c:if test="${schDetailList.WAY != null }">
                <div class="list-group-item">
                   <b><font color="gray">&nbsp;· 가는방법 : </font></b>&nbsp;&nbsp;${schDetailList.WAY }
                </div>
                </c:if>
                
                
                
               <c:if test="${fn:length(schDayList) gt stat2.count}">
               <div class="list-group-item-center">
                  <br/><img src="/gokkiri/resources/img/arrow.png" width="50" height="20" /><br/><br/>
               </div>
               </c:if>
               </c:if>
              </c:forEach>
    
         
         <br/><br/></c:forEach></div>
    
  

</c:if>


<!-- 스케쥴 댓글 -->
<c:if test="${sch_cate == 2 }">
<table border="0" align="center" width="100%">
      
<c:if test="${member.EMAIL != null }">
   
      <tr>
         <td><br/><p><b><font color="gray" size="3">작성자 : ${member.NICKNAME }</font></b></p></td>
      </tr>
      <tr>
      <td align="right">
      	<form name="cForm" class="form-horizontal" action="scheduleCommentWrite.go" enctype="multipart/form-data">
            <input type="hidden" name="no" value="${sch.NO }" />
            <input type="hidden" name="email" value="${member.EMAIL }" />
            <input type="hidden" name="sch_day_no" value="1" />
            <input type="hidden" name="sch_cate" value="2" />
            <textarea class="form-control" rows="5" name="content"></textarea>
            <br/>
            	<input type="submit" value="등록하기"/>
      	</form>
      </td>
      </tr>
    
</c:if>
<c:if test="${member.EMAIL == null }">
      <tr>
      <td align="center">
         <br/><br/>댓글쓰기 권한이 없습니다. 로그인 해주세요.<br/><br/>
      </td>
      </tr>
</c:if>
</table>
<br/><br/>

<table border="0" width="100%" align="center">   
   <c:forEach var="clist" items="${clist }" varStatus="stat">
   <tr>
      <td align="left">
         <br/>
         <b><font color="gray" size="3">${clist.EMAIL }</font></b>
          / <fmt:formatDate value="${clist.WRITEDATE }" pattern="yyyy.MM.dd" />
         <c:if test="${member.EMAIL == clist.EMAIL }">
         &nbsp;/&nbsp;
         <button type="button" class="btn btn-link" onclick="location.href='http://localhost:8080/yourtour/schedule/commentDelete.go?sch_day_no=1&sch_cate=2&c_no=${clist.NO}&no=${sch.NO}'">x</button>
         </c:if>
         <br/><br/>
         ${clist.CONTENT }
         <br/><br/>
      </td>
   </tr>
   <tr height="1">
      <td bgcolor="gray" colspan="2"></td>
   </tr>
   </c:forEach>
</table>
<br/><br/>



</c:if>

</div><!--/right-->
</div><!--/container-->
</table>
   
</body>
</html>