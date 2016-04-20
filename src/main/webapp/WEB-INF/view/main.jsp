<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<script>
$(document).ready(function() {
	$("body>div.searchBtn>div.openRightSide>div.menu04>div.text>a.changePage").click(function() {
		$('#searchForm').submit();
	});
	$(".changePage").click(function() {
		$(".openRightSide").attr("class", "closeRightSide");
		$(".openLeftSide").attr("class", "closeLeftSide");
	});
});
</script>
</head>
<body>
<form id="searchForm" action="/Ssamtrio/main/list.str">
<div class="openRightSide">
<div class="searchBar">
<img alt="menu07" src="/Ssamtrio/image/menu07.png">
<div class="searchBarModule">
<label for="searchWordBar"><span class="glyphicon glyphicon-search"></span>검 색</label>
<input list="starUseMap" name="searchWordBar" id="searchWordBar"/>
  <datalist id="starUseMap">
  	<c:forEach items="${strumn }" var="str">
	    <option value="${str.strtitle }">
  	</c:forEach>
  </datalist>
</div>
</div>
</div>
<div class="openLeftSide">
<div class="searchOptions">
<img alt="menu07" src="/Ssamtrio/image/menu07.png">
<div class="searchItems">
<label for="headCount"><span class="glyphicon glyphicon-user"></span>인원수</label>
<select id="headCount" name="headcount">
	<option value="all">전체</option>
	<option value="1">1인</option>
	<option value="2">2인</option>
	<option value="3">3인</option>
	<option value="4">4인</option>
	<option value="5">5인</option>
	<option value="6">6인</option>
	<option value="7">7인</option>
	<option value="8">8인</option>
</select>
</div>
</div>
</div>
<div class="openLeftSide">
<div class="searchOptions">
<img alt="menu07" src="/Ssamtrio/image/menu07.png">
<div class="searchItems">
<label for="strtype"><span class="glyphicon glyphicon-list-alt"></span>맵타입</label>
<select id="strtype" name="strtype">
	<option value="all">전체</option>
	<option value="controll">컨트롤</option>
	<option value="depence">디펜스</option>
	<option value="operation">운영</option>
	<option value="etc">기타</option>
</select>
</div>
</div>
</div>
<div class="openLeftSide">
<div class="searchOptions">
<img alt="menu07" src="/Ssamtrio/image/menu07.png">
<div class="searchItems">
<label for="maplod"><span class="glyphicon glyphicon-dashboard"></span>난이도</label>
<select id="maplod" name="maplod">
	<option value="all">상관없음</option>
	<option value="veryEasy">매우쉬움</option>
	<option value="easy">쉬움</option>
	<option value="normal">보통</option>
	<option value="hard">어려움</option>
	<option value="hardcore">매우어려움</option>
</select>
</div>
</div>
</div>
<div class="openLeftSide">
<div class="searchOptions">
<img alt="menu07" src="/Ssamtrio/image/menu07.png">
<div class="searchItems">
<label for="mapmana"><span class="glyphicon glyphicon-oil"></span>맵마나</label>
<select id="mapmana" name="mapmana">
	<option value="all">상관없음</option>
	<option value="infMana">마나무한</option>
	<option value="finMana">마나유한</option>
</select>
</div>
</div>
</div>
<div class="openLeftSide">
<div class="searchOptions">
<img alt="menu07" src="/Ssamtrio/image/menu07.png">
<div class="searchItems">
<label for="maptime"><span class="glyphicon glyphicon-time"></span>총시간</label>
<select id="maptime" name="maptime">
	<option value="all">상관없음</option>
	<option value="half">약30분</option>
	<option value="aHour">약1시간</option>
	<option value="twoHour">약2시간</option>
	<option value="soLong">2시간이상</option>
</select>
</div>
</div>
</div>
</form>
<div class="searchBtn"><menu:rightMenuButton01 uri="javascript:void(0)" value="검색"/></div>
<menu:rightMenuButton02 uri="/Ssamtrio/strboard/list.str" value="전체보기"/>
</body>
</html>