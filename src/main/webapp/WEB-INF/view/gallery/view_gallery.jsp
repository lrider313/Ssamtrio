<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<input type="button" value="장바구니" class="input_button"
		onclick="location='/Ssamtrio/cart/view_cart'">
	<h1 align="center">자유게시판(thumbnail)</h1>
	<p align="right">
		<button type="button"
			onclick="location='/Ssamtrio/gallery/view_gallery'">자유게시판</button>
		<button type="button"
			onclick="location='/Ssamtrio/gallery/view_igallery'">이미지게시판</button>
	</p>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>추천</td>
			<td>비추천</td>
			<td>날짜</td>
		</tr>
		<c:foreach items="${list}" var="dto">
		</c:foreach>
	</table>
	<p align="center">
		<input type="text">
		<button>검색</button>
	</p>
	<span><input type="button" value="글쓰기" class="input_button"
		onclick="location='write_gallery'"></span>
</body>
</html>