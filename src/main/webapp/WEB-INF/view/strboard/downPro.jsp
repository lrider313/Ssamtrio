<%@page import="com.genius.model.Strumf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>downPro.jsp</title>
</head>
<body>
<%  Strumf strumf = (Strumf) request.getAttribute("strumf");
	Integer mapid = strumf.getMapid();
	response.sendRedirect("/strboard/downloadSMF.str?mapid="+mapid); %>
</body>
</html>