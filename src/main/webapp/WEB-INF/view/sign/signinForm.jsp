<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
</head>
<body>
<form action="signinPro.str" method="post">
	<label id="id">아이디</label><input type="text" id="id" name="memid"/><br>
	<label id="pw">비밀번호</label><input type="password" id="pw" name="mempw"/>
	<input type="submit" value="로그인">
</form>
</body>
</html>