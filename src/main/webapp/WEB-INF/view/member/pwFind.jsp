<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript">
function validation(){
	if(document.findPassword.m_name.value==""){
		alert("�̸��� �Է����ּ���.");
		document.findPassword.m_name.focus();
		return false;
	}
	if(document.findPassword.m_email.value==""){
		alert("�̸����� �Է����ּ���.");
		document.findPassword.member_id.focus();
		return false;
	}

}
</script>
<title>��й�ȣ ã�� ���</title>
</head>
<body>
<br><br><br><br><br>

<c:choose>
<c:when test="list.size() <= 0">
<div class="container">
  <h2>���̵� ã�� ����</h2>
  <span class="glyphicon glyphicon-info-sign"></span>&nbsp;<strong>�̸�</strong>�� <strong>�̸��� �ּ�</strong>�� Ȯ�����ּ���.
  <hr>
  <form action="pwFind.go" method="post"  name="findPassword" onsubmit="return validation();">
  <div class="form-group">
  	<div class="col-xs-4" align="right">
      	<input type="text" name="m_name" class="form-control" placeholder="�̸��� �Է��ϼ���.">
      	<input type="text" name="m_email" class="form-control" placeholder="�̸����� �Է��ϼ���.">
	    <button type="submit" class="btn btn-default">
	    <span class="glyphicon glyphicon-ok"></span>&nbsp;��й�ȣ ã��</button>
	    <button type="button" class="btn btn-default" onclick="javascript:history.go(-1)"><span class="glyphicon glyphicon-remove"></span>&nbsp;�ݱ�</button>
	</div>
  </div>
  </form>
</div>
</c:when>

 <c:otherwise>
<div class="container">
  <h2>��й�ȣ ã�� ���</h2>
  <hr>
  <form class="form-horizontal">
  <div class="col-xs-4">
 
	<p class="fz15"><center>${member.m_name}���� ��й�ȣ�� <strong>${member.m_pw}</strong>�Դϴ�.</center></p>

  <div align="right">
 <button type="button" class="btn btn-default" onclick="window:location='loginForm.go'"><span class="glyphicon glyphicon-log-in"></span>&nbsp;�α���</button>
 </div>
 </div>
 </form>
 <br>
</div>
</c:otherwise>

</c:choose>
<br><br><br><br><br>
</body>
</html>