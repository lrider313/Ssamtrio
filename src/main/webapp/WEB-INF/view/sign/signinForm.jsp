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
	var idPwPattern = /^[a-zA-Z0-9_]{4,15}$/;
	$("#id").focus();
	$(".changePage").click(function() {
		if(!idPwPattern.test($('#id').val())) {
			alert("아이디의 범위는 4~15자이며, 숫자, 영문, '_'만 입력가능합니다.");
			$('#id').val("").focus();
			return false;
		} else if(!idPwPattern.test($('#pw').val())) {
			alert("비밀번호의 범위는 4~15자이며, 숫자, 영문, '_'만 입력가능합니다.");
			$('#pw').val("").focus();
			return false;
		}
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
		<label for="id"><span>아이디</span><input type="text" id="id" name="memid"/></label><br>
		<label for="pw"><span>비밀번호</span><input type="password" id="pw" name="mempw"/></label>
	</div>
</div>
<br>
<menu:leftMenuButton02 uri="javascript:void(0)" value="로그인"/>
</form>
</body>
</html>