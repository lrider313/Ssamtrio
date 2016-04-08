<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<style>
.image {
  position: relative;
  float: left /* optional */
}
.image .text {
  position: absolute;
  top: 15px; /* in conjunction with left property, decides the text position */
  left: 80px;
  width: 160px; /* optional, though better have one */
  text-align: center;
/*   첫 글자 색: #96D24B */
/* 글자 색: #3D9D26 */
}
.image .text::first-letter {
    color: #96D24B;
    font-size: medium;
}
a:link {text-decoration: none; color: #3D9D26;}
a:visited {text-decoration: none; color: #3D9D26;}
a:active {text-decoration: none; color: #3D9D26;}
a:hover {text-decoration: none; color: #96D24B;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#changePage").click(function() {
		$(".openLeftSide").attr("class", "closeLeftSide");
	});
});
</script>
</head>
<body>
<div class="openLeftSide">
	<div class="image">
		<img alt="" src="../image/menu01.png" />
		<div class="text">
			<a href="../strboard/list.str" id="changePage">입력해주세요.</a>
		</div>
	</div>
</div>
</body>
</html>