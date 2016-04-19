<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upMapFile.jsp</title>
<!-- jQuery.validate Plug-in -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//Select Setting: mapminn, mapmaxn
	//mapminn의 초기화(맵최소정원)
	$('#mapminn, #mapmaxn, #mapmana').prepend("<option value='' selected>Select</option>");
	for(var i=1;i<9;i++) {
		$('#mapminn').append("<option value='"+ i +"'>"+ i +" 인</option>");
	}
	//최소 인원보다 최대인원의 수가 많아야하므로 최소인원 선택에 따라 동적으로 최대인원 선택의 범위가 변경(맵최대정원).
	$("#mapminn").change(function() {
		//기존에 option 하위태그가 존재했다면 제거.
		$('#mapmaxn').empty();
		//mapmaxn option 초기화.
		$('#mapmaxn').append("<option value=''>Select</option>");
		if($(this).val()!="") {	//$(this).val()이 빈스트링일 때도 for문이 작동했기에 if문을 부가적으로 달았다.
			for(var i=$(this).val(); i<9; i++) {
				$('#mapmaxn').append("<option value='"+ i +"'>"+ i +" 인</option>");
			}
		}
		//mapminn이 선택여부에 따라 Tip 삽입/제거
		if($("#mapminn").val()!="") {
			$("#mapmaxnMessage").text("");
		} else {
			$("#mapmaxnMessage").text("Tip: 맵최소필요인원을 선택하고 선택해주세요.");
		}
	});
	
	$('.changePage').click(function() {
		if($('#strid').val()=="") {
			alert("맵 카테로기를 선택하세요.");
			$('#strid').focus();
			return false;
		} else if($('#mapminn').val()=="") {
			alert("맵최소인원을 선택하세요.");
			$('#mapminn').focus();
			return false;
		} else if($('#mapmaxn').val()=="") {
			alert("맵최대인원을 선택하세요.");
			$('#mapmaxn').focus();
			return false;
		} else if($('#mapver').val()=="") {
			alert("맵버전을 적으세요.");
			$('#mapver').focus();
			return false;
		} else if($('#mapmana').val()=="") {
			alert("맵마나무한여부를 선택하세요.");
			$('#mapmana').focus();
			return false;
		} else if($('#mapFile').val()=="") {
			alert("맵파일을 선택하세요.");
			$('#mapFile').focus();
			return false;
		}
		$('#mapFileForm').submit();
	});
});
</script>
</head>
<body>
<div class="openLeftSide">
<div class="menuStyle">
<form id="mapFileForm" action="/Ssamtrio/strboard/uploadSMF.str" method="post" enctype="multipart/form-data">
	<label for="strid"><span>맵카테고리</span></label>
	<select name="strid" id="strid">
		<c:forEach items="${strumnList}" var="strn">
			<option value="${strn.strid}">${strn.strtitle }</option>
		</c:forEach>
	</select><br>
	<label for="mapminn"><span>맵최소인원</span></label><select id="mapminn" name="mapminn" required ></select><br/>
	<label for="mapmaxn"><span>맵최대인원</span></label><select id="mapmaxn" name="mapmaxn" required ></select>
		<span id="mapmaxnMessage">Tip: 맵최소필요인원을 선택하고 선택해주세요.</span><br/>
	<label for="mapver"><span>맵버전 </span></label><input type="text" id="mapver" name="mapver" maxlength="15" required /><br/>
	<label for="mapcrt"><span>맵제작자 </span></label><input type="text" id="mapcrt" name="mapcrt" maxlength="20" /><br/>
	<label for="mapmana"><span>마나무한여부 </span></label>
	<select id="mapmana" name="mapmana" required >
		<option value="y">마나무한인 경우</option>
		<option value="n">마나무한이 아닌 경우</option>
	</select><br/>
	<label for="mapFile"><span>맵파일첨부</span></label>
	<input type="file" id="mapFile" name="mapFile" accept=".scx, .scm" required /><br/><br/>
</form>
</div>
</div>
<menu:leftMenuButton01 uri="javascript:void(0)" value="작성 완료"/>
</body>
</html>