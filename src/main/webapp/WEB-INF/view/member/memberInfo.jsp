<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo.jsp</title>
<script type="text/javascript">
	$(document).ready(function() {
		var scrollBlock = $('.historyContnr').jScrollPane({mousewheelspeed:50});
		var api = scrollBlock.data('jsp');
	});
</script>
</head>
<body>
<div class="openLeftSide">
<div class="menuStyle">
<div class="hisDesc"><span class="glyphicon glyphicon-calendar"></span>다운로드 히스토리</div>
<div class="historyContnr">
<table>
	<thead>
		<tr>
			<th>맵다운로드날짜</th>
			<th>맵이름</th>
			<th>난이도</th>
			<th>총시간</th>
			<th>인원수</th>
			<th>맵버전</th>
			<th>맵마나</th>
			<th>다운</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${!empty historyList }">
		<c:forEach items="${historyList }" var="hl">
			<c:forEach items="${hl.strumf }" var="map">
			<tr>
				<td>${hl.hisdate }</td>
				<td>${map.mapname }</td>
				<td>${map.maplod }</td>
				<td>${map.maptime }</td>
				<td>${map.mapminn }~${map.mapmaxn }</td>
				<td>${map.mapver }</td>
				<td>${map.mapmana }</td>
				<td><a href="/Ssamtrio/strboard/downloadSMF.str?mapid=${map.mapid }" class="btn btn-default btn-xs">다운</a></td>
			</tr>
			</c:forEach>
		</c:forEach>
	</c:if>
	<c:if test="${empty historyList }">
		<tr>
			<td colspan="8">히스토리가 존재하지 않습니다.</td>
		</tr>
	</c:if>
	</tbody>
</table>
</div>
</div>
</div>
</body>
</html>