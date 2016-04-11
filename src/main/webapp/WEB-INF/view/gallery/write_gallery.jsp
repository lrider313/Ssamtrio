<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	//http://bloodguy.tistory.com/entry/JavaScript-inputfile-%EB%A1%9C%EC%BB%AC-%EC%9D%B4%EB%AF%B8%EC%A7%80-%ED%8C%8C%EC%9D%BC-%EB%AF%B8%EB%A6%AC%EB%B3%B4%EA%B8%B0-preview-local-image-file
	
	$.fn.setPreview = function(opt) {
		"use strict"
		var defaultOpt = {
			inputFile : $(this),
			img : null,b
			w : 200,
			h : 200
		};
		$.extend(defaultOpt, opt);

		var previewImage = function() {
			if (!defaultOpt.inputFile || !defaultOpt.img)
				return;

			var inputFile = defaultOpt.inputFile.get(0);
			var img = defaultOpt.img.get(0);

			// FileReader
			if (window.FileReader) {
				// image 파일만
				if (!inputFile.files[0].type.match(/image\//))
					return;

				// preview
				try {
					var reader = new FileReader();
					reader.onload = function(e) {
						img.src = e.target.result;
						img.style.width = defaultOpt.w + 'px';
						img.style.height = defaultOpt.h + 'px';
						img.style.display = '';
					}
					reader.readAsDataURL(inputFile.files[0]);
				} catch (e) {
					// exception...
				}
				// img.filters (MSIE)
			} else if (img.filters) {
				inputFile.select();
				inputFile.blur();
				var imgSrc = document.selection.createRange().text;

				img.style.width = defaultOpt.w + 'px';
				img.style.height = defaultOpt.h + 'px';
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
						+ imgSrc + "\")";
				img.style.display = '';
				// no support
			} else {
				// Safari5, ...
			}
		};

		// onchange
		$(this).change(function() {
			previewImage();
		});
	};

	$(document).ready(function() {
		var opt = {
			img : $('#img_preview'),
			w : 200,
			h : 200
		};

		$('#input_file').setPreview(opt);
	});

	$(document).ready(function(){
		$("#writeButton").click(function(){
			alert($("#container").attr("container"));
		})
	})
</script>
<style>
table { 
  width:1200px;
  border-collapse: collapse; 
  
}
/* Zebra striping */
tr:nth-of-type(odd) { 
  background: #black; 
}
th { 
  background: #333; 
  color: white; 
  font-weight: normal; 
}
td, th { 
  padding: 6px; 
  border: 1px solid red; 
  text-align: left; 
}

.a {
	width: 1000px;
}

span {
	margin-left: 270px;
}

#container {
	background-color: black;
	height: 400px;
	margin: 0 auto;
	padding: 8px;
}
/* textarea {display:none}; */
</style>
<title>Insert title here</title>
</head>
<body>
	<form name="writeTable" action="view_gallery" method="post">
	<div id="#openLeftSide">
		<table name="t1">
			<tr>
				<td>제목</td>
				<td><input  type="text" name="title" value="제목"  ></td>
				<td>${ipaddress}ip</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<div rows="40" cols="15"id="container" contentEditable="true"></div>
			<tr>
				<td>파일첨부</td>
				<td><input type="file" id="input_file" /> <br /> <img
					id="img_preview" style="display: none;" /></td>
			</tr>
			</td>
			</tr>
		</table>
		</div>
	</form>
	<textarea name="hide"></textarea>
	<button onclick="location='view_gallery'">취소</button>
	<span><button id="writeButton">글작성</button></span>
</body>
</html>