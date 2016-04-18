<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sitemesh" tagdir="/WEB-INF/tags/sitemesh" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌈박한트리오 - <sitemesh:write property='title'/></title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!-- jQuery_google -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- styles needed by jScrollPane -->
<link type="text/css" href="/Ssamtrio/css/jquery.jscrollpane.css" rel="stylesheet" media="all" />
<!-- the jScrollPane script -->
<script type="text/javascript" src="/Ssamtrio/js/jquery.jscrollpane.min.js"></script>
<!-- the mousewheel plugin - optional to provide mousewheel support -->
<script type="text/javascript" src="/Ssamtrio/js/jquery.mousewheel.js"></script>
<link rel="stylesheet" type="text/css" href="/Ssamtrio/css/str.css" />
<sitemesh:write property='head'/>
</head>
<body>
<nav class="navbar navbar-inverse" id="mainMenu">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand changePage" href="../main/"><img alt="starcraftLogo" src="/Ssamtrio/image/StarCraft_Logo.png" id="mainLogo" /></a>
    </div>
    <ul class="nav navbar-nav">
<!--       <li class="active"><a href="../strboard/list.str">Home</a></li> -->
      <li><a href="../main/" class="changePage">공지사항</a></li> 
      <li><a href="../strboard/list.str" class="changePage">맵자료실</a></li> 
      <li><a href="../gallery/view_gallery.str" class="changePage">프리보드</a></li> 
      <li><a href="../gallery/view_igallery.str" class="changePage">포토보드</a></li> 
      <li><a href="../csboard/serviceList.str" class="changePage">고객센터</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    	<li><a href="../cart/view_cart" class="changePage">장바구니</a></li> 
    <c:if test="${!empty sessionScope.member.memnick}">
		<li><a href="#">${sessionScope.member.memnick }</a></li>
		<li><a href="../main/" class="changePage">로그아웃</a></li>
	</c:if>
    <c:if test="${empty sessionScope.member.memnick}">
      <li><a href="/Ssamtrio/sign/signupForm.str" class="changePage"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="/Ssamtrio/sign/signinForm.str" class="changePage"><span class="glyphicon glyphicon-log-in"></span> Sign In</a></li>
    </c:if>
    </ul>
  </div>
</nav>
<br/><br/>
<sitemesh:write property='body'/>
</body>
</html>