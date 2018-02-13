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
							<form name="searchfrm1">
							<table width="100%">
								<tr>
									<td>
									<a href="javascript:fn_selectBoardList(1)">기본 리스트</a>
									<c:if test="${email != '' && email ne null}">
										&nbsp;&nbsp;||&nbsp;&nbsp;
										<a href="javascript:fn_selectMyArticle(1)">내가 쓴 글</a>
										&nbsp;&nbsp;||&nbsp;&nbsp;
										<a href="javascript:fn_selectMyZzimList(1)">내가 찜한 글</a>
									</c:if>
									&nbsp;&nbsp;||&nbsp;&nbsp;
									<a href="javascript:fn_selectBoardList(1)">찜 인기순</a>
									</td>
									<td align="right">
										<select name="searchType" id="searchType"
										onchange="javascript:$('#searchType2').val($('#searchType option:selected').val()).attr('selected', 'selected');">
											<option value="SUBJECT">제목</option>
											<option value="CONTENT">내용</option>
											<option value="TAG">테마</option>
										</select>
										<input type="text" id="searchKeyword" name="searchKeyword"
										onchange="javascript:$('#searchKeyword2').val($('#searchKeyword').val());">
										<input type="button" value="검색" onclick="javascript:fn_selectBoardList(1)">
									</td>
								</tr>
							</table>
							</form>
							<table class="board_list">
								<tbody>
									
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
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/><br/>
	<form name="searchfrm2">
		<table width="100%">
			<tr>
				<td align="center">
					<select name="searchType2" id="searchType2" 
					onchange="javascript:$('#searchType').val($('#searchType2 option:selected').val()).attr('selected', 'selected');">					
						<option value="SUBJECT">제목</option>
						<option value="CONTENT">내용</option>
						<option value="TAG">테마</option>
					</select>
					<input type="text" name="searchKeyword2" id="searchKeyword2" 
					onchange="javascript:$('#searchKeyword').val($('#searchKeyword2').val());">
					<input type="button" value="검색" onclick="javascript:fn_selectBoardList(1)">
				</td>
			</tr>
		</table>
		</form>
	<br/>
	<c:if test="${email != '' && email ne null}">
		<a href="#this" class="btn" id="write">글쓰기</a>
 	</c:if>
	
	<%@ include file="/WEB-INF/views/community/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectBoardList(1);
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});	
			
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});
		
		
		function fn_openBoardWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/comm/accompany/openBoardWrite.go' />");
			comSubmit.submit();
		}
		
		function fn_openBoardDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/comm/accompany/openBoardDetail.go' />");
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}
		
		function fn_selectBoardList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/comm/accompany/selectBoardList.go' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.addParam("IDX_FE", $("#IDX_FE").val());
			if($("#searchKeyword").val()){
				comAjax.addParam("searchType", $("#searchType").val());
				comAjax.addParam("searchKeyword", $("#searchKeyword").val());
			}			
			comAjax.ajax();
		}
		
		function fn_selectMyArticle(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/comm/accompany/selectBoardList.go' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.addParam("IDX_FE", $("#IDX_FE").val());
			comAjax.addParam("MY_ARTICLE", 1);
			comAjax.ajax();
		}
		
		function fn_selectMyZzimList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/comm/accompany/selectBoardList.go' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 10);
			comAjax.addParam("IDX_FE", $("#IDX_FE").val());
			comAjax.addParam("MY_ZZIM", 1);
			comAjax.ajax();
		}
		
		function fn_selectBoardListCallback(data){
			var total = data.TOTAL;
			var body = $(".board_list>tbody");
			body.empty();
			if(total == 0){
				var str = "<tr>" + 
								"<td colspan='4'>조회된 결과가 없습니다.</td>" + 
							"</tr>";
				body.append(str);
			}
			else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectBoardList",
					recordCount : 1
				};
				gfn_renderPaging(params);
				
				var str = "";
								
				$.each(data.list, function(key, value){
					str +="<tr>";	
					if(value.ZZIM_STATE == 0){
						str += "<td class='narrow' style='font-weight:bold; color:red;'>모집중</td>";
					}else {
						str += "<td class='narrow' style='font-weight:bold; color:black;'>모집종료</td>";
					}				
					str +=		"<td class='narrow'>"+
									"글번호 :"+
								"</td>"+
								"<td class='narrow'>"+
									value.IDX+
								"</td>"+
								"<td class='narrow'>"+
									"작성자 :"+
								"</td>"+
								"<td class='narrow'>"+
									value.WRITER+
								"</td>"+
							"</tr>"+
							"<tr>"+
								"<td rowspan='2' class='narrow' width='90'>"+
									"<a href='#this' name='title'><img src='/yourtour/resources/mem_img/"+value.MEMBER_IMG+"' width='80' height='80'/></a>"+
									"<input type='hidden' id='IDX' value=" + value.IDX + ">" + 
								"</td>"+
								"<td class='narrow'>"+
									"등록일 :"+
								"</td>"+
								"<td class='narrow'>"+
									value.WRITEDATE+
								"</td>"+
								"<td class='narrow'>"+
									"테마 :"+
								"</td>"+
								"<td class='narrow'>"+
									value.THEME+
								"</td>"+
							"</tr>"+
							"<tr>"+
								"<td class='narrow'>"+
									"글제목 :"+
								"</td>"+
								"<td colspan='3' class='narrow' height='60' style='text-align:left;'>"+
								"<a href='#this' name='title'><STRONG>" + value.SUBJECT;
					if(value.CCOUNT*1 > 0){
						str += " (댓글: "+ value.CCOUNT +")";
					}	
					if(value.ZCOUNT*1 > 0){
						str += " (찜: "+ value.ZCOUNT +")";
					}	
					str +=		"</STRONG></a>" +
								"<input type='hidden' id='IDX' value=" + value.IDX + ">" +
								"</td>"+
							"</tr>"+
							"<tr>"+
								"<td colspan='5' height='2' style='padding:0px;background-color:gray;' />"+
							"</tr>";


				});
				body.append(str);
				
				$("a[name='title']").on("click", function(e){     //제목을 클릭하면 상세보기 함수 호출
					e.preventDefault();
					fn_openBoardDetail($(this));
				});
			}
		}
	</script>	
</body>
</html>