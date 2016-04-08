<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signupForm.jsp</title>
</head>
<body>
<form action="/Ssamtrio/sign/signupPro.str">
	<label id="memid">아이디</label>
		<input id="memid" type="text" name="memid"/><br/>
	<label id="mempw">비밀번호</label>
		<input id="mempw" type="password" name="mempw"/><br/>
	<label id="memname">이름</label>
		<input id="memname" type="text" name="memname"/><br/>
	<label id="memnick">닉네임</label>
		<input id="memnick" type="text" name="memnick"/><br/>
	<label id="mememail">이메일</label>
		<input id="mememail" type="text" name="mememail"/><br/>
	<label id="memphone">전화번호</label>
		<input id="memphone" type="text" name="memphone"/><br/>
	<label id="memaddr">주소</label>
		<input id="memaddr" type="text" name="memaddr"/><br/><br/>
	<input type="submit" value="가입하기" />
</form>
</body>
</html>