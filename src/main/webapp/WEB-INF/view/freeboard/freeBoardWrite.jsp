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
<form method="post" action="freeBoardPro.str" >
	<input type="hidden" name="memid" value="${sessionScope.member.memid }"/>
	<div  class="openLeftSide menuStyle" style="display: inline-block;">
		<table >
			<tr>
					<td colspan="2"><label id="boardid">게시판 선택</label> <select name="boardid"
						id="boardid">
							<c:forEach items="${boardList}" var="bId">
								<option value="${bId.boardid}">${bId.boardtitle}</option>
							</c:forEach>
					</select></td>
				</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" style="width: 420px;" name="fbtitle"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="50" name="fbcont"></textarea></td>
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