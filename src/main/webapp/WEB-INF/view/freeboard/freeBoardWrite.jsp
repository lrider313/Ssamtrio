<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>freeBoardWrite.jsp</title>
</head>
<body>
<form method="post" action="freeSelectForm.str" >
	<div  class="openLeftSide menuStyle" style="display: inline-block;">
		<table >
			<tr>
				<th>ID </th>
				<td><input type="text" name="memid"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" style="width: 420px;" name="cstitle"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="50" name="cscont"></textarea></td>
			</tr>
			<tr>
			<td colspan="2" style="text-align: right"><button type="submit">문의하기</button> 
			<button type="reset">취소하기</button></td>
			</tr>
		</table>
	</div>
	</form>
</body>

</html>