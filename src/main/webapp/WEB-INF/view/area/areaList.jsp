<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
.row-centered {
    text-align:right;
}
.col-centered {
    display:inline-block;
    float:none;
    /* reset the text-align */
    text-align:left;
    /* inline-block space fix */
    margin-right:-4px;
}

/* ���� ������ */
ul { list-style: none;}

#hover-cap-4col .thumbnail {
	position:relative;
	overflow:hidden;	
	height: 180px;

}
.caption {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	background: rgba(0,0,0,0.4);
	width: 100%;
	height: 100%;
	color:#fff !important;
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

<script>
//���� ������
$(document).ready(function(){
	 
    $("[rel='tooltip']").tooltip();    
 
    $('#hover-cap-4col .thumbnail').hover(
        function(){
            $(this).find('.caption').slideDown(250); //.fadeIn(250)
        },
        function(){
            $(this).find('.caption').slideUp(250); //.fadeOut(205)
        }
    );    
 
});
</script>
</head>
<body>
<center> 

<br/><br/>

<div class="container">

<table width="100%" border="0" align="center">

		<tr>
			<td colspan="3">
				<ul class="nav nav-tabs nav-justified" >
  					<li><a href="/gokkiri/city/cityDetail.go?c_no=${param.c_no }&keyword=${param.keyword}">Ȩ</a></li>
					<li><a href="/gokkiri/area/areaList.go?c_no=${param.c_no }&a_cate=0&keyword=${param.keyword}">������</a></li>
					<li><a href="/gokkiri/area/areaList.go?c_no=${param.c_no }&a_cate=1&keyword=${param.keyword}">����</a></li>
					<li><a data-toggle="modal" data-target="#scheduleList">�������� ����</a></li>
				</ul>
			</td>
		</tr>
		
</table>

		<!-- ���� �������� ���� -->
			
<div id="scheduleList" class="modal fade" role="dialog">
<div class="modal-dialog" style="width:80%;">
	<!-- Modal content-->
				<form action="/gokkiri/schedule/scheduleList.go">
				<div class="modal-content">
					<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><b><font color="#266eb7">��${param.keyword }��</font>&nbsp;</b>���� �������� ����</h4>
					</div>
				
					<div class="modal-body" style="padding-left: 0px; padding-right: 35px;">
					
					<table width="100%" align="center"><tr><td>
					<input type="hidden" name="currentPage" value="1">
					<input type="hidden" name="keyword" value="${param.keyword }" />
					<ul class="thumbnails" id="hover-cap-4col">
					<c:forEach var="scheduleList" items="${scheduleList }" varStatus="stat">
					<c:if test="${stat.index lt 8 }">
					
				    <li class="col-md-3">
				   		<font size="2" color="#266eb7"><b>no.&nbsp;${scheduleList.s_no}</font><br/>
				   		<font size="4" color="#266eb7">
				   		<c:if test="${fn:length(scheduleList.s_name) gt 13 }">
							<c:out value="${fn:substring(scheduleList.s_name, 0, 13) }" />..
						</c:if>
						<c:if test="${fn:length(scheduleList.s_name) le 13 }">
							${scheduleList.s_name }
						</c:if>
				   		</b></font>
				        <div class="thumbnail">
				            <div class="caption">
				                <p><h5>��&nbsp;${scheduleList.s_start_date }�� ${scheduleList.s_start_date + 1 }�� ����&nbsp;��</h5></p>
				                <p></p>
				                <p>�ۼ��� : ${scheduleList.m_email }</p>
				                <p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>&nbsp;${scheduleList.s_hit }</p>
				                
				                <p><a href="/gokkiri/schedule/scheduleDetail.go?s_no=${scheduleList.s_no }&s_cate=0" data-toggle="tooltip" title="�󼼺���"><img src="/gokkiri/resources/img/view.png" width="25" /></a></p>
				                
				                <p><h4>${scheduleList.s_detail_memo } ���~</h4></p>
				            </div>
				            <!-- a_img_sav �÷��� s_together �÷������� �ٲ㼭 �ҷ��ȡ��� -->
				            <img src="/gokkiri/resources/area_img/${scheduleList.s_together }" alt="ALT NAME" class="img-responsive"  style="max-width: 100%; height: 100%;" >
				        </div>
					</li>
					
					</c:if>
					</c:forEach>
					</ul>
					</td></tr>
					
					<tr><td>
					</td></tr>
					</table>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">������</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">������</button>
			</div>
		</div>
		</form>
</div>
</div>
 			
			<!-- ���� �������� ���� �� -->

<table width="100%" border="0" align="center">	
		<tr>
			<!-- param.a_cate == 0 �̸� ������ --> 
			<c:if test="${param.a_cate == 0}">
			<td colspan="2" style="text-align:left;">
				<br/><br/><br/>
				<img src="../resources/img/place.png" /> / �� �Խñ� <c:out value="${ totalCount }" />��
				<!-- �˻�� �Է��� ��쿡��(�˻��� �����̸� ���X) -->
				<c:if test="${fn:length(searchKeyword) gt 1 && searchKeyword != ''}">
					<font color="red"> / *[<c:out value="${searchKeyword}" />] ��(��) �˻��� ���</font>
				</c:if>
				<!-- �� -->
			</td>
			</c:if>
			
			<!-- param.a_cate == 1 �̸� ���� -->
			<c:if test="${param.a_cate == 1}">
			<td colspan="2" style="text-align:left;">
				<br/><br/><br/>
				<img src="../resources/img/food.png" /> / �� �Խñ� <c:out value="${ totalCount }" />��
				<!-- �˻�� �Է��� ��쿡��(�˻��� �����̸� ���X) -->
				<c:if test="${fn:length(searchKeyword) gt 1 && searchKeyword != ''}">
					<font color="red"> / *[<c:out value="${searchKeyword}" />] ��(��) �˻��� ���</font>
				</c:if>
				<!-- �� -->
			</td>
			</c:if>

			<td style="text-align:right;">
			<br/><br/><br/>
			<form action="areaList.go">
			<input type="hidden" name="a_cate" value="${param.a_cate }" />
			<input type="hidden" name="keyword" value="${param.keyword }" />
				<div class="row row-centered" >
 				<div class="col-lg-12 col-centered">
				<div class="input-group ">
				<input type="text" name="searchKeyword" class="form-control" placeholder="������ �Է� ���ּ���.">
				<input type="hidden" name="c_no" value="${param.c_no }" />
				<span class="input-group-btn">
        			<button class="btn btn-default" type="submit" >�˻�</button>
				</span>
				</div>
  				</div>
				</div>
			</form>
			</td>
		</tr>

</table>
	
	
	
	
	
<table width="80%" border="0" cellspacing="0" cellpadding="2" align="center" class="table table-hover" >
	
	<thead>
	<tr height="10">
			<th style="text-align:center;">�̹���</th>
			<th style="text-align:center;">����</th>
			<th style="text-align:center;">������ ���� ��</th>
		</tr>
	</thead>
	
	<tbody>
	
	<c:if test="${fn:length(areaList) le 0 }">
		<tr align="center">
			<td colspan="3">��ϵ� �Խù��� �����ϴ�.</td>
		</tr>
	</c:if>
		
	<c:forEach var="areaList" items="${areaList }" varStatus="stat">
		
		<tr height="200">
			<td align="center" width="300">
				<a href="areaDetail.go?a_no=${areaList.a_no }&keyword=${param.keyword}">
				<img src="../resources/area_img/${areaList.a_img_sav }"  class="img-rounded" alt="Cinque Terre" width="250" height="200" 
				onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'"/>
				</a>
			</td>
			
			<td align="left" width="1000">
				<a href="areaDetail.go?a_no=${areaList.a_no }&keyword=${param.keyword}">
					<h2><b>${areaList.a_name }</b></h2>
				</a>
				<br>
				<!-- ���� �̻��̸� ...���� ���̵��� -->
				<c:if test="${fn:length(areaList.a_con) gt 200 }">
					<c:out value="${fn:substring(areaList.a_con, 0, 200) }" />......
				</c:if>
				<c:if test="${fn:length(areaList.a_con) le 200 }">
					${areaList.a_con }
				</c:if>
				<br>
			</td>
			
			<td align="center" width="300"><br/><br/><br/><br/>
				  <font size="3"><b><span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>&nbsp;${areaList.a_count }</b></font>
			</td>
		</tr>
		
	</c:forEach>
	
	<c:if test="${session_m_email == 'admin' }">
		<tr>
			<td colspan="3" align="right">
				<button type="button" class="button" onclick="javascript:location.href='areaWriteForm.go?c_no=${param.c_no}&keyword=${param.keyword }'">�۾���</button>
			</td>
		</tr>
	</c:if>
	</tbody>
</table>

</div>

<br/><br/><br/><br/>
</center>
<div>
    <a href="#" class="jcm-top"><img src="../resources/img/arrow-up.png" style="margin-bottom: 40px;width: 40px;"></a>
</div>
</body>
</html>