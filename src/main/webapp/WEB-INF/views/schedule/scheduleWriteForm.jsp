<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
</head>
<body>
<table width="100%">
<tr>
<td>
<form commandName="scheduleModel" name="sForm" class="form-horizontal" action="scheduleState.go" method="post" onsubmit="return check();" enctype="multipart/form-data">
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
    		<input type=text id=start_date name=start_date size=12 placeholder="출발일 선택">
    	</div>
    </div>
    <div class="col-sm-3"> 
      	<div class="input-group">
      		<span class="input-group-addon">종료일</span>
      		<input type=text id=end_date name=end_date size=12 placeholder="종료일 선택" >	
    	</div>
    </div>
    </div>
   
 
  
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
     <span class="input-group-addon">계절</span>
        <label data-toggle="tooltip" title="계절을 선택해 주세요.">
        	<input type="checkbox" name="season" value="봄" onclick="check_only(this)"/>봄
        	<input type="checkbox" name="season" value="여름" onclick="check_only(this)"/>여름
        	<input type="checkbox" name="season" value="가을" onclick="check_only(this)"/>가을
        	<input type="checkbox" name="season" value="겨울" onclick="check_only(this)"/>겨울
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
        	<input type="checkbox" name="theme" value="홀로" onclick="check_only1(this)"/>홀로
        	<input type="checkbox" name="theme" value="커플" onclick="check_only1(this)"/>커플
        	<input type="checkbox" name="theme" value="친구" onclick="check_only1(this)"/>친구
        	<input type="checkbox" name="theme" value="가족" onclick="check_only1(this)"/>가족
        	<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
                      <label class="form-label" for="file">#일정 대표 사진 첨부하기</label>
                      <div class="forms">
                      <input id="files-upload" type="file" name="file" multiple>
                      <ul id="file-list">
                        <li class="no-items">(첨부한 파일 없음)</li>
                      </ul>
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

</form>
</td>
</tr>
</table>
<script>

$(function() {
	  $( "#start_date" ).datepicker({
	    dateFormat: 'yy-mm-dd'
	  });
	  $( "#end_date" ).datepicker({
		    dateFormat: 'yy-mm-dd'
		  });
	});
</script>
</body>
</html>