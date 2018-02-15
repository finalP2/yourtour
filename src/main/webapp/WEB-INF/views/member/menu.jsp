<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<a href="/yourtour/member/loginpage.go">로그인</a>
<c:choose>
    <c:when test="${session_m_email == null}">
        <a href="/yourtour/member/loginpage.go">로그인안됨</a>
    </c:when>
    <c:otherwise>
        ${session_m_email}님이 로그인중입니다.
        <a href="/yourtour/member/logout.go">로그아웃</a>
    </c:otherwise>
</c:choose>
    
<hr>