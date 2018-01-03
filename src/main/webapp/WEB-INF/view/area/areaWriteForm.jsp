<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>Insert title here</title>
<style>
/*���*/
.modal{
padding-top:50px; 
}

.modal-dialog{
 text-align:center;
}
</style>
<script type="text/javascript"> 

function areaList(){
	
	if(confirm("����Ʈ�� �̵��Ͻðڽ��ϱ�?") == true){
		location.href="areaList.go?c_no=${param.c_no}&a_cate=0";
	}else{
		false;
	}
}

function searchMap(){
	var url="areaSearchMap.go";
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=1000,height=500");	
}

</script>
</head>
<body>



<br/><br/>

<!-- ----------------------------------------------- -->

<div class="container">

<table width="60%" align="center">
<tr><td>
  <div class="row">
  	<div class="col-md-12"> 
    	<form action="areaWrite.go" name="areaWrite" class="form-horizontal" enctype="multipart/form-data"	method="post">
         
          <fieldset>
            <div id="legend">
              <legend>������ �۾���</legend>
            </div>
          <br/><br/>  
	            <div class="radio">
 				 	<label><input type="radio" name="a_cate" value="0">������</label>
 				 	<label><input type="radio" name="a_cate" value="1">����</label>
				</div>
          <br/>
          
        <button type="button" class="btn btn-default btn-lg" onclick="searchMap()">
  			<span class="glyphicon glyphicon-search" aria-hidden="true">�ּҰ˻�</span>
		</button>
          
          <br/><br/>
            <div class="control-group">
              <label class="control-label" for="a_name">�� ������ �̸�</label>
              <div class="controls">
                <input name="a_name" class="form-control input" id="a_name" type="text" placeholder="�ּҰ˻� ��ư�� Ŭ�� ���ּ���" readonly>
                <!-- <p class="help-block"></p> -->
              </div>
            </div>
         <br/>
         	<div class="control-group">
              <label class="control-label" for="a_addr">�� ������ �ּ�</label>
              <div class="controls">
                <input name="a_addr" class="form-control input" id="a_addr" type="text" placeholder="�ּҰ˻� ��ư�� Ŭ�� ���ּ���" readonly>
              </div>
            </div>
         <br/>
         	<div class="control-group">
              <label class="control-label" for="a_tel">�� ��ȭ��ȣ</label>
              <div class="controls">
                <input name="a_tel" class="form-control input" id="a_tel" type="text" placeholder="ex) 02-000-0000">
              </div>
            </div>
         <br/>
            <div class="control-group">
              <label class="control-label" for="a_way">�� ���� ���</label>
              <div class="controls">
                <input name="a_way" class="form-control input" id="a_way" type="text" placeholder="ex) 2ȣ�� �Ｚ�� 5�� �ⱸ�� ������ ������ 5��">
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="a_hours">�� ���� �ð�</label>
              <div class="controls">
                <input name="a_hours" class="form-control input" id="a_hours" type="text" placeholder="ex) AM 07:00 ~ PM 9:00 ���߹���">
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="a_web">�� �� ����Ʈ</label>
              <div class="controls">
                <input name="a_web" class="form-control input" id="a_web" type="text" placeholder="ex) www.google.co.kr">
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="a_con">�� �� ����</label>
              <div class="controls">
                <textarea rows="10" cols="100"  name="a_con" class="form-control input" id="a_con" 
                placeholder="ex) �б���/û�㿡 �̾� ���ο� �м�, ��Ƽ, ��ȭ�� �߽��� ������ �ϰ� �ִ� ���μ����� ����ȣ�� ������ ���� �����Ͽ� �б��� �������б� ������ 700m������ �Ÿ��� ���μ����̶��..."></textarea>
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="file">�� ÷������</label>
              <div class="controls">
              <input id="files-upload" type="file" name="file" multiple>
				
				<ul id="file-list"> 
					<li class="no-items">(������ ���õ��� ����)</li>
				</ul>
<script>

/* ���� ���ε� */
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

              </div>
            </div>
         <br/>
            <div class="control-group">
              <!-- Button -->
              <div class="controls">

              </div>
            </div>
          </fieldset>
          

 
   
    </div> 
  </div>
  </td></tr>
</table>
</div>

<center>
<input type="hidden" name="keyword" value="${param.keyword }" />
<input type="hidden" name="c_no" value="${param.c_no }" />
<button class="btn btn-success" onclick="this.form.submit();">����ϱ�</button>&nbsp;</form>
<button class="btn btn-default" onclick="areaList();">���</button>
</center>
<br><br><br>
</body>
</html>