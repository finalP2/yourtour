<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
</head>
<body>
    <center>
        <h1>회원탈퇴 페이지</h1>
 
        <form action=memberDelete.go>
            <table>
                <tr>
                    <td>이메일</td>
                    <td>${session_m_email}</td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pw"></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="회원탈퇴">
                    
                </tr>
            </table>
 
        </form>
    </center>
</body>
</html>