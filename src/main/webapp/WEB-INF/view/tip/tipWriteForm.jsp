<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Pinball Website Template | single-page :: w3layouts</title>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript">
	function tipList() {
		if (confirm("����Ʈ�� �̵��Ͻðڽ��ϱ�?") == true) {
			location.href = 'tipList.go';
		} else {
			return;
		}
	}
 	function openZipcode(){
		var url="areaSearch.go";
		open(url, "confirm","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=400");
	} 
</script>
<script>
	//main�������� �� ����: �θ�� �������ϱ� ���ؼ��� opener���
	function sendAdd(a_name,a_no){
		opener.document.tForm.a_no.value= a_no;
		opener.document.tForm.a_name.value= a_name;
	self.close();	
	}
</script>
<script type="text/javascript">
	function previewImage(targetObj, previewId) {

		var preview = document.getElementById(previewId); //div id   
		var ua = window.navigator.userAgent;

		if (ua.indexOf("MSIE") > -1) {//ie�϶�

			targetObj.select();

			try {
				var src = document.selection.createRange().text; // get file full path 
				var ie_preview_error = document
						.getElementById("ie_preview_error_" + previewId);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error�� ������ delete
				}

				var img = document.getElementById(previewId); //�̹����� �ѷ��� �� 

				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + previewId)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + previewId;
					info.innerHTML = "a";
					preview.insertBefore(info, null);
				}
			}
		} else { //ie�� �ƴҶ�
			var files = targetObj.files;
			for (var i = 0; i < files.length; i++) {

				var file = files[i];

				var imageType = /image.*/; //�̹��� �����ϰ�츸.. �ѷ��ش�.
				if (!file.type.match(imageType))
					continue;

				var prevImg = document.getElementById("prev_" + previewId); //������ �̸����Ⱑ �ִٸ� ����
				if (prevImg) {
					preview.removeChild(prevImg);
				}

				var img = document.createElement("img");
				img.id = "prev_" + previewId;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '790px'; //�⺻������ div�� �ȿ� �ѷ����� ȿ���� �ֱ� ���ؼ� divũ��� ���� ũ�⸦ �������ش�.
				img.style.height = '395px';

				preview.appendChild(img);

				if (window.FileReader) { // FireFox, Chrome, Opera Ȯ��.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					//alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_"
							+ previewId)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + previewId;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}
</script>
<style type="text/css">
/*����ϱ� ��ư */
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
</style>
</head>
<body>

<br/><br/>

<form action="tipWrite.go" class="form-horizontal" name="tForm" enctype="multipart/form-data" method="post">
<input type="hidden" name="m_email" value="${session_m_email}" />
<input type="hidden" name="a_no" />

<table width="60%" align="center" >
<tr><td>

<br/><br/>

<!-- ����Tip ���� -->
<div align="left">
	<b><font size="5" color="#266eb7"><span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;����Tip ����</font></b><br/>
	&nbsp;&nbsp;&nbsp;<font size="2">�������� ���� ���õ� �پ��� ����Tip�� �����غ�����!</font>
</div>
<br/><br/>

<!-- ������ �̹��� ���� ��� -->
<div class="panel panel-default">
  <div class="panel-heading">
  	<b>�� �̹���</b>
  </div>
  <div class="panel-body" align="center">
  	<div id='previewId' style='width: 100%; margin:auto; align: center;'></div>
  </div>
</div>
<div align="left">
	<input type="file" class="btn btn-default" onchange="previewImage(this,'previewId')" id="file" name="file" />
	<font color="red" size="2">*�̹����� �ݵ�� ÷�����ּ���</font>
</div>

<br/>

<!-- ����,���� �ۼ� -->
<div class="control-group">
	<label class="control-label" for="t_sub">�� ����Tip ����</label>
	<div class="controls">
		<input name="t_sub" class="form-control input" id="t_sub" type="text">
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="t_con">�� ����Tip ����</label>
	<div class="controls">
		<textarea class="form-control" rows="5" id="comment" name="t_con" placeholder="Tip������ �Է����ּ���"></textarea>
	</div>
</div>

<br/><br/>

<!-- �ּҰ˻� ��ư -->
<button type="button" class="btn btn-default" onclick="openZipcode();">
  	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>�ּҰ˻�
</button>

<!-- ������ �ּ� �˻� -->
<div class="control-group">
	<label class="control-label" for="a_name">�� ������ �ּ�</label>
	<div class="controls">
		<input name="a_name" class="form-control input" id="a_name" type="text" placeholder="�ּҰ˻� ��ư�� Ŭ�� ���ּ���" readonly>
	</div>
</div>

<br/>


<br/><br/>

<!-- ����ϱ�/��� ��ư -->
<div align="right">
	<button type="button" class="btn btn-default" onclick="tipList()"><span>���</span></button>
	<button type="submit" class="button">����ϱ�</button>
</div>

</td></tr>
</table>
</form>

<br/><br/><br/><br/>

</body>
</html>

