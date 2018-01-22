<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table class="table">
   <tr>
      <td>
         ${sch.NO } -
      </td>
       <td>
          ${sch.EMAIL}
      </td>
      <td>
         ${sch.NAME}
         </td>
        <td>
           	 좋아요 = ${sch.LIKE1}
         </td>
   </tr>
   <tr>
         <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        	좋아요는 한 게시물에 한번만 할 수 있습니다.
                    </div>
          </c:if>
   
   <input type="button" value="좋아요" onclick="location.href='http://localhost:8080/yourtour/schedule/scheduleLike.go?no=${sch.NO}'"/>
  
   </tr>
</table>
 <th scop="row">댓글</th>
   <td colspan=3>
  <form action="scheduleCommentWrite.go" method="post">
		<table>
			<tr>
				<input type="hidden" name="no" value="${sch.NO}"/>
				<input type="text" id="content" name="content" class="wap_90" style=" width:500px;">
			</tr>
			<tr>
				<td colspan="2" align="right"><input name="submit"
					type="submit" class="btn btn-outline-dark" value="작성완료" class="inputb" /></td>
			</tr>
		</table>
	</form>
   <c:forEach var="clist" items="${clist }" varStatus="stat">
            <tr>
               <td >
               	${clist.EMAIL }-${clist.CONTENT }
               	<c:if test="${session_m_email==clist.EMAIL }">
               	<input type="button" value="삭제하기" onclick="location.href='http://localhost:8080/yourtour/schedule/commentDelete.go?c_no=${clist.NO}&no=${sch.NO}'"/>
              	<br/>
              	</c:if>
               </td>
            </tr>
        </c:forEach>
   
   </td>
</body>
</html>