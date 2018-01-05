<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div id="blog-container">
	<table width="100%" border="0">
		<tr> <!-- 타이틀 텍스트 넣기 -->
			<td width="10%"/>
			<td align="center"><h1>아이디 찾기</h1></td>
			<td width="10%"/>
			<td align="center"><h1>비밀번호 찾기</h1></td>
			<td width="10%"/>
		</tr>
		<tr> <!-- 폼 테이블 넣기 -->
			<td width="10%"/>
			<td>
				<form method="post" action="emailFind.go" name="findEmail" >
					<table width="100%" height="200" border="0" class="inputForm" style="border:3px solid black;">
						<tr>
							<td align="right" width="100">이름&nbsp;&nbsp;&nbsp;</td>
							<td><input type="text" style="width: 100%; height:30px;" name="name"></td>
							<td width="15"></td>
						</tr>
						<tr align="center">
							<td colspan="3"><input type="submit" value="이메일찾기" />	</td>
						</tr>
					</table>
				</form>
			</td>
			<td width="10%"/>
			<td>
				<form method="post" action="pwFind.go" >
					<table width="100%" height="200" border="0" class="inputForm" style="border:3px solid black;">
						<tr>
							<td align="right" width="100">이메일&nbsp;&nbsp;&nbsp;</td>
							<td><input type="text" style="width: 100%; height:30px;" name="email"></td>
							<td width="15"></td>
						</tr>
						<tr>
							<td align="right" width="100">성  명&nbsp;&nbsp;&nbsp;</td>
							<td><input type="text" style="width: 100%; height:30px;" name="name"></td>
							<td width="15"></td>
						</tr>
						<tr align="center">
							<td colspan="3"><input type="submit" value="비밀번호찾기" class="btn-custom" ></td>
						</tr>
					</table>
				</form>
			</td>
			<td width="10%"/>
		</tr>
		<tr>
			<td colspan="5" height="200"/>
		</tr>
	</table>
</div>
