<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ attribute name="property" required="true" %>

<%
	out.print("<sitemesh:write property=\""+property+"\"/>");
%>