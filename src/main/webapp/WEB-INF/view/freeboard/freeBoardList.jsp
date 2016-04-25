<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script>
	function needSignin() {
		alert("로그인이 필요한 서비스입니다.");
		location.href='/Ssamtrio/sign/signinForm.str';
	}
</script>
</head>
<body>
<form action="freeBoardWrite.str" method="post">
    <div class="table-responsive openLeftSide menuStyle" style="width:714px; overflow-x:hidden;" >
	<table class="table-hover">
		<tr>
			<td width="73" name="fbid">번호</td>
			<td width="379" style="text-align: inherit;">제목</td>
			<td width="73">글쓴이</td>
			<td width="163">등록일</td>
			<td width="73">조회</td>
			<td width="73">추천</td>
		</tr>
		<c:forEach items="${fb }" var="fbb">
		<tr>
			<td>${fbb.fbid }</td>
			<td><a href="freeSelectForm.str?fbid=${fbb.fbid}">${fbb.fbtitle}</a></td>
			<td>${fbb.memid }</td>
			<td>${fbb.fbdate }</td>
			<td>${fbb.fbcount }</td>
			<td>${fbb.fbrec }</td>
		</tr>
		</c:forEach>
	</table>
	
	</div>
		<c:if test="${empty sessionScope.member.memid }">
	<menu:leftMenuButton01 uri="javascript:void(0)\' onclick=\'javascript:needSignin()" value="글쓰기"/>
	</c:if>
	<c:if test="${!empty sessionScope.member.memid }">
	<menu:leftMenuButton01 uri="freeBoardWrite.str" value="글쓰기"/>
	</c:if>
</form>
</body>

</html>
