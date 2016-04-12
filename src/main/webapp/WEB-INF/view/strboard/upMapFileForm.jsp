<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	alert("하이");
	//유효성 검사.
// 	$('#mapFileForm').validate({
// 		rules : {
// 			mapminn : "required",
// 			mapmaxn : "required",
// 			mapver : "required",
// 			mapmana : "required"
// 		},
// 		messages : {
// 			mapminn : "아래의 항목에서 최소 필요 인원을 선택하세요.",
// 			mapmaxn : "아래의 항목에서 최대 가능 인원을 선택하세요.",
// 			mapver : "맵버전을 입력은 필수입니다.",
// 			mapmana : "마나무한 맵인지 선택하세요."
// 		},
// 		submitHandler : function(frm) {
// 			frm.submit();
// 		},
// 		success : function() {
// 			alert("입력이 완료되었습니다.");
// 		}
// 	});
});
</script>
</head>
<body>
<form id="mapFileForm" action="/Ssamtrio/strboard/uploadSMF.str" method="post" enctype="multipart/form-data">
	<label for="mapminn">맵최소필요인원 : </label><select id="mapminn" name="mapminn" required ></select><br/>
	<label for="mapmaxn">맵최대가능인원 : </label><select id="mapmaxn" name="mapmaxn" required ></select>
		<span id="mapmaxnMessage">Tip: 맵최소필요인원을 선택하고 선택해주세요.</span><br/>
	<label for="mapver">맵버전 : </label><input type="text" id="mapver" name="mapver" required /><br/>
	<label for="mapcrt">맵제작자 : </label><input type="text" id="mapcrt" name="mapcrt" /><br/>
	<label for="mapmana">마나무한여부 : </label>
	<select id="mapmana" name="mapmana" required >
		<option value="y">마나무한인 경우</option>
		<option value="n">마나무한이 아닌 경우</option>
	</select><br/>
	<label for="mapFile">맵파일첨부(*.scm, *.scx만 가능합니다) </label><br/>
	<input type="file" id="mapFile" name="mapFile" accept=".scx, .scm" required /><br/><br/>
	<input type="submit" value="작성완료" />
</form>
</body>
</html>