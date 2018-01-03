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

</style>
<script type="text/javascript"> 

function cityDetail(){
	
	if(confirm("����Ʈ�� �̵��Ͻðڽ��ϱ�?") == true){
		location.href="cityDetail.go?c_no=${cityModel.c_no}&keyword=${param.keyword}";
	}else{
		false;
	}
}

</script>
</head>
<body>

<br><br>



<div class="container">

<table width="60%" align="center">
<tr><td>
  <div class="row">
  	<div class="col-md-12">
    	<form action="cityModify.go" class="form-horizontal" enctype="multipart/form-data"	method="post">
         
          <fieldset>
            <div id="legend">
              <legend>���� �۾���</legend>
            </div>
          <br/><br/>  
          
		 <div class="control-group">
              <label class="control-label" for="state_name">�� ���� : ${cityModel.state_name }</label>
         </div>
         <br/>
            <div class="control-group">
              <label class="control-label" for="c_name">�� �� �̸�</label>
              <div class="controls">
                <input name="c_name" class="form-control input" id="c_name" type="text" value="${cityModel.c_name }" placeholder="ex) ������, �߱�...">
                <!-- <p class="help-block"></p> -->
              </div>
            </div>
         <br/>
            <div class="control-group">
              <label class="control-label" for="c_addr">�� �ּ� </label>
              <div class="controls">
                <input name="c_addr" class="form-control input" id="c_addr" type="text" value="${cityModel.c_addr }" placeholder="��,�� ������ �ּҸ� �����ּ���.  ex)����Ư���� ������" >
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="c_con">�� ���� ����</label>
              <div class="controls">
                <textarea rows="10" cols="100"  name="c_con" class="form-control input" id="c_con" 
                placeholder="ex) ����Ư���� �����ο� �ִ� ��. �������� �Ѱ��� ���� ��������������, �������� ���ı�, �������� ���ʱ��� ���ϰ�, �������� ��� �����ÿ� ��踦 �̷�...">${cityModel.c_con }</textarea>
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="file">�� ÷������</label>
              <div class="controls">
              <input id="files-upload" type="file" name="file" multiple>
				
				<ul id="file-list"> 
				</ul>
				
				<ul>
					<li class="no-items"><font color="red">* �̹��� ������ �ٽ� ÷������ ������ ���� ���� �̹����� ������ �˴ϴ�.</font></li>
					<c:forEach var="imgList" items="${imgList }" varStatus="stat">
						<c:if test="${stat.index == 0 }">
						</c:if>
						<li class="no-items"><font color="gray">${imgList.c_img_org }</font></li>
					</c:forEach>
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
<input type="hidden" name="c_no" value="${ cityModel.c_no}" />
<input type="hidden" name="keyword" value="${param.keyword }" />
<button class="btn btn-success" onclick="this.form.submit();">�����ϱ�</button>&nbsp;</form>
<button class="btn btn-default" onclick="cityDetail();">���</button>
</center>
<br><br><br>
</body>
</html>