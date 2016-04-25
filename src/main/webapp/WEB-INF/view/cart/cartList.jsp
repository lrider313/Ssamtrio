<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cartList.jsp</title>
<script>
$(document).ready(function() {
	var scrollBlock = $('.cartContnr').jScrollPane({mousewheelspeed:50});
	var api = scrollBlock.data('jsp');
	$("body>div.goDown>div.openLeftSide>div.menu03>div.text>a.changePage").attr("class","downloadBtn");
	$("body>div.goDown>div.openLeftSide>div.menu02>div.text>a.changePage").attr("class","delCartListBtn");
	$("#checkAll").change(function(){
		$("input:checkbox").prop('checked', $(this).prop("checked"));
	});
	$('.downloadBtn').click(function(){
		var cnt = $('input[name="list"]:checkbox:checked').length;
		var url = "/Ssamtrio/strboard/downloadSMFList.str?";
		if(cnt < 1){
			alert("한 개 이상을 선택하셔야 합니다");
		}else{
			alert(cnt+"개의 파일을 다운로드합니다.");
			var querystring = $('input[name="list"]:checkbox:checked').serialize();
			location.href=url+querystring;
		}
	});
	$('.delCartListBtn').click(function(){
		var cnt = $('input[name="list"]:checkbox:checked').length;
		if(cnt < 1){
			alert("한 개 이상을 선택하셔야 합니다");
		}else{
			var checkedCartList = [];
			$('input[name="list"]:checked').each(function() {
				checkedCartList.push($(this).val());
			});
			
			$.ajax({
				url: '/Ssamtrio/cart/delCart.str',
				type: 'GET',
				data: {'list':checkedCartList},
				dataType: 'json',
				success:function(msg) {
					alert(cnt + "개의 목록이 " + msg.state);
					location.reload();
					api.reinitialise();
				}
			});
		}
	});
});
</script>
</head>
<body>
<div class="openLeftSide">
<div class="menuStyle">
<div class="cartDesc"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</div>
<div class="cartContnr">
<table id='mapList'>
	<thead>
		<tr>
			<th><input type='checkbox' id="checkAll"/></th>
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
	<c:if test="${!empty mapListInCart }">
		<c:forEach items="${mapListInCart }" var="mlic">
			<c:forEach items="${mlic.strumf }" var="map">
			<tr>
				<td><input type="checkbox" name="list" value="${map.mapid}"/></td>
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
	</c:if>
	<c:if test="${empty mapListInCart }">
		<tr>
			<td colspan="11">장바구니 목록이 존재하지 않습니다.</td>
		</tr>
	</c:if>
	</tbody>
</table>
</div>
</div>
</div>
<c:if test="${!empty mapListInCart }">
	<div class="goDown">
		<menu:leftMenuButton03 uri="javascript:void(0)" value="다운로드"/>
		<menu:leftMenuButton02 uri="javascript:void(0)" value="장바구니에서 제거"/>
	</div>
</c:if>
<c:if test="${empty mapListInCart }">
	<menu:leftMenuButton01 uri="/Ssamtrio/main/" value="메인으로"/>
</c:if>
</body>
</html>