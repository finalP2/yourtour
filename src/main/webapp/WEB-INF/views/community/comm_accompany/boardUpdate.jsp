<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/community/include/include-header.jspf" %>


<!-- summernote start -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="<c:url value='/summernote/summernote-bs4.css'/>" rel="stylesheet">
<!-- summernote end -->



</head>
<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>
						${map.IDX }
						<input type="hidden" id="IDX" name="IDX" value="${map.IDX }">
					</td>
					<th scope="row">조회수</th>
					<td>${map.HITCOUNT }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.WRITER }</td>
					<th scope="row">작성시간</th>
					<td>${map.WRITEDATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="SUBJECT" name="SUBJECT" class="wdp_90" value="${map.SUBJECT }"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" id="summernote" name="CONTENT">${map.CONTENT }</textarea><br />
						테마: <input type="text" name='THEME' value='${map.THEME }'> 테마는 콤마로 구분해주세요<br />
							<input type="hidden" name='oriTHEME' value='${map.THEME }' />
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<br/><br/>
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	
	<%@ include file="/WEB-INF/views/community/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#summernote').summernote({
				  height: 300,				// set editor height
				  minHeight: null,			// set minimum height of editor
				  maxHeight: null,			// set maximum height of editor
				  focus: true,				// set focus to editable area after initializing summernote
				  lang: 'ko-KR',			// default: 'en-US'
				  callbacks: {
					  onImageUpload: function(files){
										  sendFile(files[0]);
									  }
				  }
				});
			
			function sendFile(file){
				data = new FormData();
				data.append("file", file);
				$.ajax({
					url:			'/yourtour/common/GetTempFileUrl.go',
					data:			data,
					cache:			false,
					type:			"POST",
					contentType:	false,
					processData:	false,
					success:		function(url){
										$('#summernote').summernote('insertImage', url);
									}
				});
			}
			
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
			
			$("a[name^='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/comm/accompany/openBoardList.go' />");
			comSubmit.submit();
		}
		
		function fn_updateBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/comm/accompany/updateBoard.go' />");
			comSubmit.submit();
		}
		
		function fn_deleteBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/comm/accompany/deleteBoard.go' />");
			comSubmit.addParam("IDX", $("#IDX").val());
			comSubmit.submit();
			
		}
		

	</script>

<!-- summernote start -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="<c:url value='/summernote/summernote-bs4.js'/>"></script>
<!-- summernote end -->

</body>
</html>