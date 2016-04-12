<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#checkAll").change(function () {
	    $("input:checkbox").prop('checked', $(this).prop("checked"));
	});
});
</script>
</head>
<body>
	<form action="#">
		<p>
			<label><input type="checkbox" id="checkAll" /> 전체선택/해제</label>
		</p>
		<fieldset>
			<c:forEach var="i" begin="1" end="10" step="1">
				<p>
					<label><input type="checkbox" /> File ${i}</label>
				</p>
			</c:forEach>
		</fieldset>
	</form>
	<button>다운</button>
	<button onclick="location='/Ssamtrio/gallery/view_gallery'">취소</button>
</body>
</html>