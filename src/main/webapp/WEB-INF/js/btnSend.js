function btnSend() {
	 if ($("#cstype").val() == "") {
         alert("문의유형을 선택해주세요.");	
         return false;
	} else
	if($('#cstitle').val()==""){
		alert("제목을 입력해주세요.");
		$('#cstitle').focus();
		return false;
	}else 
		if($("#cscont").val()==""){
			alert("내용을 입력해주세요.")
			$('#cscont').focus();
			return false;
		}
}