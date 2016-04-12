<%@page import="com.genius.model.Csb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>serviceForm.jsp</title>
</head>
<body>
<% Csb csb = (Csb) request.getAttribute("csb");%>
<form method="post" action="serviceSelectForm.str?csid=${csid }" enctype="multipart/form-data">
	<div>
		<table class="menuStyle">
			<tr>
				<th>문의유형</th>
				<td>
					<select name="cstype" >
						<option value="" > 선택 </option>
						<option value="1" <%if(csb.getCstype()==1) out.println("selected"); %>> 버그신고 </option>
						<option value="2" <%if(csb.getCstype()==2) out.println("selected"); %>> 파일요청 </option>
						<option value="3" <%if(csb.getCstype()==3) out.println("selected"); %>> 기타 </option>
					</select>
				</td>
			</tr>	
			<tr>
				<th>ID </th>
				<td><input type="text" value="${csb.memid }"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" style="width: 420px;" value="${csb.cstitle}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="50" >${csb.cscont}</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="file" value="${csb.csfile}"> <button type="button">삭제하기</button></td>
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