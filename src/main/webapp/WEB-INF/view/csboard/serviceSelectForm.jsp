<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceForm.jsp</title>
<style type="text/css">
.tablewidth{
width:500px;
}
</style>
</head>
<body>
	<form method="post" action="serviceUpdateForm.str?csid=${csb.csid}">
		<div class="openLeftSide tablewidth" style="display: inline-block;">
			<table class="menuStyle tablewidth">
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
					<td><img src="/Ssamtrio/csImage/${csb.csfile}" alt="파일없음" style="width:300px;"/></td>					
				</tr>
			</table>
			<c:if test="${!empty csrp}">
			<div >
			</div >
		
			<table class="menuStyle openLeftSide tablewidth">
			<c:forEach items="${csrp }" var="rp">
				<tr>
					<th>${rp.memid}  &nbsp;&nbsp;&nbsp;</th>
					<td>${rp.csrpcont}</td>
				</tr>
			</c:forEach>
			</table>
			</c:if>
		</div>
	</form>
<c:if test="${sessionScope.member.memauth<=2 }">
		<form method="post" action="serviceRe.str">
		<div>
			</div>
			<table class="menuStyle openLeftSide tablewidth" style="display: inline-block;  ">
			<tr>
			<th>${rp.memid}</th>
			<td><input type="text" name="csrpcont" /><input type="hidden" name="csid" value="${csb.csid}"/></td>
			<td><button >입력</button></td>
			</tr>
			</table>
		</div>
			</form>
			</c:if>
			
<menu:leftMenuButton01 uri="serviceList.str" value="목록"/>
<c:if test="${sessionScope.member.memid==csb.memid }">
<menu:leftMenuButton01 uri="serviceUpdateForm.str?csid=${csb.csid }" value="수정하기"/>
<menu:leftMenuButton01 uri="serviceDelete.str?csid=${csb.csid }" value="삭제하기"/>
</c:if>

</body>

</html>