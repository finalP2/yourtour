<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 리스트</title>

<style>
a#MOVE_TOP_BTN {
    position: fixed;
    right: 8%;
    bottom: 50px;
    display: none;
    z-index: 999;
}
/*일정 검색*/
 .panel{
 background-color: #f5f5f5;
 text-align:center;

} 


div.panel-heading{
width: 120px;
height: 50px;
display: inline-blㅊock;
}

div.panel-body{
width: 120px;
height: 50px;
display: inline-block;
}

.jumbotron{
background-image: url('/gokkiri/resources/img/cloud3.jpg');
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
}

/* 일정 갤러리 */
ul { list-style: none;}

#hover-cap-4col .thumbnail {
   position:relative;
   overflow:hidden;   
   height: 180px;

}
.caption {
   display: none;
   position: absolute;
   top: 0;
   left: 0;
   background: rgba(0,0,0,0.4);
   width: 100%;
   height: 100%;
   color:#fff !important;
}

img {
    border-radius: 3px;
}
</style>

<script>
$(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 500) {
            $('#MOVE_TOP_BTN').fadeIn();
        } else {
            $('#MOVE_TOP_BTN').fadeOut();
        }
    });
    $("#MOVE_TOP_BTN").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });
});
//일정 검색
$('#accordion').on('shown.bs.collapse', function () {
     
     var panel = $(this).find('.in');
     
     $('html, body').animate({
           scrollTop: panel.offset().top
     }, 500);
     
   });

//일정 갤러리
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
 
});   

function submitSearchForm(){
   document.getElementById("SearchKeyword").submit();
}
</script>

</head>
<body>

<center>

<!-- 상단 이미지 + 일정 검색 -->
<div class="jumbotron text-center">
  <form class="form-inline">
     <p><font color="#ffffff" size="10"><b>일정을 공유해보세요!</b></font></p>
     <p><font color="#ffffff" size="3">여러 일정을 찜하고 내 일정으로 스크랩할 수 있어요. 일정을 검색해보세요!</font></p>

        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#search">
        <span class="glyphicon glyphicon-flag" aria-hidden="true"></span>&nbsp;&nbsp;조건 검색</button>

  </form>
</div>

<!-- 출발지역으로 검색하기 모달 -->
            <div id="search" class="modal fade" role="dialog">
                 <div class="modal-dialog">
                     <!-- Modal content-->
                        
                     <div class="modal-content">
                        <div class="modal-header">
                           <h4><span class="glyphicon glyphicon-flag" aria-hidden="true"></span>
                           &nbsp;원하시는 조건을 선택해주세요</h4>
                        </div>
                        
                        <div class="modal-body">
                           <br/>
   <form id="SearchKeyword" name="SearchKeyword" action="scheduleSearch.go">

       <div style="border-style: solid">
      <div style="padding-top :20px">
         <input type="radio" name=season value="all" checked="checked" id="r1"><label for="r1"><span></span>전체</label>
         <input type="radio" name="season" value="봄"id="r2" ><label for="r2"><span></span>봄</label>
         <input type="radio" name="season" value="여름"id="r3" ><label for="r3"><span></span>여름</label>
         <input type="radio" name="season" value="가을"id="r3" ><label for="r3"><span></span>가을</label>
         <input type="radio" name="season" value="겨울"id="r3" ><label for="r3"><span></span>겨울</label>
      </div>
      <br>
      <div >
         <input type="radio" name="theme" value="all" checked="checked" id="r4"><label for="r4"><span></span>전체</label>
         <input type="radio" name="theme" value="홀로" id="r5"><label for="r5"><span></span>홀로</label>
         <input type="radio" name="theme" value="커플" id="r6"><label for="r6"><span></span>커플</label>
         <input type="radio" name="theme" value="친구"id="r7" ><label for="r7"><span></span>친구</label>
         <input type="radio" name="theme" value="가족"id="r8" ><label for="r8"><span></span>가족</label>
      </div>
      <br>
      
      <ul class="menu" >
       <li class="menu__item">
         <a href="javascript: submitSearchForm();" class="menu__link hover1"><span class="menu__label hover1__label">SEARCH</span></a>
         </li>
         </ul>
         </div>
      </section>
      <!-- <input type="submit" name="submit" value="검색"> -->
   </form>
               <br/>
             </div>
                 <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
                   </div>
         </div>
      
   </div>
</div>
         <!--  출발지역으로 검색하기  모달 끝 -->

<c:if test="${param.keyword != null }">
   <table width="80%" align="center">
   <tr><td align="center">
   <font color="red">* 출발 지역으로 검색 : '${param.keyword }'</font>
   <br/><hr/><br/><br/>
   </td></tr>
   </table>
</c:if>

<c:if test="${fn:length(scheduleList) lt 1 }">

<br/><br/><br/><br/><br/><br/><br/>
등록된 일정이 없습니다.<br/>
일정을 등록해주세요!
<br/><br/><br/><br/><br/><br/><br/>

</c:if>

<c:if test="${param.keyword == null }">
<!-- 인기 여행일정 리스트  -->
<h1 class="text-center">
<a>
<img src="/gokkiri/resources/img/mainTitle2.png" />
</a>
</h1>
<br/>
<table width="70%" align="center" cellpadding="1" cellspacing="1">
<tr>

<td align="center">

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <ul class="thumbnails" id="hover-cap-4col" >
         <c:forEach var="scheduleLikeList" items="${scheduleLikeList }" varStatus="stat">
         <c:if test="${stat.index lt 4 }">
    <li class="col-md-3">
        <b>
         <font size="4" color="#266eb7">
         <c:if test="${fn:length(scheduleLikeList.NAME) gt 13 }">
         <c:out value="${fn:substring(scheduleLikeList.NAME, 0, 13) }" />..
      </c:if>
      <c:if test="${fn:length(scheduleLikeList.NAME) le 13 }">
         ${scheduleLikeList.NAME }
      </c:if>
         </b></font>
        <div class="thumbnail">
            <div class="caption">
                <p><h5>≪&nbsp;${scheduleLikeList.PERIOD -1 }박 ${scheduleLikeList.PERIOD}일 일정&nbsp;≫</h5></p>
                <p></p>
                <p>작성자 : ${scheduleLikeList.EMAIL }</p>
                <p><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>&nbsp;${scheduleLikeList.LIKE1 }</p>
                
                <p><span class="glyphicon glyphicon-search" 
                style="cursor:pointer;"
                onclick="location.href='/yourtour/schedule/scheduleDetail.go?sch_day_no=1&no=${scheduleLikeList.NO }&sch_cate=1'" 
                data-toggle="tooltip" title="상세보기"></a></span></p>
                
                <p><h4>${scheduleLikeList.THEME } 여행!</h4></p>
                <h5>계절: ${scheduleLikeList.SEASON }</h5>
            </div>
            
            <img src="../resources/sch_img/${ scheduleLikeList.MAIN_IMG }" alt="NOT FOUND IMAGE" class="img-responsive"  style="max-width: 100%; height: 100%;" >
              </div>
   </li>
   </c:if>
   </c:forEach>

      </ul>

</div>
</div>

   </div>
   <hr/>
   </td>
   </tr>
</table>
</c:if>

<!-- 사진바꿔야함 여행일정 리스트로!!  -->
<h1 class="text-center">
<a>
<img src="/gokkiri/resources/img/mainTitle2.png" />
</a>
</h1>
<br/>
<table width="70%" align="center" cellpadding="1" cellspacing="1">
<tr>

<td align="center">

<div class="container">
  <div class="row">
    <div class="col-md-12">
    
<ul class="thumbnails" id="hover-cap-4col">
   <c:forEach var="scheduleList" items="${scheduleList }" varStatus="stat">
    <li class="col-md-3">
        <b>
        
         <font size="4" color="#266eb7">
         <c:if test="${fn:length(scheduleList.NAME) gt 13 }">
         <c:out value="${fn:substring(scheduleList.NAME, 0, 13) }" />..
      </c:if>
      <c:if test="${fn:length(scheduleList.NAME) le 13 }">
         ${scheduleList.NAME }
      </c:if>
         </b></font>
        <div class="thumbnail">
            <div class="caption">
                <p><h5>≪&nbsp;${scheduleList.PERIOD -1 }박 ${scheduleList.PERIOD}일 일정&nbsp;≫</h5></p>
                <p></p>
                <p>작성자 : ${scheduleList.EMAIL }</p>
                <p><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>&nbsp;${scheduleList.LIKE1 }</p>
                
                <p><span class="glyphicon glyphicon-search" 
                style="cursor:pointer;"
                onclick="location.href='/yourtour/schedule/scheduleDetail.go?sch_day_no=1&no=${scheduleList.NO }&sch_cate=1'" 
                data-toggle="tooltip" title="상세보기"></a></span></p>
                
                <p><h4>${scheduleList.THEME } 여행!</h4></p>
                <h5>계절: ${scheduleList.SEASON }</h5>
            </div>
            
            <img src="../resources/sch_img/${ scheduleList.MAIN_IMG }" alt="NOT FOUND IMAGE" class="img-responsive"  style="max-width: 100%; height: 100%;" >
              </div>
   </li>
   </c:forEach>
</ul>
    </div>
  </div>
</div>
</td>
</tr>
</table>


<ul class="pagination">
         ${pagingHtml}
</ul>

<br/><br/>

</center>
<div>
    <a id="MOVE_TOP_BTN" href="#"><img src="../resources/sch_img/upup.png" width="60" height="60" /></a>
</div>

</body>

  
</html>