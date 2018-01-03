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

function areaDetail(){
	
	if(confirm("�����ϱ⸦ ����Ͻðڽ��ϱ�?") == true){
		location.href="areaDetail.go?a_no=${param.a_no}&keyword=${param.keyword}";
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
    	<form action="areaModify.go" name="areaWrite" class="form-horizontal" enctype="multipart/form-data"	method="post">
         <input type="hidden" name="keyword" value="${param.keyword }" />
          <fieldset>
            <div id="legend">
              <legend>������ �۾���</legend>
            </div>
          <br/><br/>  
	            <div class="radio">
	            	<c:if test="${a_cate == 0 }">
	 				 	<label><input type="radio" name="a_cate" value="0" checked="checked">������</label>
	 				 	<label><input type="radio" name="a_cate" value="1">����</label>
	 				 </c:if>
	 				 <c:if test="${a_cate == 1 }">
	 				 	<label><input type="radio" name="a_cate" value="0">������</label>
	 				 	<label><input type="radio" name="a_cate" value="1" checked="checked">����</label>
	 				 </c:if>
				</div>
          <br/>
          
        <button type="button" class="btn btn-default btn-lg" onclick="searchMap()">
  			<span class="glyphicon glyphicon-search" aria-hidden="true">�ּҰ˻�</span>
		</button>
          
          <br/><br/>
            <div class="control-group">
              <label class="control-label" for="a_name">�� ������ �̸�</label>
              <div class="controls">
                <input name="a_name" class="form-control input" id="a_name" type="text" value="${areaModel.a_name}" placeholder="�ּҰ˻� ��ư�� Ŭ�� ���ּ���" readonly>
                <!-- <p class="help-block"></p> -->
              </div>
            </div>
         <br/>
         	<div class="control-group">
              <label class="control-label" for="a_addr">�� ������ �ּ�</label>
              <div class="controls">
                <input name="a_addr" class="form-control input" id="a_addr" type="text" value="${areaModel.a_addr }" placeholder="�ּҰ˻� ��ư�� Ŭ�� ���ּ���" readonly>
              </div>
            </div>
         <br/>
         	<div class="control-group">
              <label class="control-label" for="a_tel">�� ��ȭ��ȣ</label>
              <div class="controls">
                <input name="a_tel" class="form-control input" id="a_tel" type="text" value="${areaModel.a_tel }" placeholder="ex) 02-000-0000">
              </div>
            </div>
         <br/>
            <div class="control-group">
              <label class="control-label" for="a_way">�� ���� ���</label>
              <div class="controls">
                <input name="a_way" class="form-control input" id="a_way" type="text"  value="${areaModel.a_way }" placeholder="ex) 2ȣ�� �Ｚ�� 5�� �ⱸ�� ������ ������ 5��">
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="a_hours">�� ���� �ð�</label>
              <div class="controls">
                <input name="a_hours" class="form-control input" id="a_hours" type="text"  value="${areaModel.a_hours }"  placeholder="ex) AM 07:00 ~ PM 9:00 ���߹���">
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="a_web">�� �� ����Ʈ</label>
              <div class="controls">
                <input name="a_web" class="form-control input" id="a_web" type="text" value="${areaModel.a_web }" placeholder="ex) www.google.co.kr">
              </div>
            </div>
         <br/>
         <div class="control-group">
              <label class="control-label" for="a_con">�� �� ����</label>
              <div class="controls">
                <textarea rows="10" cols="100"  name="a_con" class="form-control input" id="a_con" 
                placeholder="ex) �б���/û�㿡 �̾� ���ο� �м�, ��Ƽ, ��ȭ�� �߽��� ������ �ϰ� �ִ� ���μ����� ����ȣ�� ������ ���� �����Ͽ� �б��� �������б� ������ 700m������ �Ÿ��� ���μ����̶��...">${areaModel.a_con }</textarea>
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
						<li class="no-items"><font color="gray">${imgList.a_img_org }</font></li>
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
<input type="hidden" name="a_no" value="${param.a_no }" />
<button class="btn btn-success" onclick="this.form.submit();">�����ϱ�</button>&nbsp;</form>
<button class="btn btn-default" onclick="areaDetail();">���</button>
</center>
<br><br><br>
</body>
</html>