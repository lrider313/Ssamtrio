<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signupForm.jsp</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=c349bc68cf17c9fcc6f85bdaa6d0e36e&libraries=services"></script>
<script>
$(document).ready(function() {
	var wasIdchecked=false;
	var idPwPattern = /^[a-zA-Z0-9_]{4,15}$/;
	var emailPattern =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var phonePattern =  /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var namePattern = /^[\wㄱ-ㅎㅏ-ㅣ가-힣]{2,15}$/;
	var nickPattern = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,15}$/;
	$('#memid').focus();
	
	$(".changePage").click(function() {
		if(!idPwPattern.test($('#memid').val())) {
			$('#memidDiv').text("아이디의 범위는 4~15자이며, 숫자, 영문, '_'만 입력가능합니다.");
			$('#memid').val("").focus();
			return false;
		} else if(!idPwPattern.test($('#mempw').val())) {
			$('#mempwDiv').text("비밀번호의 범위는 4~15자이며, 숫자, 영문, '_'만 입력가능합니다.");
			$('#mempw').val("").focus();
			return false;
		} else if($('#mempw').val() != $('#mempwCheck').val()) {
			$('#mempwCheckDiv').text("비밀번호가 일치하지 않습니다. 재입력해주세요.");
			$('#mempwCheck').val("").focus();
			return false;
		} else if(!namePattern.test($('#memname').val())) {
			$('#memnameDiv').text("이름은 한글 및 영문으로만 작성해주세요(2글자~15글자).");
			$('#memname').val("").focus();
			return false;
		} else if(!nickPattern.test($('#memnick').val())) {
			$('#memnickDiv').text("2글자이상 15글자이하로 작성해주세요.");
			$('#memnick').val("").focus();
			return false;
		} else if(!phonePattern.test($('#memphone').val())&&$('#memphone').val()!="") {
			alert("전화번호");
			$('#memphoneDiv').text("휴대폰 번호를 정확히 입력하세요. ex) 010-1234-1234");
			$('#memphone').val("").focus();
			return false;
		} else if(!emailPattern.test($('#mememail').val())) {
			$('#mememailDiv').text("올바른 이메일 양식을 작성해주세요.");
			$('#mememail').val("").focus();
			return false;
		} else if(wasIdchecked==false) {
			alert("중복 확인을 해주세요.");
			$('#checkExistId').focus();
			return false;
		}
		alert("성공");
		$(".openLeftSide").attr("class", "closeLeftSide");
		$(".openRightSide").attr("class", "closeRightSide");
		$('#signupPro').submit();
	});
	
	$('#checkExistId').click(function() {
		var idPwPattern = /^[a-z0-9_]{4,15}$/;
		if(!idPwPattern.test($('#memid').val())) {
			$('#memidDiv').text("아이디의 범위는 4~15자이며, 숫자, 영문, '_'만 입력가능합니다.");
			$('#memid').val("").focus();
			wasIdchecked=false;
			return false;
		}
		$.ajax({
			url: 'checkExistId.str?memid='+$('#memid').val(),
			dataType: 'json',
			success: function(data) {
				if(data.usableId=="true") {
					alert("사용가능한 아이디입니다.");
					$('#memidDiv').text("");
					wasIdchecked=true;
					$('#mempw').focus();
				} else {
					alert("이미 사용 중인 아이디입니다.\n다른 아이디를 사용해주세요.");
					$('#memid').val("").focus();
					wasIdchecked=false;
				}
			}
		});
	});
});
</script>
</head>
<body>
<form action="/Ssamtrio/sign/signupPro.str" id="signupPro">
<div class="openLeftSide">
<div class="menuStyle">
	<label for="memid"><span>아이디</span></label>
		<input id="memid" type="text" name="memid" maxlength="15" required/><input type="button" value="중복 확인" id="checkExistId"/><br/>
		<div id="memidDiv"></div><br>
	<label for="mempw"><span>비밀번호</span></label>
		<input id="mempw" type="password" name="mempw" maxlength="15" required/>
		<div id="mempwDiv"></div><br/>
	<label for="mempwCheck"><span>비밀번호 확인</span></label>
		<input id="mempwCheck" type="password" maxlength="15" required/>
		<div id="mempwCheckDiv"></div><br/>
	<label for="memname"><span>이름</span></label>
		<input id="memname" type="text" name="memname" maxlength="15" required/>
		<div id="memnameDiv"></div><br/>
	<label for="memnick"><span>닉네임</span></label>
		<input id="memnick" type="text" name="memnick" maxlength="15" required/>
		<div id="memnickDiv"></div><br/>
	<label for="mememail"><span>이메일</span></label>
		<input id="mememail" type="text" name="mememail" maxlength="30" required/>
		<div id="mememailDiv"></div><br/>
	<label for="memphone"><span>전화번호</span></label>
		<input id="memphone" type="text" name="memphone"  maxlength="13"/><br/>
	<label for="memaddr"><span>주소</span></label>
		<input id="memaddr" type="text" name="memaddr"  maxlength="50"/>
		<input type="button" onclick="searchAddr()" value="주소 검색"><br/>
		<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div><br/>
	<script type="text/javascript" src="/Ssamtrio/js/searchAddr.js"></script>
</div>
</div>
<br/>
<menu:leftMenuButton02 uri="javascript:void(0)" value="가입하기"/>
</form>
</body>
</html>