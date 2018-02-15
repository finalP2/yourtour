<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>이메일 중복 확인</title>

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
	  		alert ("이메일은 소문자, 숫자만 입력가능합니다.")
	  		idChkForm.email.focus();
	  		return false;
	  	}
	}
	if(idChkForm.email.value==""){
		alert("이메일을 입력해 주세요.");
		idChkForm.email.focus();
		return false;
	}
	
}
</script>
</head>
<body>

<!-- 이메일이 존재할 경우 -->
 <c:choose>
<c:when test="${memberEmailChk==1}">
	<form name="idChkForm" action="duplChk.go" method="post" onsubmit="return check();">
	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
		<tr height="25">
			<td bgcolor="red" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="red"><strong>&nbsp;&nbsp;이메일 중복</strong></font></td>
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
			<td><font color="red">[ ${member.EMAIL} ]는 이미 사용중인 이메일입니다. 다른 이메일을 선택해 주세요</font></td>
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
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;ID 중복 확인</strong></font></td>
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
				<input type=submit value="중복 확인" class="topb"/>
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
			<td align="center"><input type="button" class="login1" value="닫기" onclick="javascript:window.close();"/></td>
		</tr>
	</table>
	</form>
</c:when>
 <c:otherwise>
	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
		<tr height="25">
			<td bgcolor="1E90FF" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;사용 가능</strong></font></td>
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
			<td>입력하신 [${param.email}]는 사용할 수 있는 이메일입니다.</td>
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
			<td align="center"><input type="button" class="login1" value="닫기" onclick="javascript:windowclose();"/></td>
		</tr>
	</table>
</c:otherwise>

 </c:choose> 
</body>
</html>