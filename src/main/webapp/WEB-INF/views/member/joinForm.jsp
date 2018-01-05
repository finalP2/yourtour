<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
    <center>
        <h1>회원가입 페이지</h1>
 
        <form action="join.go">
            <table>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="email" ></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pw"></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="pw_check" ></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" ></td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td><input type="text" name="nickname" ></td>
                </tr>
 
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="가입하기"><input type="reset" value="다시작성"></td>
                </tr>
            </table>
 
        </form>
    </center>
</body>
</html>