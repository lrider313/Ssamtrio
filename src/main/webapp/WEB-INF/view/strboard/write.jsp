<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>
<script>
$(document).ready(function() {
	$(".changePage").click(function() {
		$(".openLeftSide").attr("class", "closeLeftSide");
		$(".openRightSide").attr("class", "closeRightSide");
		$('#insertStrumn').submit();
	});
});
</script>
</head>
<body>
<form action="insertStrumn.str" id="insertStrumn">
<div class="openLeftSide">
<div class="menuStyle">
	<label for="strtitle"><span>맵이름</span></label><input type="text" name="strtitle" id="strtitle" /><br>
	<label for="strcont"><span>맵설명</span></label><textarea rows="10" cols="21" name="strcont" id="strcont"></textarea><br>
	<label for="boardid"><span>게시판 선택</span></label>
		<select name="boardid" id="boardid">
			<c:forEach items="${boardList}" var="bId">
				<option value="${bId.boardid}">${bId.boardtitle}</option>
			</c:forEach>
		</select><br>
</div>
</div>
<br><br>
<menu:leftMenuButton01 uri="#" value="작성 완료"/>
</form>
</body>
</html>