<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
<script>
$(document).ready(function() {
	$(".changePage").click(function() {
		$(".openLeftSide").attr("class", "closeLeftSide");
		$(".openRightSide").attr("class", "closeRightSide");
		$('#signinPro').submit();
	});
});
</script>
</head>
<body>
<form action="signinPro.str" method="post" id="signinPro">
<div class="openLeftSide">
	<div class="menuStyle">
		<label id="id"><span>아이디</span><input type="text" id="id" name="memid"/></label><br>
		<label id="pw"><span>비밀번호</span><input type="password" id="pw" name="mempw"/></label>
	</div>
</div>
<br>
<menu:leftMenuButton02 uri="#" value="로그인"/>
</form>
</body>
</html>