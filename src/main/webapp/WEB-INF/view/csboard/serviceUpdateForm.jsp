<%@page import="java.io.PrintWriter"%>
<%@page import="com.genius.model.Csb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	$(document).ready(function() {
            $('#delBtn').click(function() {
            	//delBtn 클릭시 
            	// blah 의 경로 (src 를 #으로 바꿈 )
    			$('#blah').attr('src', '#');
            	// file 의 value 값을 빈값으로 바꿈 
    			$('#file').val("");
    		});
            
            
            $('#submitBtn').click(function() {
	            //1. file을 지울때
	            //submitBtn 클릭 즉 수정하기 눌렀을때 blah 가 # 값이면 구분값으로 사용하는 hidInput 을 del 로  
	      
	            if($('#blah').attr("src")=="#") {
	            	$('#hidInput').attr("value", "del");
	            //2. file을 유지할때
	            //submitBtn 클릭 즉 수정하기 눌렀을때 blah 가 # 값이면 구분값으로 사용하는 hidInput 을 keep으로 
	            } else if($('#file').val()=="") {
	            	$('#hidInput').attr("value", "keep");
	            //3. file을 바꿀때
	            } else {
		            //submitBtn 클릭 즉 수정하기 눌렀을때 blah 가 # 값이면 구분값으로 사용하는 hidInput 을 yes로
	            	$('#hidInput').attr("value", "yes");
	            }
	           	$('#csUpdtForm').submit();
			})
    	});
    		
    	
</script>
</head>
<body>
<!-- 1번 시작할떄 
시작할떄부터 csb 라는 모델로 담아서 페이지를 부름(어트르부트) 
그담에 csb 를 인스턴스해서 객체화시킴 
그담에 action 으로 서비스update로 던짐  
 -->
<% Csb csb = (Csb) request.getAttribute("csb");%>
<form id="csUpdtForm" method="post" action="serviceUpdate.str" enctype="multipart/form-data">
<input type="hidden" name="csid" value="${csb.csid }">
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
				<td><input type="text"  name="cstitle" style="width: 420px;" value="${csb.cstitle}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="50" name="cscont"> ${csb.cscont}</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" onchange="readURL(this)" id ="file" name="file"  /> 
				<button id="delBtn"  type="button">삭제하기</button>	
				<img id="blah" src="http://localhost:8082/Ssamtrio/csImage/${csb.csfile}" alt="your image" style="width:200px;"/>
				<input type="hidden" id="hidInput" name="needChg"/>
				</td>
			</tr>
			<tr>
			<td colspan="2" style="text-align: right"><button type="submit" id="submitBtn">수정하기</button> 
			<button type="reset">취소하기</button></td>
			</tr>
		</table>
	</div>
	</form>
</body>

</html>