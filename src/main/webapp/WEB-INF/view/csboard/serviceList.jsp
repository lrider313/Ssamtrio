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
    <div class="table-responsive openLeftSide menuStyle" >
	<table class="table-hover">
			<td width="73">번호</td>
			<td width="80" style="text-align: inherit;">분류</td>
			<td width="379">제목</td>
			<td width="73">작성자</td>
			<td width="163">작성일</td>
		</tr>
		<c:forEach items="${csb}" var="cs">
		<tr>
			<td>${cs.csid}</td>
			<td>
			<c:if test="${cs.cstype==1}">
			</c:if>
			<c:if test="${cs.cstype==2}">
				파일요청
			</c:if>
			<c:if test="${cs.cstype==3}">
				기타
			</c:if>
			</td>
			<td><a href="serviceSelectForm.str?csid=${cs.csid}">${cs.cstitle}</a></td>
			<td>${cs.memid}</td>
			<td>${cs.csdate}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
	<c:if test="${empty sessionScope.member.memid }">
	<menu:leftMenuButton01 uri="javascript:void(0)\' onclick=\'javascript:needSignin()" value="글쓰기"/>
	</c:if>
	<c:if test="${!empty sessionScope.member.memid }">
	<menu:leftMenuButton01 uri="serviceForm.str" value="글쓰기"/>
	</c:if>
</body>

</html>
