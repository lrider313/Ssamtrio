<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<form action="freeBoardWrite.str" method="post">
    <div class="table-responsive openLeftSide menuStyle" style="width:714px; overflow-x:hidden;" >
	<table class="table-hover">
		<tr>
			<td width="73">번호</td>
			<td width="379" style="text-align: inherit;">제목</td>
			<td width="73">글쓴이</td>
			<td width="73">등록일</td>
			<td width="163">조회</td>
			<td width="163">추천</td>
		</tr>
		<tr>
		<td>번호쿼리가 미리들어가있음</td>
			<td>1234</td>
			<td>1234</td>
			<td>1234</td>
			<td>1234</td>
			<td>1234</td>
		</tr>
	</table>
	<menu:rightMenuButton01 uri="freeBoardWrite.str" value="글쓰기"/>
	</div>
</form>
</body>

</html>
