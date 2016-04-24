<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="menu" uri="/WEB-INF/tlds/menuButton.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>freeSelectForm.jsp</title>
<script type="text/javascript">
function Rec() {
	document.from.rec.value="1";
	document.form.submit();
}
</script>
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

<!-- 
추천테이블 생성
계정 사용 시 

no int 
fdid int 
id varchar 없을시 text (이건 db 마다 다름 )

처음에 뷰단에서 left join 사용 하여 추천했는지 체크 

업데이트시 fb테이블에 추천 카운트 컬럼 +1 과 동시에 (추천카운트를 안쓰는게 더 좋음)
(신규 테이블에 하위쿼리로 select count(1) from 신규테이블 where fbid 로 불러서 카운트 총수를 구하는게 더 맞음)
추천테이블에 fbid 하나 + 1 하고 
아이디 까지 인서트 




조회수테이블 생성 (위와 동일)



 -->

	<form name="form" method="post" action="freeSelectForm.str">
	<input type="hidden" name="rec" value="0">
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
				<td colspan="2" onclick="Rec()" id="name"><a href=""><img src="/Ssamtrio/image/heart.png" style="width:70px;" /></a></td>
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
<menu:leftMenuButton03 uri="javascript:void(0)" value="수정"/>
<menu:leftMenuButton03 uri="javascript:void(0)" value="삭제"/>
<menu:leftMenuButton02 uri="freeBoardList.str" value="목록"/>
<menu:leftMenuButton02 uri="freeBoardWrite.str" value="글쓰기"/>

	</form>
	
</body>
</html>