<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̸���ã�� ����</title>
<script>
	window.onload = function(){
		var chk = ${s_state}
		
		if(chk == 1){
			alert('������ �����Ǿ����ϴ�. ������������ �̵��մϴ�.');
			window.location.href = '/gokkiri/mypage/sharedScheduleList.go';
		}
		if(chk == 2){
			alert('�����Ͽ����ϴ�.');
			window.location.href = '/gokkiri/main.go';
		}
	}
</script>
</head>
<body>

</body>
</html>