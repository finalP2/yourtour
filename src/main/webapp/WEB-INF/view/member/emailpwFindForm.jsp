<%@ page contentType="text/html; charset=euc-kr"%>

<html>
<head>
<script language="javascript">
function validation(){
	if(document.findEmail.m_name.value==""){
		alert("�̸��� �Է����ּ���.");
		document.findEmail.m_name.focus();
		return false;
	}
	
}
function validation2(){
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
<title>�̸���/��й�ȣ ã��</title>
</head>
<body>
<br><br><br><br><br>

<div class="container">
  <h2>�̸��� ã��</h2>
  <hr>
  <form action="emailFind.go" method="post"  name="findEmail" onsubmit="return validation();">
  <div class="form-group">
  	<div class="col-xs-4" align="right">
      	<input type="text" name="m_name" class="form-control" placeholder="�̸��� �Է��ϼ���.">
	    <button type="submit" class="btn btn-default">
	    <span class="glyphicon glyphicon-ok"></span>&nbsp;�̸��� ã��</button>
	</div>
  </div>
  </form>
</div>

<br><br><br>

	<div class="container">
  <h2>��й�ȣ ã��</h2>
  <hr>
  <form action="pwFind.go" method="post"  name="findPassword" onsubmit="return validation2();">
  <div class="form-group">
  	<div class="col-xs-4" align="right">
      	<input type="text" name="m_name" class="form-control" placeholder="�̸��� �Է��ϼ���.">
      	<input type="text" name="m_email" class="form-control" placeholder="�̸����� �Է��ϼ���.">
	    <button type="submit" class="btn btn-default">
	    <span class="glyphicon glyphicon-ok"></span>&nbsp;�н����� ã��</button>
	</div>
  </div>
  </form>
</div>
<br><br><br>
	

<br><br><br><br><br>
</body>
</html>