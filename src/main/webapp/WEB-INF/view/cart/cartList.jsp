<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cartList.jsp</title>
</head>
<body>
<div class="openLeftSide">
<div class="cartContnr">
<table id='mapList'>
	<thead>
		<tr>
			<th><input type='checkbox' name='mapListInCart'/></th>
			<th>맵분류</th>
			<th>맵타입</th>
			<th>맵이름</th>
			<th>다운수</th>
			<th>난이도</th>
			<th>총시간</th>
			<th>인원수</th>
			<th>맵버전</th>
			<th>맵마나</th>
			<th>다운</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${mapListInCart }" var="mlic">
			<c:forEach items="${mlic.strumf }" var="map">
			<tr>
				<td><input type="checkbox" name="mapListInCart"/></td>
				<td>${mlic.strtitle }</td>
				<td>${mlic.strtype }</td>
				<td>${map.mapname }</td>
				<td>${map.mapcount }</td>
				<td>${map.maplod }</td>
				<td>${map.maptime }</td>
				<td>${map.mapminn }~${map.mapmaxn }</td>
				<td>${map.mapver }</td>
				<td>${map.mapmana }</td>
				<td><a href="/Ssamtrio/strboard/downloadSMF.str?mapid=${map.mapid }" class="btn btn-default btn-xs">다운</a></td>
			</tr>
			</c:forEach>
		</c:forEach>
	</tbody>
</table>
</div>
</div>
</body>
</html>