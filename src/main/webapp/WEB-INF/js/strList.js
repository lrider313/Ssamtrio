$(document).ready(function() {
	/* jScrollPane */
	var scrollBlock = $('.mapCtgr').jScrollPane({mousewheelspeed:50});
	var api = scrollBlock.data('jsp');
	var strf;
	var isThereDownButton = false;
	$('.mapFile,.mapFileInfo,.downButton').hide();
	$('.getFileInfo').click(function(){
		$.ajax({
			url:'getFileInfo.str?strid='+$(this).attr("id"),
			dataType:'json',
			success:function(strumf) {
				strf = strumf;
				$('.mapFile').show();
				$('.mapFile').addClass("openRightSide");
				$('.mapid').empty().append("<option value=''>Select</option>");
				for(var i=0; i<strumf.length; i++) {
					$('.mapid').append("<option value='"+ strumf[i].mapid + "'>"+ strumf[i].mapname + "</option>");
				}
				
				//.downButton이 보인다면 제거
				if(isThereDownButton==true) {
					$('div.downButton>div.openRightSide').attr("class","closeRightSide");
					setTimeout(function() {
						$('.downButton,.mapFileInfo').hide();
						$('div.downButton>div.closeRightSide').attr("class","openRightSide");
					}, 250);
					isThereDownButton=false;
				}
				
				//맵정보로 받아온 값이 없다면
				if(strumf == "") {
					alert("해당 맵 카테고리에 upload된 Map 파일이 아직 없네요.^^; \n빠른 시일 내에 준비하겠습니다!");
				}
			}
		});
	});

	$('.mapid').change(function(){
		//downButton, mapFileInfo가 존재하면 제거
		if(isThereDownButton==true) {
			$('div.downButton>div.openRightSide').attr("class","closeRightSide");
			setTimeout(function() {
				if($('.mapid').val()=="") {
					$('.downButton,.mapFileInfo').hide();
				}
				$('div.downButton>div.closeRightSide').attr("class","openRightSide");
			}, 250);
			isThereDownButton=false;
		}
		
		//선택한 select의 value의 값이 존재한다면(mapid가 선택된다면)
		if($('.mapid').val() != "") {
			isThereDownButton=true;
			if($('.mapFileInfo,.downButton').attr("style")=="display: none;")	$('.mapFileInfo,.downButton').show();
			$("#mapName").text("맵이름: "+strf[this.selectedIndex-1].mapname);
			$("#mapCount").text("맵다운로드수: "+strf[this.selectedIndex-1].mapcount);
			$("#mapNumber").text("맵인원수: "+strf[this.selectedIndex-1].mapminn+" ~ "+strf[this.selectedIndex-1].mapmaxn);
			$("#mapVersion").text("맵버전: "+strf[this.selectedIndex-1].mapver);
			if(strf[this.selectedIndex-1].mapcrt=="") {
				$("#mapCrt").hide();
			} else {
				$("#mapCrt").show();
				$("#mapCrt").text("맵제작자: "+strf[this.selectedIndex-1].mapcrt);
			}
			$("#mapMana").text("마나무한여부: "+strf[this.selectedIndex-1].mapmana);
			$('div.downButton>div.openRightSide>div.menu04>div.text>a').attr("href","/Ssamtrio/strboard/downloadSMF.str?mapid="+$(this).val());
		}
	});
});