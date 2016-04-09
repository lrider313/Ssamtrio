<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<style>
.menu03 {
  display: block;
  position: relative;
/*   float: left /* optional */ */
}
.menu03 .text {
  position: absolute;
  top: 9px; /* in conjunction with left property, decides the text position */
  left: 80px;
  width: 160px; /* optional, though better have one */
   text-align: center; 
/*   첫 글자 색: #96D24B */
/* 글자 색: #3D9D26 */
}
.menu03 .text::first-letter {
    color: #96D24B;
    font-size: medium;
}
.menu03 .text a:link {text-decoration: none; color: #3D9D26;}
.menu03 .text a:visited {text-decoration: none; color: #3D9D26;}
.menu03 .text a:active {text-decoration: none; color: #3D9D26;}
.menu03 .text a:hover {text-decoration: none; color: #96D24B;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$(".changePage").click(function() {
		$(".openLeftSide").attr("class", "closeLeftSide");
	});
});
</script>
</head>
<body>
<!-- <div class="openLeftSide"> -->
<!-- 	<div class="menu03"> -->
<!-- 		<img alt="" src="../image/menu03.png" /> -->
<!-- 		<div class="text"> -->
<!-- 			<a href="../strboard/list.str" id="changePage">입력해주세요3.</a> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<menu:leftMenuButton01 uri="../strboard/list.str" value="입력해주세요1."/>
<menu:leftMenuButton02 uri="../strboard/list.str" value="입력해주세요2."/>
<menu:leftMenuButton03 uri="../strboard/list.str" value="입력해주세요3."/>
</body>
</html>