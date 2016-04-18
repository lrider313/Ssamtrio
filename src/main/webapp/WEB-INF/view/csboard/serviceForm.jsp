<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceForm.jsp</title>
<script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
</script>
</head>
<body>
<form method="post" action="servicePro.str" enctype="multipart/form-data">
	<div  class="openLeftSide" style="display: inline-block;">
		<table >
			<tr>
					<td colspan="2"><label id="boardid">게시판 선택</label> <select name="boardid"
						id="boardid">
							<c:forEach items="${boardList}" var="bId">
								<option value="${bId.boardid}">${bId.boardtitle}</option>
							</c:forEach>
					</select></td>
				</tr>
			<tr>
				<th>문의유형</th>
				<td>
					<select name="cstype">
						<option value="0" > 선택 </option>
						<option value="1"> 버그신고 </option>
						<option value="2"> 파일요청 </option>
						<option value="3"> 기타 </option>
					</select>
				</td>
			</tr>	
			<tr>
				<th>ID </th>
				<td><input type="text" name="memid"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" style="width: 420px;" name="cstitle"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="50" name="cscont"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" onchange="readURL(this)" name="file"/> <button type="button">삭제하기</button><img id="blah" src="#" alt="your image" style="width:200px;"/></td>
       			 
			</tr>
			<tr>
			<td colspan="2" style="text-align: right"><button type="submit">문의하기</button> 
			<button type="reset">취소하기</button></td>
			</tr>
		</table>
	</div>
	</form>

 
</body>

</html>