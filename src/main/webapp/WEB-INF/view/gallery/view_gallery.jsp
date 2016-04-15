<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

.a {
	width: 1000px;
}

span {
	margin-left: 500px;
}
</style>
<meta charset="UTF-8">
<title>wtr</title>
</head>
<body>
	<h1 align="center">자유게시판(thumbnail)</h1>
	<p align="right">
	</p>
	<table>
		<tr>
			<td>글번호</td>
			<td>제목에 링크달고 view 하나 더 생성해서 세부내용들 출력 </td>
			<td>작성자</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.fbid}</td>
			<td>${dto.fbtitle}</td>
			<td>${dto.memid}</td>
			<td>${dto.fbcount}</td>
		</tr>
		</c:forEach>
	</table>
	<p align="center">
		<input type="text">
		<button>검색</button>
	</p>
	<span><input type="button" value="글쓰기" class="input_button"
		onclick="location='write_gallery.str'"></span>
</body>
</html>