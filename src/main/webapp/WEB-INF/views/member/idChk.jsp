<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>�̸��� �ߺ� Ȯ��</title>

<script language="javascript">
function windowclose(){
	opener.document.joinForm.email.value="${param.email}";
	opener.document.joinForm.email2.value="${param.email}";


	window.close();
}
function check(){
	for (i=0;i<idChkForm.email.value.length;i++ ){
		var ch = idChkForm.email.value.charAt(i)
		if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z')&&!(ch=='@')&&!(ch=='.')){
	  		alert ("�̸����� �ҹ���, ���ڸ� �Է°����մϴ�.")
	  		idChkForm.email.focus();
	  		return false;
	  	}
	}
	if(idChkForm.email.value==""){
		alert("�̸����� �Է��� �ּ���.");
		idChkForm.email.focus();
		return false;
	}
	
}
</script>
</head>
<body>

<!-- �̸����� ������ ��� -->
 <c:choose>
<c:when test="${memberEmailChk==1}">
	<form name="idChkForm" action="duplChk.go" method="post" onsubmit="return check();">
	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
		<tr height="25">
			<td bgcolor="red" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="red"><strong>&nbsp;&nbsp;�̸��� �ߺ�</strong></font></td>
		</tr>
	</table>
	<br>
	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="red">
			<td height="1"></td>
		</tr>
		<tr height="10">
			<td></td>
		</tr>
		<tr>
			<td><font color="red">[ ${member.EMAIL} ]�� �̹� ������� �̸����Դϴ�. �ٸ� �̸����� ������ �ּ���</font></td>
		</tr>
		<tr height="10">
			<td></td>
		</tr>
		<tr bgcolor="red">
			<td height="1"></td>
		</tr>
	</table>
	<br>
	<br>
	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
		<tr height="25">
			<td bgcolor="1E90FF" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;ID �ߺ� Ȯ��</strong></font></td>
		</tr>
	</table>
	<br>
	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="1E90FF">
			<td height="1"></td>
		</tr>
		<tr height="10">
			<td></td>
		</tr>
		<tr align="center">
			<td>
				<input type=email maxlength=20 name="email"/>
				<input type=submit value="�ߺ� Ȯ��" class="topb"/>
			</td>
		<tr>
		<tr height="10">
			<td></td>
		</tr>
		<tr bgcolor="1E90FF">
			<td height="1"></td>
		</tr>
		<tr height="20">
			<td></td>
		</tr>
		<tr>
			<td align="center"><input type="button" class="login1" value="�ݱ�" onclick="javascript:window.close();"/></td>
		</tr>
	</table>
	</form>
</c:when>
 <c:otherwise>
	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
		<tr height="25">
			<td bgcolor="1E90FF" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;��� ����</strong></font></td>
		</tr>
	</table>
	<br>
	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="1E90FF">
			<td height="1"></td>
		</tr>
		<tr height="10">
			<td></td>
		</tr>
		<tr>
			<td>�Է��Ͻ� [${param.email}]�� ����� �� �ִ� �̸����Դϴ�.</td>
			<input type="hidden" name="check" value="0">
		</tr>
		<tr height="10">
			<td></td>
		</tr>
		<tr bgcolor="1E90FF">
			<td height="1"></td>
		</tr>
		<tr height="20">
			<td></td>
		</tr>
		<tr>
			<td align="center"><input type="button" class="login1" value="�ݱ�" onclick="javascript:windowclose();"/></td>
		</tr>
	</table>
</c:otherwise>

 </c:choose> 
</body>
</html>