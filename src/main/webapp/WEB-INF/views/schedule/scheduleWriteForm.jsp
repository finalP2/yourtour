<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/locales/bootstrap-datepicker.ko.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">

	
function check(){
	
	var write = document.sForm;	   
	if(write.name.value==""){
		alert("일정 이름을 입력해주세요.");
		write.name.focus();
		return false;
	}
	else if(write.start_date.value==""){
		alert("출발일을 설정해주세요.");
		write.start_date.focus();
		return false;
	}
	else if(write.end_date.value==""){
		alert("종료일을 설정해주세요.");
		write.end_date.focus();
		return false;
	}

}

    function check_only(chk){
        var obj = document.getElementsByName("season");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != chk){
                obj[i].checked = false;
            }
        }
    }
    function check_only1(chk){
        var obj = document.getElementsByName("theme");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != chk){
                obj[i].checked = false;
            }
        }
    }


</script>
<style>
/*상단 이미지*/
.jumbotron{
background-image: url('/gokkiri/resources/img/cloud2.jpg');
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
}

.button {
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

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
</style>
</head>
<body>
<!-- 상단 이미지 -->
<div class="jumbotron text-center">
  <form class="form-inline">
  	<p><font color="#ffffff" size="10"><b>나만의 여행 일정을 만드세요!</b></font></p>
  	<p><font color="#ffffff" size="3">내 여행 일정을 공유할 수 있고 다른 사람이 만든 여행 일정을 볼 수 있습니다.</font></p>
    <div class="input-group">
 		<a class="btn btn-default" href="/yourtour/schedule/scheduleList.go?currentPage=1" role="button">보러가기</a>
    </div>
  </form>
</div>

<table width="100%">
<tr>
<td>
<form:form commandName="scheduleModel" name="sForm" class="form-horizontal" action="scheduleState.go" method="post" onsubmit="return check();">
  <div class="form-group">
    <label class="control-label col-sm-2">일정 이름:</label>
    <div class="col-sm-6">
      <input type="text" 
      		class="form-control" 
      		name="name" 
      		data-placement="bottom"
      		data-toggle="tooltip" 
      		title="필수입력 항목 입니다." 
      		placeholder="일정 이름을 입력하세요."/>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2">날짜 설정:</label>
    
    <div class="col-sm-3"> 
    	<div class="input-group">
    		<span class="input-group-addon">출발일</span>
    		<input type=text id=start_date name=start_date size=12 placeholder="출발일 선택" onclick=Calendar_D(this);>
     
      		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true" id="start_date" style="cursor:pointer;"></span></span>
    	</div>
    </div>
    <div class="col-sm-3"> 
      	<div class="input-group">
      		<span class="input-group-addon">종료일</span>
      		<input type=text id=end_date name=end_date size=12 placeholder="종료일 선택"   onclick=Calendar_D(this);>
 
      		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true" id="end_date" style="cursor:pointer;"></span></span>
    	</div>
    </div>
    	<input type="hidden" name=period id=period >
    </div>
   
 
  
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
     <span class="input-group-addon">계절</span>
        <label data-toggle="tooltip" title="계절을 선택해 주세요.">
        	<input type="checkbox" name="season" value="1" onclick="check_only(this)"/>봄
        	<input type="checkbox" name="season" value="2" onclick="check_only(this)"/>여름
        	<input type="checkbox" name="season" value="3" onclick="check_only(this)"/>가을
        	<input type="checkbox" name="season" value="4" onclick="check_only(this)"/>겨울
        	<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;
        </label>
      </div>
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
      <span class="input-group-addon">테마</span>
        <label data-toggle="tooltip" title="여행 테마를 선택해 주세요.">
        	<input type="checkbox" name="theme" value="1" onclick="check_only1(this)"/>홀로
        	<input type="checkbox" name="theme" value="2" onclick="check_only1(this)"/>커플
        	<input type="checkbox" name="theme" value="3" onclick="check_only1(this)"/>친구
        	<input type="checkbox" name="theme" value="4" onclick="check_only1(this)"/>가족
        	<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2">총 여행 경비:</label>
    <div class="col-sm-6">
      <input type="text" 
      		class="form-control" 
      		name="s_name" 
      		data-placement="bottom"
      		data-toggle="tooltip" 
      		placeholder="여행 경비를 입력하세요."/>
    </div>
  </div>
  
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label data-toggle="tooltip" title="체크할 시 일정 게시판에 나타나지 않습니다.">
        	<input type="checkbox" name="private1" value="1"/>
        	<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;비밀글
        </label>
      </div>
    </div>
  </div>
  
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="button"><span>만들기</span></button>
    </div>
  </div>

</form:form>
</td>
</tr>
</table>
<script>

$(function() {
	  $( "#start_date" ).datepicker({
	    dateFormat: 'yyyy-mm-dd'
	  });
	  $( "#end_date" ).datepicker({
		    dateFormat: 'yyyy-mm-dd'
		  });
	});
</script>
<br><br><br><br><br>
</body>
</html>