<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<style>
div.searchBar {
  position: relative;
  display: inline-block;
  width: 540px;
  height: 176px;
  font-size: xx-large;
  color: silver;
}
div.searchBar img {
  width: 540px;
}
div.searchBarModule {
  position: absolute;
  top: 26px; /* in conjunction with left property, decides the text position */
  left: 100px;
  width: 340px; /* optional, though better have one */
  text-align: center; 
}

div.searchOptions {
  position: relative;
  display: inline-block;
  width: 270px;
  height: 88px;
  font-size: large;
  color: silver;
}

div.searchOptions img {
  width: 270px;
}

div.searchOptions label {
  width: 80px;
}

div.searchOptions select {
  width: 150px;
}

div.searchItems {
  position: absolute;
  top: 13px; /* in conjunction with left property, decides the text position */
  left: 50px;
  width: 170px; /* optional, though better have one */
  text-align: center; 
}
</style>
<script>
$(document).ready(function() {
	$(".changePage").click(function() {
		$(".openRightSide").attr("class", "closeRightSide");
		$(".openLeftSide").attr("class", "closeLeftSide");
	});
});
</script>
</head>
<body>
<form action="#">
<div class="searchOptions">
<img alt="menu07" src="/Ssamtrio/image/menu07.png">
<div class="searchItems">
<label for="headCount"><span class="glyphicon glyphicon-user"></span>인원수</label>
<select id="headCount">
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
<div class="searchOptions">
<img alt="menu07" src="/Ssamtrio/image/menu07.png">
<div class="searchItems">
<label for="mapType"><span class="glyphicon glyphicon-list-alt"></span>맵타입</label>
<select id="mapType">
	<option value="all">전체</option>
	<option value="controll">컨트롤</option>
	<option value="depence">디펜스</option>
	<option value="operation">운영</option>
	<option value="etc">기타</option>
</select>
</div>
</div>
<div class="searchOptions">
<img alt="menu07" src="/Ssamtrio/image/menu07.png">
<div class="searchItems">
<label for="mapLoD"><span class="glyphicon glyphicon-dashboard">난이도</span></label>
<select id="mapLoD">
	<option value="all">상관없음</option>
	<option value="veryEasy">매우쉬움</option>
	<option value="easy">쉬움</option>
	<option value="normal">보통</option>
	<option value="hard">어려움</option>
	<option value="hardcore">매우어려움</option>
</select>
</div>
</div>
<div class="searchOptions">
<img alt="menu07" src="/Ssamtrio/image/menu07.png">
<div class="searchItems">
<label for="mapMana"><span class="glyphicon glyphicon-oil"></span>맵마나</label>
<select id="mapMana">
	<option value="all">상관없음</option>
	<option value="infMana">마나무한</option>
	<option value="finMana">마나유한</option>
</select>
</div>
</div>
<div class="searchOptions">
<img alt="menu07" src="/Ssamtrio/image/menu07.png">
<div class="searchItems">
<label for="mapTime"><span class="glyphicon glyphicon-time"></span>총시간</label>
<select id="mapTime">
	<option value="all">상관없음</option>
	<option value="half">약30분</option>
	<option value="aHour">약1시간</option>
	<option value="twoHour">약2시간</option>
	<option value="soLong">2시간이상</option>
</select>
</div>
</div>
<br/>
<div class="searchBar">
<img alt="menu07" src="/Ssamtrio/image/menu07.png">
<div class="searchBarModule">
<label for="searchWordBar"><span class="glyphicon glyphicon-search"></span>검 색</label>
<input list="starUseMap" name="searchWordBar" id="searchWordBar"/>
  <datalist id="starUseMap">
  <!-- ajax로 동적으로 변경 -->
    <option value="벌컨">
    <option value="빠무">
  </datalist>
</div>
</div>
</form>
<menu:rightMenuButton01 uri="javascript:void(0)" value="검색"/>
<menu:rightMenuButton02 uri="/Ssamtrio/strboard/list.str" value="전체보기"/>
</body>
</html>