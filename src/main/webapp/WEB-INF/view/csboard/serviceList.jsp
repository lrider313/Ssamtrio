<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>게시판</title>

</head>

<body>
<form action="serviceForm.str" method="post">
	<table>
		<tr height="5">
			<td width="5"></td>
		</tr>
		<tr
			style="background: url('img/table_mid.gif') repeat-x; text-align: center;">

			<td width="5"><img src="img/table_left.gif" width="5"
				height="30" /></td>

			<td width="73">번호</td>
			<td width="58">분류</td>
			<td width="379">제목</td>
			<td width="73">작성자</td>
			<td width="163">작성일</td>


			<td width="7"><img src="img/table_right.gif" width="5"
				height="30" /></td>

		</tr>
		<tr height="25" align="center">
		</tr>

		<tr height="1" bgcolor="#D2D2D2">
			<td colspan="6"></td>
		</tr>

		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
	</table>

	<table>
		<tr>
			<td colspan="4" height="5"></td>
		</tr>
		<tr align="center">
			<td style="text-align: right;"><input type="submit" value="글쓰기"></td>
		</tr>
	</table>
</form>
</body>

</html>
