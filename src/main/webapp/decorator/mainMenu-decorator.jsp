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
<!--  str.css -->
	<link rel="stylesheet" type="text/css" href="/Ssamtrio/css/str.css" />
<!-- menu.js -->
	<script type="text/javascript" src="/Ssamtrio/js/menu.js"></script>
<sitemesh:write property='head'/>
</head>
<body>
<nav class="navbar navbar-inverse" id="mainMenu">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand inToTheMenu" href="/Ssamtrio/main/"><img alt="starcraftLogo" src="/Ssamtrio/image/StarCraft_Logo.png" id="mainLogo" /></a>
    </div>
    <ul class="nav navbar-nav">
<!--       <li class="active"><a href="/Ssamtrio/strboard/list.str">Home</a></li> -->
      <li><a href="/Ssamtrio/main/" class="inToTheMenu">공지사항</a></li> 
      <li><a href="/Ssamtrio/strboard/list.str" class="inToTheMenu">맵자료실</a></li> 
      <li><a href="/Ssamtrio/freeboard/freeBoardList.str" class="inToTheMenu">프리보드</a></li> 
      <li><a href="/Ssamtrio/gallery/view_igallery.str" class="inToTheMenu">포토보드</a></li> 
      <li><a href="/Ssamtrio/csboard/serviceList.str" class="inToTheMenu.str">고객센터</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    	<li><a href="/Ssamtrio/cart/view_cart" class="inToTheMenu">장바구니</a></li> 
    <c:if test="${sessionScope.member.memauth==1 }">
	    <li><a href="javascript:void(0)">회원 관리</a>
    </c:if>
    <c:if test="${!empty sessionScope.member.memnick}">
		<li><a href="javascript:void(0)">${sessionScope.member.memnick }</a></li>
		<li><a href="/Ssamtrio/sign/signOut.str" class="inToTheMenu">Sign Out</a></li>
	</c:if>
    <c:if test="${empty sessionScope.member.memnick}">
      <li><a href="/Ssamtrio/sign/signupForm.str" class="inToTheMenu"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="/Ssamtrio/sign/signinForm.str" class="inToTheMenu"><span class="glyphicon glyphicon-log-in"></span> Sign In</a></li>
    </c:if>
    </ul>
  </div>
</nav>
<br/><br/>
<sitemesh:write property='body'/>
</body>
</html>