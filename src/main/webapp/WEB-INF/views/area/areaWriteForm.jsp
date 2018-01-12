<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>여행지 글쓰기</title>
<style>
.form-area
{
    background-color: #FAFAFA;
	padding: 10px 40px 60px;
	margin: 10px 0px 60px;
	border: 1px solid GREY;
	}
	
</style>
<script type="text/javascript">

function areaList() {
	
	if(confirm("리스트로 이동하시겠습니까?") == true) {
		location.href="areaList.go?city_no=${param.city_no}";
	} else {
		false;
	}
}

function searchMap() {
	var url="areaSearchMap.go";
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=1000,height=500");
}

//파일 업로드
var filesUpload = document.getElementById("files-upload"),
fileList = document.getElementById("file-list");

function traverseFiles (files) {
var li,
  file,
  fileInfo;
fileList.innerHTML = "";
 
for (var i=0, il=files.length; i<il; i++) {
li = document.createElement("li");
file = files[i];
fileInfo = "<div><strong>Name:</strong> " + file.name + "</div>";
fileInfo += "<div><strong>Size:</strong> " + file.size + " bytes</div>";
fileInfo += "<div><strong>Type:</strong> " + file.type + "</div>";
li.innerHTML = fileInfo;
fileList.appendChild(li);
};
};

filesUpload.onchange = function () {
traverseFiles(this.files);
};
</script>
</head>
<body>
<form action="areaWrite.go" method="post" enctype="multipart/form-data">
<table width="60%" align="center">
<tr><td>
  <div class="row">
  	<div class="col-md-12"> 
    <div class="form-area">  
        
        <br style="clear:both">
                    <h3 style="margin-bottom: 25px; text-align: center;">여행지 글쓰기</h3>
                    
                    <br/><br/>
                    
                    <label class="form-label" for="city_name">#도시 선택 </label>
                    <br/>
                    <input type="radio" name="city_name" value="파리" checked="checked">파리
                    <input type="radio" name="city_name" value="깐느">깐느
                    <input type="radio" name="city_name" value="니스">니스 
                    <br/><br/>
                  
                    <button type="button" class="btn btn-default btn-lg" onclick="searchMap()">
  			        <span class="glyphicon glyphicon-search" aria-hidden="true">주소검색</span>
		            </button>
                    
                    <br/><br/>
                    
    				<div class="form-group">
    				  <label class="form-label" for="name">#여행지 이름<spring:message code="area.form.name"/></label>
    				    <div class="forms">
						<input type="text" class="form-control input" id="name" name="name" placeholder="여행지 검색을 해 주세요." required>
					</div>
					</div>
					<br/>
					
					<div class="form-group">
					  <label class="form-label" for="address">#여행지 주소</label>
					    <div class="forms">
						<input type="text" class="form-control input" id="address" name="address" placeholder="여행지 검색을 해 주세요." required>
					</div>
					</div>
					<br/>
					
					<div class="form-group">
					  <label class="form-label" for="tel">#전화번호</label>
					    <div class="forms">
						<input type="text" class="form-control input" id="tel" name="tel" placeholder="ex)02-123-4567" required>
					</div>
					</div>
					<br/>
					
					<div class="form-group">
					  <label class="form-label" for="way">#가는 방법</label>
					  <div class="forms">
						<input type="text" class="form-control input" id="way" name="way" placeholder="ex)기차를 타고 Watford Junction역에서 내려서 15분마다 오는 해리포터 셔틀 탑승" required>
					</div>
					</div>
					<br/>
					
					<div class="form-group">
					  <label class="form-label" for="hours">#영업 시간</label>
					  <div class="forms">
						<input type="text" class="form-control input" id="hours" name="hours" placeholder="ex)평일: AM 08:00 - PM 6:00" required>
					</div>
					</div>
					<br/>
					
					<div class="form-group">
					  <label class="form-label" for="web">#홈페이지</label>
					  <div class="forms">
						<input type="text" class="form-control input" id="web" name="web" placeholder="https://www.wbstudiotour.co.uk/" required>
					</div>
					</div>
					<br/>
					
                    <div class="form-group">
                      <label class="form-label" for="content">#상세 설명</label>
                      <div class="forms">
                    <textarea class="form-control" type="textarea" id="content" name="content" placeholder="ex)런던의 명소 해리포터 스튜디오는 영국에서 꼭 들려야 할 필수 관광지 중의 하나이다. 특히 이곳에서 파는 버터맥주는..." rows="10" cols="100"></textarea>                  
                    </div>
                    </div>
                    <br/>
                    
                    <div class="form-group">
                      <label class="form-label" for="file">#여행지 사진 첨부하기</label>
                      <div class="forms">
                      <input id="files-upload" type="file" name="file" multiple>
                      
                      <ul id="file-list">
                        <li class="no-items">(첨부한 파일 없음)</li>
                      </ul>


</div>
</div>
<br/>

</div>
</div>
</td>
</tr>
</table>

<center>
<input type="hidden" name="keyword" value="${param.keyword }" />
<input type="hidden" name="city_no" value="0" />
<input type="submit" value="등록">
<button class="btn btn-default" onclick="areaList();">취소</button>
</center>

<br><br><br>
</form>
</body>
</html>