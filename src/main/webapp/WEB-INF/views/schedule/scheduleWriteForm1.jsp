<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">

	
function check(){
	
	var write = document.sForm;	   
	if(write.name.value==""){
		alert("���� �̸��� �Է����ּ���.");
		write.name.focus();
		return false;
	}
	else if(write.start_date.value==""){
		alert("������� �������ּ���.");
		write.start_date.focus();
		return false;
	}
	else if(write.end_date.value==""){
		alert("�������� �������ּ���.");
		write.end_date.focus();
		return false;
	}

}

    function check_only(chk){
        var obj = document.getElementsByName("season");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != chk){
                obj[i].checked = false;
            }
        }
    }
    function check_only1(chk){
        var obj = document.getElementsByName("theme");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != chk){
                obj[i].checked = false;
            }
        }
    }


</script>

</head>
<body>
<!-- ��� �̹��� -->
<div class="jumbotron text-center">
  <form class="form-inline">
  	<p><font color="#ffffff" size="10"><b>������ ���� ������ ���弼��!</b></font></p>
  	<p><font color="#ffffff" size="3">�� ���� ������ ������ �� �ְ� �ٸ� ����� ���� ���� ������ �� �� �ֽ��ϴ�.</font></p>
    <div class="input-group">
 		<a class="btn btn-default" href="/yourtour/schedule/scheduleList.go?currentPage=1" role="button">��������</a>
    </div>
  </form>
</div>

<table width="100%">
<tr>
<td>
<form:form commandName="scheduleModel" name="sForm" class="form-horizontal" action="scheduleState.go" method="post" onsubmit="return check();">
  <div class="form-group">
    <label class="control-label col-sm-2">���� �̸�:</label>
    <div class="col-sm-6">
      <input type="text" 
      		class="form-control" 
      		name="name" 
      		data-placement="bottom"
      		data-toggle="tooltip" 
      		title="�ʼ��Է� �׸� �Դϴ�." 
      		placeholder="���� �̸��� �Է��ϼ���."/>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2">��¥ ����:</label>
    
    <div class="col-sm-3"> 
    	<div class="input-group">
    		<span class="input-group-addon">�����</span>
    		<input type=text id=start_date name=start_date size=12 placeholder="����� ����">
    	</div>
    </div>
    <div class="col-sm-3"> 
      	<div class="input-group">
      		<span class="input-group-addon">������</span>
      		<input type=text id=end_date name=end_date size=12 placeholder="������ ����" >	
    	</div>
    </div>
    	<input type="hidden" name=period id=period >
    </div>
   
 
  
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
     <span class="input-group-addon">����</span>
        <label data-toggle="tooltip" title="������ ������ �ּ���.">
        	<input type="checkbox" name="season" value="1" onclick="check_only(this)"/>��
        	<input type="checkbox" name="season" value="2" onclick="check_only(this)"/>����
        	<input type="checkbox" name="season" value="3" onclick="check_only(this)"/>����
        	<input type="checkbox" name="season" value="4" onclick="check_only(this)"/>�ܿ�
        	<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;
        </label>
      </div>
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
      <span class="input-group-addon">�׸�</span>
        <label data-toggle="tooltip" title="���� �׸��� ������ �ּ���.">
        	<input type="checkbox" name="theme" value="1" onclick="check_only1(this)"/>Ȧ��
        	<input type="checkbox" name="theme" value="2" onclick="check_only1(this)"/>Ŀ��
        	<input type="checkbox" name="theme" value="3" onclick="check_only1(this)"/>ģ��
        	<input type="checkbox" name="theme" value="4" onclick="check_only1(this)"/>����
        	<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2">�� ���� ���:</label>
    <div class="col-sm-6">
      <input type="text" 
      		class="form-control" 
      		name="s_name" 
      		data-placement="bottom"
      		data-toggle="tooltip" 
      		placeholder="���� ��� �Է��ϼ���."/>
    </div>
  </div>
  
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label data-toggle="tooltip" title="üũ�� �� ���� �Խ��ǿ� ��Ÿ���� �ʽ��ϴ�.">
        	<input type="checkbox" name="private1" value="1"/>
        	<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;��б�
        </label>
      </div>
    </div>
  </div>
  
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="button"><span>�����</span></button>
    </div>
  </div>

</form:form>
</td>
</tr>
</table>
<script>

$(function() {
	  $( "#start_date" ).datepicker({
	    dateFormat: 'yyyy-mm-dd'
	  });
	  $( "#end_date" ).datepicker({
		    dateFormat: 'yyyy-mm-dd'
		  });
	});
</script>
<br><br><br><br><br>
</body>
</html>