<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̸���ã�� ����</title>
<script>
	window.onload = function(){
		var chk = ${memberLoginChk}
		
		if(chk == 0){ /* �α��μ��� */
			location.href="/gokkiri/main.go";
		}
		if(chk == 1){
			alert("�̸��� ������ �α����� �����մϴ�.");
			history.back();
		}
		if(chk == 2){
			alert("������ �α���");
			history.back();
		}
		if(chk == 3){
			alert("���̵� �������� �ʰų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�");
			history.back();
		}
		
	}
</script>
</head>
<body>

</body>
</html>