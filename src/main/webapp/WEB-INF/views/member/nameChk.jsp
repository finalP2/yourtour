<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>이름(닉네임) 중복 확인</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script language="javascript">
function windowclose(){

		opener.document.joinForm.nickname.value="${param.nickname}";
		window.close();

}

 function windowclose2(){
	opener.document.memberModifyForm.nickname.value="${param.nickname}";
	window.close();
} 

function check(){
	
	if(nameChkForm.nickname.value==""){
		alert("닉네입음 입력해 주세요.");
		nameChkForm.nickname.focus();
		return false;
	}
	
	
	
}



</script>
</head>
<body>

<!-- 이름이 존재할 경우 -->
 <c:choose>
<c:when test="${memberNameChk==1}">
	<form name="nameChkForm" action="nameDuplChk.go" method="post" onsubmit="return check();">
	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
		<tr height="25">
			<td bgcolor="red" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="red"><strong>&nbsp;&nbsp;닉네임 중복</strong></font></td>
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
			<td><font color="red">[ ${member.nickname} ]는 이미 사용중인 닉네임 입니다. 다른 닉네임을 선택해 주세요</font></td>
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
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;닉네임 중복 확인</strong></font></td>
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
				<input type=text maxlength=20 name="nickname"/>
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
			<td>입력하신 [${param.nickname}]는 사용할 수 있는 닉네임 입니다.</td>
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
			<c:if test="${session_m_nickname == null }">
			<td align="center"><input type="button" class="login1" value="닫기" onclick="javascript:windowclose();"/></td>
			</c:if>
			
			<c:if test="${session_m_nickname != null }">
			<td align="center"><input type="button" class="login1" value="닫기" onclick="javascript:windowclose2();"/></td>
			</c:if>
		</tr>
	</table>
</c:otherwise>

 </c:choose> 
</body>
</html>