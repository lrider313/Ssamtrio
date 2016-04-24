<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo.jsp</title>
</head>
<body>
<div class="menuStyle">
<div class="openRightSide">
<div class="hisDesc"><span class="glyphicon glyphicon-calendar"></span>다운로드 히스토리</div>
<div class="">
<table>
<thead>
	<tr>
		<td>다운날짜</td>
		<td>맵아이디</td>
	</tr>
</thead>
<tbody>
<c:forEach items="${historyList }" var="hl">
<tr>
	<td>${hl.hisdate }</td>
	<td>${hl.mapid }</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</div>
</body>
</html>