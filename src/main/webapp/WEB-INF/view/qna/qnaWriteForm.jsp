<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
<script type="text/javascript">
	function qnaList() {
		if (confirm("����Ʈ�� �̵��Ͻðڽ��ϱ�?") == true) {
			location.href = 'qnaList.go?a_no=${param.a_no}';
		} else {
			return;
		}
	}
</script>
</head>
<body>


<table width="50%" align="center">
<tr><td>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">

			<div class="page-header">
				
				<div class="panel panel-default" style="text-align:center;">
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
				</div>
 			</div>
		</div>
	</div>
</div>
</td></tr>
</table>



<table width="50%" align="center">
<tr><td>
	<div id="wrapper">
		<form:form commandName="qnaModel" action="qnaWrite.go"
			enctype="multipart/form-data" method="post">
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<br />Q&A ���
						</h3>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">

							<thead>
								<tr class="danger">
									<th width="15%" align="center">������</th>
									<td colspan=5><form:input path="q_sub" theme="simple" /> <font
										color="red"><form:errors path="q_sub" /></font></td>
								</tr>
							</thead>

							<tbody>
								<tr>
									<th>�ۼ���¥</th>
									<td><fmt:formatDate value="${list.q_date}"
											pattern="yyyy.MM.dd, hh:mm" /> <c:set var="now"
											value="<%=new java.util.Date()%>" /> <fmt:formatDate
											value="${now}" type="both" dateStyle="short"
											timeStyle="short" /></td>



							<form:input type="hidden" path="m_email"
										value="${session_m_email }" />
									<th>����� ID</th>
									<td align="left"><strong>${session_m_email}</strong></td> 
								</tr>
								<tr>
									<th colspan=6>�۳���<font color="red" align="center"><form:errors
												path="q_con" /></font></th>
								</tr>
								<tr>
									<td colspan=6 height=300 style="padding: 0px !important;">

										<form:textarea path="q_con" theme="simple"
											style="padding:3px; margin:0px; width: 100%; height: 100%;" />


									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-lg-12">
						<div class="menu-wrap">
							<input type="hidden" name="a_no" value="${param.a_no }" />
							<span> <input type="button" value="����ϱ�"
								onclick="this.form.submit();"
								style="font-size: 14px; padding: 5px; height: 36px; vertical-align: middle;" />
							</span> <span onclick="history.go(-1);"> <input type="button"
								value="���" onclick="qnaList()"
								style="font-size: 14px; padding: 5px; margin-left: 5px; height: 36px; vertical-align: middle;" />
							</span>
						</div>
					</div>
				</div>
			</div>
			<br />
			<br />
			<br />
			<br />
		</form:form>
	</div>
</td></tr>
</table>
</body>
</html>