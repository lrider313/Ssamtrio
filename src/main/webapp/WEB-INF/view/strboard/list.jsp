<%@page import="com.genius.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<script type="text/javascript" src="/Ssamtrio/js/strList.js"></script>
</head>
<body>
<div class="openLeftSide">
<div class="menuStyle">
<div class="mapCtgrDesc">
<span class="glyphicon glyphicon-th-list"> 맵카테고리</span></div><br/><br/>
<div class="mapCtgr">
	<ul>
		<c:forEach items="${list}" var="l">
			<li><a href="javascript:void(0)" title="${l.strcont}" class="getFileInfo" id="${l.strid}">${l.strtitle}</a></li>
		</c:forEach>
	</ul>
</div>
</div>
</div>
<div class="mapFile">
<div class="menuStyle">
<div class="mapFileDesc"><span class="glyphicon glyphicon-floppy-save"> 맵다운로드</span></div>
	<select name="mapid" class="mapid"></select>
	<div class="mapContnr">
		<ul class="mapFileInfo">
			<li id="mapName"></li>
			<li id="mapCount"></li>
			<li id="mapNumber"></li>
			<li id="mapVersion"></li>
			<li id="mapCrt"></li>
			<li id="mapLod"></li>
			<li id="mapTime"></li>
			<li id="mapMana"></li>
		</ul>
	</div>
</div>
</div>
<c:if test="${sessionScope.member.memauth<=2 }">
	<menu:leftMenuButton01 uri="write.str" value="맵 카테고리 추가"/>
	<menu:rightMenuButton01 uri="upMapFileForm.str" value="맵 업로드"/>
</c:if>
<div class="downButton"><menu:rightMenuButton01 uri="javascript:void(0)" value="맵 다운로드"/></div>
<div class="addCartBtn"><menu:rightMenuButton02 uri="javascript:void(0)" value="장바구니에 추가"/></div>
</body>
</html>