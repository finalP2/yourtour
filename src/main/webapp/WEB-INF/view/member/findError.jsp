<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̸���ã�� ����</title>
<script>
	window.onload = function(){
		var chk = ${memberFindChk}
		
		if(chk == -1){
			alert('�Էµ� ������ Ʋ���ϴ�');
			history.back();
		}
		if(chk == 0){
			alert('���ԵǾ� ���� �ʴ� ������Դϴ�');
			history.back();
		}
	}
</script>
</head>
<body>

</body>
</html>