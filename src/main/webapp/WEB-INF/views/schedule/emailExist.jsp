<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̸��� Ȯ��</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function windowclose(){
	<c:if test="${chk==1 }">
		opener.document.sForm.chk.value="1";
    </c:if>
    <c:if test="${chk==0 }">
   		opener.document.sForm.emailExist.value="";
    </c:if>
    window.close();
}
function addclose(){
	opener.document.sForm.emailExist.value="";
	opener.document.sForm.s_together.value+="${param.emailExist} / ";
    window.close();
}
</script> 
</head>
<body>
<c:if test="${chk==1 }">
<div class="alert alert-success" role="alert">
  <span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
  <span class="sr-only">Error:</span>
  ����� �� �ִ� ���̵��Դϴ�.&nbsp;&nbsp;
  <button class="btn btn-default" onclick="javascript:addclose();">�߰�</button>
  <button class="btn btn-default" onclick="javascript:windowclose();">�ݱ�</button>
</div>
</c:if>
<c:if test="${chk==0 }">
<div class="alert alert-danger" role="alert">
  <span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>
  <span class="sr-only">Error:</span>
  �������� �ʴ� ���̵��Դϴ�.&nbsp;&nbsp;<button class="btn btn-default" onclick="javascript:windowclose();">�ݱ�</button>
</div>
</c:if>
