<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceForm.jsp</title>
</head>
<body>
<form method="post" action="serviceFormOk.jsp" enctype="multipart/form-data">
	<div>
		<table >
			<tr>
				<th>문의유형</th>
				<td>
					<select>
						<option value="" > 선택 </option>
						<option value=""> 버그신고 </option>
						<option value=""> 파일요청 </option>
						<option value=""> 기타 </option>
					</select>
				</td>
			</tr>	
			<tr>
				<th>ID </th>
				<td><input type="text" value="나중에 DB로 갖고옴"></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text"> @ <input type="text"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" style="width: 420px;"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="50"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="file"> <button type="button">삭제하기</button></td>
			</tr>
			<tr>
			<td colspan="2" style="text-align: right"><button type="submit">수정하기</button> 
			<button type="reset">취소하기</button></td>
			</tr>
		</table>
	</div>
	</form>
</body>

</html>