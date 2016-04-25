<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>freeBoardWrite.jsp</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('#boardid>option[value="3"]').attr("selected",true);
	});
</script>
</head>
<body>
<form method="post" action=freeUpdatepro.str >
<input type="hidden" name="fbid" value="${fb.fbid }"/>
<input type="hidden" name="memid" value="${fb.memid }"/> 
	<div  class="openLeftSide menuStyle" style="display: inline-block;">
		<table >
			<tr>
				<th>제목</th>
				<td><input type="text" style="width: 420px;" name="fbtitle" value="${fb.fbtitle}"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="50" name="fbcont">${fb.fbcont}</textarea></td>
			</tr>
			<tr>
			<td colspan="2" style="text-align: right"><button type="submit">수정하기</button> 
			<button type="reset">취소하기</button></td>
			</tr>
		</table>
	</div>
	</form>
</body>

</html>