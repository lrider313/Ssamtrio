<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceForm.jsp</title>
</head>
<body>
	<form method="post" action="serviceUpdateForm.str?csid=${csb.csid}">
		<div class="openLeftSide" style="display: inline-block;">
			<table class="menuStyle">
				<tr>
					<th>문의유형　　</th>
					<td><c:if test="${csb.cstype==1}">
							버그신고
						</c:if> <c:if test="${csb.cstype==2}">
							파일요청
						</c:if> <c:if test="${csb.cstype==3}">
							기타
						</c:if></td>
				</tr>
				<tr>
					<th>ID</th>
					<td>${csb.memid }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${csb.cstitle }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td style="white-space: pre;">${csb.cscont }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>${csb.csfile}</td>
				</tr>
		
			</table>
		</div>
	</form>

<menu:leftMenuButton01 uri="serviceList.str" value="목록"/>
<menu:leftMenuButton01 uri="serviceUpdateForm.str?csid=${csb.csid }" value="수정하기"/>
</body>

</html>