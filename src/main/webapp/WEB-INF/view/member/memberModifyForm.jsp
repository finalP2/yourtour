<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<head>
<style>
.jumbotron{
background-image: url('/gokkiri/resources/img/sea.JPG');
background-repeat: no-repeat;
background-position: center;
background-size: cover;
width: 100%;
height: 100%;
}

/*����ϱ� ��ư */
.button {
  padding: 10px 10px;
  font-size: 16px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #f4511e;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}
.button:hover {background-color: #cc441a}
.button:active {
  background-color: #cc441a;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>

<script language="javascript">
function check(){
   var reg = document.memberModifyForm;
   
   if(reg.m_pw.value==""){
      alert("��й�ȣ�� �Է����ּ���");
      reg.m_pw.focus();
      return false;
   }
   else if(reg.m_pw.value != reg.m_pw2.value){
      alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
      reg.m_pw2.focus();
      return false;
   }
   else if(reg.m_pw.value.length < 6 || reg.m_pw.value.length > 13){
      alert("��й�ȣ�� 6~13�ڱ��� �Է����ּ���.");
      reg.m_pw.focus();
      return false;
   }
   else if(reg.m_name.value==""){
      alert("�̸��� �Է����ּ���");
      reg.m_name.focus();
      return false;
   }
   
}

function openNameChk(memberModifyForm){
   var url="nameDuplChk.go?m_name="+document.memberModifyForm.m_name.value;
   var reg=document.memberModifyForm;
   
   if(reg.m_name.value==""){
      alert("�̸�(�г���)�� �Է����ּ���");
      reg.m_name.focus();
      return false;
   }
   
   open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
}
$(document).ready(function(){
   
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
    
})
</script>
</head>
<body>
<!-- ��� �̹���-->
<div class="jumbotron text-center">
  <form class="form-inline">
     <br><br>
     <p><font color="#ffffff" size="10"><b>�ѱ�, ������ ���ô�?</b></font></p>
     <br><br>
  </form>
</div>
<br>


<!-- ī�װ� -->
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3">
    
   <div class="panel-group" id="accordion" style="width: 80%; margin-left:5%;" >
  
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title" >
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" >���� ����Ʈ</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse">
        <div class="panel-body"><a href="/gokkiri/mypage/myScheduleList.go?s_complete=1&s_private=0">�� ����</a></div>
        <div class="panel-body"><a href="/gokkiri/mypage/zzimScheduleList.go">���� ����</a></div>
        <div class="panel-body"><a href="/gokkiri/mypage/sharedScheduleList.go">�������� ����</a></div>  
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading" >
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">������ �� ����Ʈ</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
      <div class="panel-body"><a href="/gokkiri/mypage/myTipList.go">���� Tip</a></div>
        <div class="panel-body"><a href="/gokkiri/mypage/myAreaReviewList.go">����</a></div>
        <div class="panel-body"><a href="/gokkiri/mypage/myQnaList.go">QnA</a></div>
         
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color:#266eb7;color:#fff;">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"><b>ȸ������ ����</b></a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse in">
       <div class="panel-body"><a href="/gokkiri/member/memberModifyForm.go" ><b>���� ����</b></a></div>
        <div class="panel-body"><a href="/gokkiri/member/memberDeleteForm.go" >ȸ�� Ż��</a></div>
      </div>
    </div>
  </div> 
    
  </div>

<div class="col-sm-9" style="width:60%;" >
 <h1 class="text-left">
<img src="/gokkiri/resources/img/info.png" />
</h1>
<br/>
 
 <form action="memberModify.go" name="memberModifyForm" method="post" onsubmit="return check();">


        
   <div class="form-group" style="width:50%;" >
     <label class="control-label" for="disabledInput">�̸���:</label>
     <input type="hidden" value="${member.m_email}" name="m_email" />
     <input class="form-control" id="disabledInput"  name="m_email" type="text" placeholder="${member.m_email}" disabled="">
   </div>
    

       <br>
     <div class="form-group" style="width:50%;">
     <label class="control-label" for="focusedInput">��й�ȣ:</label>
     <input class="form-control" id="focusedInput" name="m_pw" type="password" placeholder="��й�ȣ�� �Է��ϼ���.">
   </div>
   
     <br>   
    <div class="form-group has-error" style="width:50%;">
     <label class="control-label" for="inputError">��й�ȣ Ȯ��:</label>
     <input class="form-control" id="inputError" name="m_pw2" type="password" placeholder="��й�ȣ�� �ٽ��ѹ� �Է��ϼ���.">
   </div>


   <br>  
  <div class="form-group" style="width:50%;">
  <label class="control-label">�̸�:</label>
  <div class="input-group">
    <input name="m_name" type="text" class="form-control" placeholder="�г����� �Է��ϼ���.">
    <span class="input-group-btn">
      <button class="btn btn-default" onclick="openNameChk(this.form)" name="confirmName" type="button">�ߺ�Ȯ��</button>
    </span>
  </div>
</div>
    
   <br><br><br><br>
    <div class="form-group" align="right" style="width:50%;">
      <div class="col-lg-10 col-lg-offset-2">
      <button type="submit" class="button">���� ����</button>
      <button type="reset" class="btn btn-default"><span class="glyphicon glyphicon-remove"></span>&nbsp;���</button>
        
      </div>
    </div>

</form>
</div>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>