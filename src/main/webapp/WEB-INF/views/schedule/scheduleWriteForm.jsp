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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/locales/bootstrap-datepicker.ko.min.js"></script>
<script type="text/javascript">
function check(){
var write = document.sForm;	   
if(write.s_name.value==""){
	alert("���� �̸��� �Է����ּ���.");
	write.s_name.focus();
	return false;
}
else if(write.s_start_date.value==""){
	alert("������� �������ּ���.");
	write.s_start_date.focus();
	return false;
}
else if(write.s_end_date.value==""){
	alert("�������� �������ּ���.");
	write.s_end_date.focus();
	return false;
}
else if(write.emailExist.value.length != 0 && write.chk.value == 0){
	alert("�̸��� �˻� ��ư�� �����ּ���.");
	write.emailExist.focus();
	return false;
}
}
function openEmailExist(sForm){
	   var url="emailExist.go?emailExist="+document.sForm.emailExist.value;
	   var form=document.sForm;
	   for (i=0;i<form.emailExist.value.length;i++ ){
	      var ch = document.sForm.emailExist.value.charAt(i)
	      if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z')){
	           alert ("�̸����� �ҹ���, ���ڸ� �Է°����մϴ�.")
	           form.emailExist.focus();
	           return false;
	        }
	   }
	   if(form.emailExist.value==""){
	      alert("�̸����� �Է����ּ���.");
	      form.emailExist.focus();
	      return false;
	   }
	   if(form.emailExist.value=="${sessionScope.session_m_email}"){
		      alert("�ڽ� �̸����� ����� �� �����ϴ�.");
		      form.emailExist.value="";
		      form.emailExist.focus();
		      return false;
	   }

	   open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=10");
	}

$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
})
</script>
<style>
/*��� �̹���*/
.jumbotron{
background-image: url('/gokkiri/resources/img/cloud2.jpg');
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
}

.button {
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 16px;
  padding: 10px;
  width: 120px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
</style>
</head>
<body>
<!-- ��� �̹��� -->
<div class="jumbotron text-center">
  <form class="form-inline">
  	<p><font color="#ffffff" size="10"><b>������ ���� ������ ���弼��!</b></font></p>
  	<p><font color="#ffffff" size="3">�� ���� ������ ������ �� �ְ� �ٸ� ����� ���� ���� ������ �� �� �ֽ��ϴ�.</font></p>
    <div class="input-group">
 		<a class="btn btn-default" href="/gokkiri/schedule/scheduleList.go?currentPage=1" role="button">��������</a>
    </div>
  </form>
</div>

<table width="100%">
<tr>
<td>
<form:form commandName="scheduleModel" name="sForm" class="form-horizontal" action="scheduleState.go" method="post" onsubmit="return check();">
  <c:if test="${not empty scheduleIncompleteList }">
	  <div class="form-group"> 
	    <div class="col-sm-offset-2 col-sm-10">
	    	<!-- ������ ���������� �̿ϼ� -->
	        <label>
	        	<span style="cursor:pointer;"
	        			onclick="javascript:location.href='/gokkiri/mypage/myScheduleList.go?s_complete=0&s_private=0'" 
	        			class="label label-primary">${fn:length(scheduleIncompleteList) }</span>&nbsp;���� ������ �ϼ��� ��ٸ��� �ֽ��ϴ�.
	        </label>
	    </div>
	  </div>
  </c:if>
  <div class="form-group">
    <label class="control-label col-sm-2">���� �̸�:</label>
    <div class="col-sm-6">
      <input type="text" 
      		class="form-control" 
      		name="s_name" 
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
      		<input id="s_start_date" 
      				name="s_start_date" 
      				class="input-date form-control" 
      				type="text" 
      				placeholder="����� ����" 
      				data-placement="bottom"
      				readonly="readonly" 
      				data-toggle="tooltip" 
      				title="�ʼ��Է� �׸� �Դϴ�."/>
      		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true" id="s_start_date" style="cursor:pointer;"></span></span>
    	</div>
    </div>
    <div class="col-sm-3"> 
      	<div class="input-group">
      		<span class="input-group-addon">������</span>
      		<input id="s_end_date" 
      			name="s_end_date" 
      			class="input-date form-control" 
      			type="text" 
      			placeholder="������ ����" 
      			readonly="readonly" 
      			data-placement="bottom"
      			data-toggle="tooltip" 
      			title="�ʼ��Է� �׸� �Դϴ�."/>
      		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar" aria-hidden="true" id="s_end_date" style="cursor:pointer;"></span></span>
    	</div>
    </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">�˻�:</label>
      <div class="col-sm-6">
       <div class="input-group">
        <input type="text" name="emailExist" class="form-control" aria-describedby="basic-addon2" placeholder="�̸����� �Է����ּ���."> 
        <input type="hidden" name="chk" value="0">
        <span class="input-group-addon" id="basic-addon2">@naver.com</span>
        <span class="input-group-btn">
        <button class="btn btn-default" onclick="openEmailExist(this.form)" name="confirmId" type="button">
        <span class="glyphicon glyphicon-search"></span>&nbsp; </button>
      </span>
       </div>
      </div>
    </div>
    
   <div class="form-group">
   	<label class="control-label col-sm-2" for="pwd">������ ������ ģ��:</label>
    <div class="col-sm-6">
      <input type="text" name="s_together" class="form-control" aria-describedby="basic-addon2" placeholder="�˻� �� �߰��� ���ּ���." readonly="readonly"> 
    </div>
  </div>
    
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label data-toggle="tooltip" title="üũ�� �� ���� �Խ��ǿ� ��Ÿ���� �ʽ��ϴ�.">
        	<input type="checkbox" name="s_private" value="1"/>
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

<script type="text/javascript">
//������ TextBox�� DateTimePicker ������ �����Ѵ�.
$('#s_start_date').datepicker({
  format : "yyyy-mm-dd",
  language : "ko", // ȭ�鿡 ��µ� �� �ѱ���� �����Ѵ�.
  pickTime : false, // ����ڷκ��� �ð� ������ ����Ϸ��� true�� �����ϰų� pickTime �ɼ��� �����Ѵ�.
  startDate : new Date() // �⺻������ ���� ��¥�� �Է��Ѵ�. �⺻���� �����Ϸ��� defaultDate �ɼ��� �����Ѵ�.
});

$('#s_end_date').datepicker({
  format : "yyyy-mm-dd",
  language : "ko",
  pickTime : false,
  startDate : new Date()
});
</script>
<br><br><br><br><br>
</body>
</html>