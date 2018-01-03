<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>

<!-- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.contents-wrap {
	margin: 30px 0 0 0;
	min-height: 500px;
}

.contents {
	margin: 60px 0 0 0;
}

.recode-wrap {
	text-align: right;
	color: #888;
}

.hit-wrap {
	color: #888;
	margin: 10px 0;
}

.viewForm {
	margin: 20px 0 0 0;
}
</style>
<title>Q&A</title>
<script type="text/javascript">
	/* var onComment = function() {
		var form = $('.commentForm')[0];
		form.action = 'qnacommWrite.go';
		if (form.q_co_con.value == "") {
			alert("������ �Է����ּ���");
		} else {
			form.submit();
		}
		//�ѱ�� �κ�
	} */
	function qnaDelete() {
		if (confirm("���� �Ͻðڽ��ϱ�?") == true) {
			location.href = 'qnaDelete.go?q_no=${qnAModel.q_no}';
		} else {
			return;
		}
	}

	function qnaModify() {
		if (confirm("���� �Ͻðڽ��ϱ�?") == true) {
			location.href = 'qnaModify.go?q_no=${qnAModel.q_no}&a_no=${param.a_no}';
		} else {
			return;
		}
	}
	function qnacommDelete(num) {
		if (confirm("����� ���� �Ͻðڽ��ϱ�?") == true) {
			location.href = 'qnacommDelete.go?q_co_no=' + num
					+ '&q_no=${qnAModel.q_no}';
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
							<a href="/gokkiri/area/areaDetail.go?a_no=${param.a_no }&keyword=${fn:substring(areaModel.a_addr,0,2)}"><b>���� ���� : ${areaModel.a_name }</b></a>
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
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><b>Q&A �󼼺���</b></h3>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="dataTable_wrapper">
							<table class="table table-striped table-bordered table-hover" id="dataTables-example">
								<tr>
									<td align="center" class="tg-yw4l" colspan="2" height="50">
										<h2>
											<b>${qnAModel.q_sub}</b>
										</h2>
									</td>
								</tr>

								<tr>
									<td align="center" class="tg-yw4l" colspan="2" height="50">${qnAModel.q_con}</td>
								</tr>
								<tr>
									<td class="tg-yw4l" height="30">${qnAModel.m_email}</td>
									<td class="tg-yw4l" height="30"><fmt:formatDate
											value="${qnAModel.q_date}" pattern="YYYY-MM-dd, hh:mm" /></td>

								</tr>

							</table>
						</div>
					</div>
				</div>


				&nbsp;&nbsp;
				<input type="button" onclick="location.href='qnaList.go?a_no=${param.a_no}'" value="���" class="btn btn-default" />
				<!-- �ۼ��� ���̵�� �α����� ���̵� ���ų� �α����� ���̵� admin�϶��� ������ ���� ��ư�� ������-->
				<c:if test="${session_m_email == qnAModel.m_email }"> 
				<input type="button" onclick="qnaModify()" value="����"
					class="btn btn-primary" /> <input type="button"
					onclick="qnaDelete()" value="����" class="btn btn-primary" /> 
					</c:if><br />
				<br /> <br /> <br />
				
            <form:form commandName="qnAModel" action="qnacommWrite.go" enctype="multipart/form-data"   method="post">
				<!-- ��۾��� â -->
				<div class="inner">
					<form class="commentForm" method="post" onsubmit="return validation();">
					
						<input type="hidden" name="q_no" value="${qnAModel.q_no}" />
						<input type="hidden" name="m_email" value="${session_m_email}" />
						<input type="hidden" name="a_no" value="${param.a_no }" />

						<div class="reply_form">

							<div class="reply_write">
								<div class="textarea_grp" >
									<!-- �α��ξ����� �� �����ִ� ��� ��û ���� -->
									<br />
								 <c:if test="${session_m_email == null}"> 
										&nbsp;&nbsp;<input type="text"
										style="align: center; margin: 10px; width: 950px; height: 55px;"
										value="�α��� �Ŀ�  ��� �ۼ��� �����մϴ�." readonly="readonly" /> -
										</c:if>
									<!-- ��� ���� â -->
									 <c:if test="${session_m_email != null}"> 
									<!-- ���� �� ���� -->
									<textarea name="q_co_con" style="width: 885px; height: 55px;"
										onKeyUp="javascript:fnChkByte(this,'200')"></textarea>
									<input type="button" class="btn1 btn-primary1" value="�Է�"
										onclick="this.form.submit()"/> 
										</c:if>				
									<div style="margin-bottom: 10px;">
										<br />&nbsp;&nbsp;&nbsp;
									</div>


								</div>
							</div>
							</div>
							</form>
					</form:form>


						
								<c:if test="${fn:length(qnacommList) eq 0}">
									<br />
									<center>��ϵ� ����� �����ϴ�</center>
									<br />
								</c:if>
								<!-- ��� ���ʷ� �����ִ� â -->
								<c:forEach var="qnacommList" items="${qnacommList }"
									varStatus="stat">
									<div class="reply_view">
										<div class="reply_tit">
											<p class="tit">
												<strong>${qnacommList.m_email }</strong>��
												<fmt:formatDate value="${qnacommList.q_co_date}"
													pattern="yy.MM.dd"></fmt:formatDate>
												<span class="ip"></span>
											</p>
							<c:if test="${session_m_email == qnacommList.m_email || session_m_email == 'admin'}"> 
							<!-- ������ Ȥ�� �۾��̴� ��� �������� -->
								<a href="qnacommDelete.go?q_co_no=${qnacommList.q_co_no}&q_no=${qnAModel.q_no} &m_email=${qnacommList.m_email} >">
								<input type="button" onclick="qnacommDelete(${qnacommList.q_co_no})"  value="����" class="btn btnC_01 btnP_02"/>
								</a>
							</c:if>
						</div>
						<div class="reply_cts">
							<p>${qnacommList.q_co_con}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</form>

	</div>



		</div>
	</div>
</div>
	
</td></tr>
</table>
</body>
</html>