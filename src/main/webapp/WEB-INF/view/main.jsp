<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<style>
.menu04 {
  position: relative;
  clear: right;
  float: right; /* optional */
}
.menu04 .text {
  position: absolute;
  top: 14px; /* in conjunction with left property, decides the text position */
  left: 7px;
  width: 170px; /* optional, though better have one */
  text-align: center; 
/*   첫 글자 색: #96D24B */
/* 글자 색: #3D9D26 */
}
.menu04 .text::first-letter {
    color: #96D24B;
    font-size: medium;
}
.menu04 .text a:link {text-decoration: none; color: #3D9D26;}
.menu04 .text a:visited {text-decoration: none; color: #3D9D26;}
.menu04 .text a:active {text-decoration: none; color: #3D9D26;}
.menu04 .text a:hover {text-decoration: none; color: #96D24B;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
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
<menu:leftMenuButton01 uri="../strboard/list.str" value="입력해주세요1."/>
<menu:rightMenuButton01 uri="../strboard/list.str" value="입력해주세요4."/>
<menu:leftMenuButton02 uri="../strboard/list.str" value="입력해주세요2."/>
<menu:rightMenuButton02 uri="../strboard/list.str" value="입력해주세요5."/>
<menu:leftMenuButton03 uri="../strboard/list.str" value="입력해주세요3."/>
<menu:rightMenuButton03 uri="../strboard/list.str" value="입력해주세요6."/>
</body>
</html>