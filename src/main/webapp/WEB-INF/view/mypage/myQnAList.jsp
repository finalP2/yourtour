<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

  }

</style>
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


<!-- ī�װ��� -->
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
      <div class="panel-heading" style="background-color:#266eb7;color:#fff;">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"><b>������ �� ����Ʈ</b></a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse in">
      <div class="panel-body"><a href="/gokkiri/mypage/myTipList.go">���� Tip</a></div> 
        <div class="panel-body"><a href="/gokkiri/mypage/myAreaReviewList.go">����</a></div>
        <div class="panel-body"><a href="/gokkiri/mypage/myQnaList.go"><b>QnA</b></a></div>
        
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">ȸ������ ����</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
       <div class="panel-body"><a href="/gokkiri/member/memberModifyForm.go" >���� ����</a></div>
        <div class="panel-body"><a href="/gokkiri/member/memberDeleteForm.go" >ȸ�� Ż��</a></div>
      </div>
    </div>
  </div> 
    
  </div>

    <div class="col-sm-9" style="width:63%;">
 <h1 class="text-left">
<img src="/gokkiri/resources/img/myQnA.png" />
</h1>
<br/>
 
 <ul class="nav nav-tabs nav-tabs" role="tablist" style="width:83%;">
    <li class="active"><a href="/gokkiri/mypage/myQnaList.go"><b>QnA ��</b></a></li>
    <li><a href="/gokkiri/mypage/myQnaCoList.go"><b>QnA ���</b></a></li>        
</ul>

                                               
  <table class="table">
    <thead>
      <tr class="info">
        <th>����</th>
        <th>����</th>
        <th>�̸���</th>
        <th>��¥/�ð�</th>
      </tr>
    </thead>
    
    <tbody>
    <c:forEach var="qnaList" items="${qnaList}" varStatus="stat">
    
      <tr>
        <td>${qnaList.q_sub}</td>
        <td><a href="/gokkiri/qna/qnaView.go?q_no=${qnaList.q_no }&a_no=${qnaList.a_no}">${qnaList.q_con}</a></td>
        <td>${qnaList.m_email}</td>
        <td><fmt:formatDate value="${qnaList.q_date}" pattern="YYYY-MM-dd, hh:mm" /></td>
      </tr>
      
	</c:forEach>
    </tbody>
   </table>
</div>

<!-- DB�� �Խù��� ������ �����ִ� �� -->
	<c:if test="${fn:length(qnaList) le 0}">
		<br/>
		<center>��ϵ� �Խù��� �����ϴ�</center>
		<br/>
	</c:if>

</div>
</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>