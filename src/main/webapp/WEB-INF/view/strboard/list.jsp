<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<script>
$(document).ready(function() {
	$(".changePage").click(function() {
		$(".openLeftSide").attr("class", "closeLeftSide");
		$(".openRightSide").attr("class", "closeRightSide");
	});
});
</script>
</head>
<body>
<div class="openLeftSide">
	<table class="menuStyle">
		<c:forEach items="${list}" var="l">
		<tr>
			<td>${l.strtitle}</td>
			<td>${l.strcont}</td>
		</tr>
		</c:forEach>
	</table>
	<br>
</div>
<br><br>
<div class="openLeftSide">
	<menu:leftMenuButton01 uri="write.str" value="맵 카테고리 추가"/>
</div>
</body>
</html>