<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<script>
$(document).ready(function() {
	/* jScrollPane */
	var scrollBlock = $('.mapCtgr').jScrollPane({mousewheelspeed:50});
	var api = scrollBlock.data('jsp');
	
	$(".mapFile").hide();
	$(".changePage").click(function() {
		$(".openLeftSide").attr("class", "closeLeftSide");
		$(".openRightSide").attr("class", "closeRightSide");
	});
	$(".getFileInfo").click(function(){
		alert($(this).attr("id"));
		$.ajax({
			url:'getFileInfo.str?strid='+$(this).attr("id"),
			dataType:'json',
			success:function(strumf) {
				$(".mapFile").show();
				$(".mapFile").attr("class", "openRightSide menuStyle mapFile");
				$("#mapName").text("앱이름: "+strumf.mapname);
				$("#mapCount").text("맵다운로드수: "+strumf.mapcount);
				$("#mapNumber").text("맵인원수: "+strumf.mapminn+" ~ "+strumf.mapmaxn);
				$("#mapVersion").text("맵버전: "+strumf.mapver);
				$("#mapCrt").text("맵제작자: "+strumf.mapcrt);
				$("#mapMana").text("마나무한여부: "+strumf.mapmana);
			}
		});
	});
});
</script>
</head>
<body>
<div class="openLeftSide">
<div class="menuStyle mapCtgrDesc">
<span class="glyphicon glyphicon-th-list"> 맵카테고리</span><br/><br/>
<div class="mapCtgr">
	<ul>
		<c:forEach items="${list}" var="l">
			<li><a href="#" title="${l.strcont}" class="getFileInfo" id="${l.strid}">${l.strtitle}</a></li>
		</c:forEach>
	</ul>
</div>
</div>
</div>
<div class="mapFile">
<div class="mapFileDesc"><span class="glyphicon glyphicon-floppy-save"> 맵다운로드</span><br/><br/></div>
	<ul>
		<li id="mapName"></li>
		<li id="mapCount"></li>
		<li id="mapNumber"></li>
		<li id="mapVersion"></li>
		<li id="mapCrt"></li>
		<li id="mapMana"></li>
	</ul>
</div>
<menu:leftMenuButton01 uri="write.str" value="맵 카테고리 추가"/>
<menu:rightMenuButton01 uri="upMapFileForm.str" value="맵 업로드"/>
</body>
</html>