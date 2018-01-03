<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<table width="50%" align="center">
<tr><td>
<div id="wrapper">

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">

			<div class="page-header">
				
<%-- 				<div class="panel panel-default" style="text-align:center;">
					<div class="panel-heading">
						<font size="4">
							<a href="/gokkiri/area/areaDetail.go?a_no=${param.a_no }"><b>���� ���� : ${areaModel.a_name }</b></a>
						</font>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-4">
								<img src="/gokkiri/resources/area_img/${main_img }" width="200" height="120">
							</div>
							<div class="col-sm-8" style="text-align:left;">
								<font size="2">�� �ּ� : ${areaModel.a_addr }<br/>
								�� ���� ��� : ${areaModel.a_way }<hr>
								��&nbsp;
								<!-- ���� �̻��̸� ...���� ���̵��� -->
								<c:if test="${fn:length(areaModel.a_con) gt 100 }">
									<c:out value="${fn:substring(areaModel.a_con, 0, 100) }" />......
								</c:if>
								<c:if test="${fn:length(areaModel.a_con) le 100 }">
									${areaModel.a_con }
								</c:if>
								</font>
							</div>
						</div>
					</div>
				</div> --%>
				
				<br/>
				<strong><font size="6px">Q&A</font></strong>&nbsp;&nbsp; 
				<font color="red">����&�亯 �Խ����Դϴ�.</font>
				<div class="menu-wrap" style="text-align:right;">
				<br/><br/>
			</div>
		</div>
	</div>

</div>


<c:forEach var="cityqnaList" items="${cityqnaList }" varStatus="stat">
														
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-primary" style="text-align:center;">
			<div class="panel-heading">
				<a href="qnaView.go?q_no=${cityqnaList.q_no }&a_no=${cityqnaList.a_no}">
					<font size="4" color="#ffffff">
					<b><span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>&nbsp;&nbsp;
					${cityqnaList.q_sub}</b></font>
				</a>
			</div>
			<div class="panel-body">
				�ۼ��� : ${cityqnaList.m_email}&nbsp;&nbsp;|&nbsp;&nbsp;
				�ۼ��� : <fmt:formatDate value="${cityqnaList.q_date}" pattern="YYYY-MM-dd, hh:mm" />&nbsp;&nbsp;|&nbsp;&nbsp;
				������ : ${cityqnaList.a_name}<hr/>
				${cityqnaList.q_con}
			</div>
		</div>
	</div>
</div>
</c:forEach>


<!-- DB�� �Խù��� ������ �����ִ� �� -->
<c:if test="${fn:length(cityqnaList) le 0}">
	<br />
	<center>��ϵ� �Խù��� �����ϴ�</center>
	<br />
</c:if>

</div>
</div>
</td>
</tr>
</table>

<br/><br/>
</body>

</html>