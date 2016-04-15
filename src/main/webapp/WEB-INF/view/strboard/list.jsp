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
	var strf;
	
	$('.mapFile,.mapFileInfo,.downButton').hide();
	$('.changePage').click(function() {
		$('.openLeftSide').attr("class", "closeLeftSide");
		$('.openRightSide').attr("class", "closeRightSide");
	});
	$('.getFileInfo').click(function(){
		alert($(this).attr("id"));
		$.ajax({
			url:'getFileInfo.str?strid='+$(this).attr("id"),
			dataType:'json',
			success:function(strumf) {
				strf = strumf;
				$('.mapFile').show();
				$('.mapFile').attr("class", "openRightSide menuStyle mapFile");
				$('.mapid').empty().append("<option value=''>Select</option>");
				for(var i=0; i<strumf.length; i++) {
					$('.mapid').append("<option value='"+ strumf[i].mapid + "'>"+ strumf[i].mapname + "</option>");
				}
			}
		});
	});

	$('.mapid').change(function(){
		if($('div.downButton>div.openRightSide>div.menu04>div.text>a.download').length>0) {
			$('div.downButton>div.openRightSide').attr("class","closeRightSide");
			setTimeout(function() {
				$('div.downButton>div.closeRightSide').attr("class","openRightSide");
			}, 250);
		}
		if($('.mapid').val() != "") {
			$('.mapFileInfo,.downButton').show();
			$("#mapName").text("앱이름: "+strf[this.selectedIndex-1].mapname);
			$("#mapCount").text("맵다운로드수: "+strf[this.selectedIndex-1].mapcount);
			$("#mapNumber").text("맵인원수: "+strf[this.selectedIndex-1].mapminn+" ~ "+strf[this.selectedIndex-1].mapmaxn);
			$("#mapVersion").text("맵버전: "+strf[this.selectedIndex-1].mapver);
			if(strf[this.selectedIndex-1].mapcrt=="") {
				$("#mapCrt").hide();
			} else {
				$("#mapCrt").show();
				$("#mapCrt").text("맵제작자: "+strf[this.selectedIndex-1].mapcrt);
			}
			$("#mapMana").text("마나무한여부: "+strf[this.selectedIndex-1].mapmana);
			$('div.downButton>div.openRightSide>div.menu04>div.text>a.changePage').attr("class","download");
			$('.download').attr("href","downloadSMF.str?mapid="+$(this).val());
		} else {
			$('div.downButton>div.openRightSide').attr("class","closeRightSide");
			$('.mapFileInfo').hide();
			setTimeout(function() {
				$('.downButton').hide();
			}, 250);
			$('.download').attr("class","changePage");
		}
	});
});
</script>
</head>
<body>
<div class="openLeftSide">
<div class="menuStyle">
<div class="mapCtgrDesc">
<span class="glyphicon glyphicon-th-list"> 맵카테고리</span></div><br/><br/>
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
	<select name="mapid" class="mapid"></select><br/>
	<ul class="mapFileInfo">
		<li id="mapName"></li>
		<li id="mapCount"></li>
		<li id="mapNumber"></li>
		<li id="mapVersion"></li>
		<li id="mapCrt"></li>
		<li id="mapMana"></li>
	</ul>
</div>
<div class="downButton"><menu:rightMenuButton01 uri="" value="맵 다운로드"/></div>
<menu:leftMenuButton01 uri="write.str" value="맵 카테고리 추가"/>
<menu:rightMenuButton01 uri="upMapFileForm.str" value="맵 업로드"/>
</body>
</html>