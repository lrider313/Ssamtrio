<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
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
	<div class="menuStyle">
		<a href="write.str" class="changePage">글작성</a>
	</div>
</div>
</body>
</html>