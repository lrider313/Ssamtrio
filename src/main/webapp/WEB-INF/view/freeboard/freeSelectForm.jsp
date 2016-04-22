<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>freeSelectForm.jsp</title>
<style type="text/css">
.menuStyleHDH{
margin: 0px 50px 10px 50px;
  display: inline-block; 
  background-color:#080808;
  color: #3D9D26;
  opacity: 0.95;
  border: 3px groove #781706;
  border-radius: 5px;
  padding: 15px;
}
table {
  text-align: center;
}

</style>
</head>
<body>

<div  class="menuStyleHDH openLeftSide">
<table >
<tr>
<th width="73" name="memid">${fb.memid }</th>
<th width="500" style="text-align: center" name="fbtitle">${fb.fbtitle }</th>
<th width="70" name="fbcount">${fb.fbcount}</th>
<th width="70" name="fbrec">${fb.fbrec}</th>
<th>
</tr>
</table>
</div>
<div class="menuStyleHDH openLeftSide">
<table width="710" >
<tr>
					<th>내용</th>
				<td name="fbcont">${fb.fbcont }</td>
				</tr>
				<tr>
				<td colspan="2"><a href=""><img src="/Ssamtrio/image/heart.png" style="width:70px;" /></a></td>
				</tr>
</table>
</div>

<div class="menuStyleHDH openLeftSide">
<table width="710">
<tr>
<th>아이디 , (date)</th>
<td> 댓글내용 </td>
</tr>
</table>
</div>
 

	<form method="post" action="">
		<div >
			</div>
				<table class="menuStyle openLeftSide" style="display: inline-block ;  ">
			<tr>
				<th>로그인한 아이디</th>
				<td><input type="text" style="width: 200px"/></td>
				<td><button>입력</button></td>
			</tr>
			</table>
		</div>
	</form>
<menu:leftMenuButton03 uri="javascript:void(0)" value="수정"/>
<menu:leftMenuButton03 uri="javascript:void(0)" value="삭제"/>
<menu:leftMenuButton02 uri="freeBoardList.str" value="목록"/>
<menu:leftMenuButton02 uri="freeBoardWrite.str" value="글쓰기"/>

</body>
</html>