<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
/* p:게시판 스타일 */
div.img {
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 180px;
}

div.img:hover {
    border: 1px solid #777;
}

div.img img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

.a {
	width: 1000px;
}

span {
	margin-left: 500px;
}
</style>
<meta charset="UTF-8">
<title>wtr</title>
</head>
<body>
	<h1 align="center">이미지게시판</h1>
	<p align="right">
	</p>
	<table>
	<td>
	<div class="img">
		<a target="_blank" href="fjords.jpg"> <img src="fjords.jpg"
			alt="Fjords" width="300" height="200">
		</a>
		<div class="desc">Add a description of the image here</div>
	</div>
	</td>
<td>
	<div class="img">
		<a target="_blank" href="forest.jpg"> <img src="forest.jpg"
			alt="Forest" width="300" height="200">
		</a>
		<div class="desc">Add a description of the image here</div>
	</div>
</td>
<td>
	<div class="img">
		<a target="_blank" href="lights.jpg"> <img src="lights.jpg"
			alt="Northern Lights" width="300" height="200">
		</a>
		<div class="desc">Add a description of the image here</div>
	</div>
</td>
<td>
	<div class="img">
		<a target="_blank" href="mountains.jpg"> <img src="mountains.jpg"
			alt="Mountains" width="300" height="200">
		</a>
		<div class="desc">Add a description of the image here</div>
	</div>
	</td>
	</table>
	<p align="center">
	<input type="text">
	<button>검색</button>
	</p>
	</p>
	<span> <input type="button" value="글쓰기" class="input_button"
		onclick="location='write_gallery'">
	</span>
</body>
</html>