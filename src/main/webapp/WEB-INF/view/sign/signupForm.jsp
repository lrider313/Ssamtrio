<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signupForm.jsp</title>
<script>
$(document).ready(function() {
	$(".changePage").click(function() {
		$(".openLeftSide").attr("class", "closeLeftSide");
		$(".openRightSide").attr("class", "closeRightSide");
		$('#signupPro').submit();
	});
});
</script>
</head>
<body>
<form action="/Ssamtrio/sign/signupPro.str" id="signupPro">
<div class="openLeftSide">
<div class="menuStyle">
	<label id="memid"><span>아이디</span><input id="memid" type="text" name="memid"/></label><br/>
	<label id="mempw"><span>비밀번호</span><input id="mempw" type="password" name="mempw"/></label><br/>
	<label id="memname"><span>이름</span><input id="memname" type="text" name="memname"/></label><br/>
	<label id="memnick"><span>닉네임</span><input id="memnick" type="text" name="memnick"/></label><br/>
	<label id="mememail"><span>이메일</span><input id="mememail" type="text" name="mememail"/></label><br/>
	<label id="memphone"><span>전화번호</span><input id="memphone" type="text" name="memphone"/></label><br/>
	<label id="memaddr"><span>주소</span><input id="memaddr" type="text" name="memaddr"/></label><br/>
</div>
</div>
<br/>
<menu:leftMenuButton02 uri="#" value="가입하기"/>
</form>
</body>
</html>