<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/community/include/include-header.jspf" %>
</head>
<body>
	<table>
		<!-- 상단 50, 우측 80 비우기 -->
		<tr><td height="50"/></tr>
		<tr>
			<td style="padding-left:100px"><h2>동행 찾기</h2></td>
		</tr>
	</table>
	<table width="100%" border="0">
		<tr>
			<td>
				<table width="100%" border="0">
					<tr>
						<td width="10%"></td>
						<td width="80%">
							<table class="board_list">
								<tbody>
<!-- ============================================================================= -->
									<tr>
										<td class="narrow" style="font-weight:bold; color:red;">
											모집중
										</td>
										<td class="narrow">
											글번호 :
										</td>
										<td class="narrow">
											123
										</td>
										<td class="narrow">
											작성자 :
										</td>
										<td class="narrow">
											박동민
										</td>
									</tr>
									<tr>
										<td rowspan="2" class="narrow">
											<img src="/yourtour/resources/mem_img/images.png" width="80" height="80"/>
										</td>
										<td class="narrow">
											등록일 :
										</td>
										<td class="narrow">
											2018-01-01
										</td>
										<td class="narrow">
											테마 :
										</td>
										<td class="narrow">
											태그기능 이용
										</td>
									</tr>
									<tr>
										<td class="narrow">
											글제목 :
										</td>
										<td colspan="3" class="narrow" height="60">
											글제목글제목글제목글제목글제목글제목글제목글제목글제목글제목
										</td>
									</tr>
									<tr>
										<td colspan="5" height="2" style="padding:0px;background-color:gray;" />
									</tr>
<!-- ============================================================================= -->
									<tr>
										<td class="narrow" style="font-weight:bold; color:red;">
											모집중
										</td>
										<td class="narrow">
											글번호 :
										</td>
										<td class="narrow">
											123
										</td>
										<td class="narrow">
											작성자 :
										</td>
										<td class="narrow">
											박동민
										</td>
									</tr>
									<tr>
										<td rowspan="2" class="narrow">
											<img src="/yourtour/resources/mem_img/images.png" width="80"/>
										</td>
										<td class="narrow">
											등록일 :
										</td>
										<td class="narrow">
											2018-01-01
										</td>
										<td class="narrow">
											테마 :
										</td>
										<td class="narrow">
											태그기능 이용
										</td>
									</tr>
									<tr>
										<td class="narrow">
											글제목 :
										</td>
										<td colspan="3" class="narrow" height="60">
											글제목글제목글제목글제목글제목글제목글제목글제목글제목글제목
										</td>
									</tr>
									<tr>
										<td colspan="5" height="2" style="padding:0px;background-color:gray;" />
									</tr>
<!-- ============================================================================= -->
								</tbody>
							</table>
						</td>
						<td width="10%"></td>
					</tr>
				</table>
			</td>
			<td width="80">
		</tr>
	</table>
	
	<div id="PAGE_NAVI" align="center"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	<c:if test="${email != '' && email ne null}">
		<a href="#this" class="btn" id="write">글쓰기</a>
 	</c:if>
	
	<%@ include file="/WEB-INF/views/community/include/include-body.jspf" %>

</body>
</html>