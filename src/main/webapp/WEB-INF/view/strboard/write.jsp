<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/str.css" />
<title>write.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#changePage").click(function() {
		$(".openLeftSide").attr("class", "closeLeftSide");
		$('#insertStrumn').submit();
	});
});
</script>
</head>
<body>
<form name="strumnForm" action="insertStrumn.str" id="insertStrumn">
<div class="openLeftSide">
<div class="menuStyle">
	<label id="strtitle">맵이름</label>
		<input type="text" name="strtitle" id="strtitle" /><br>
	<label id="strcont">맵설명</label>
		<textarea rows="10" cols="30" name="strcont" id="strcont"></textarea><br>
	<label id="boardid">게시판 선택</label>
		<select name="boardid" id="boardid">
			<c:forEach items="${boardList}" var="bId">
				<option value="${bId.boardid}">${bId.boardtitle}</option>
			</c:forEach>
		</select><br>
</div>
</div>
<br><br>
<div class="openLeftSide">
	<input type="button" id="changePage" value="작성완료"/>
</div>
</form>
</body>
</html>