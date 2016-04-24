$(document).ready(function() {
	/* jScrollPane */
	var scrollBlock = $('.mapCtgr').jScrollPane({mousewheelspeed:50});
	var api = scrollBlock.data('jsp');
	var strf;
	var mapid;
	var isThereDownButton = false;
	$('div.addCartBtn>div.openRightSide>div.menu05>div.text>a').attr("class","addCartButton");
	$('.mapFile,.mapFileInfo,.downButton,.addCartBtn').hide();
	
	$('.getFileInfo').click(function(){
		$.ajax({
			url:'/Ssamtrio/strboard/getFileInfo.str?strid='+$(this).attr("id"),
			dataType:'json',
			success:function(strumf) {
				strf = strumf;
				$('.mapFile').show();
				$('.mapFile').addClass("openRightSide");
				$('.mapid').empty().append("<option value=''>Select</option>");
				for(var i=0; i<strumf.length; i++) {
					$('.mapid').append("<option value='"+ strumf[i].mapid + "'>"+ strumf[i].mapname + "</option>");
				}
				var blinkSel = setInterval(function(){
					if($(".mapid").css("color")=="rgb(255, 0, 0)") {
						$(".mapid").css("color","#3D9D26");
					} else {
						$(".mapid").css("color","red");
					}
				}, 200);
				setTimeout(function() {
					clearInterval(blinkSel);
					$(".mapid").css("color","#3D9D26");
				}, 1000)
				
				//.downButton, .addCartBtn이 보인다면 제거
				if(isThereDownButton==true) {
					$('div.downButton>div.openRightSide,div.addCartBtn>div.openRightSide').attr("class","closeRightSide");
					setTimeout(function() {
						$('.downButton,.addCartBtn,.mapFileInfo').hide();
						$('div.downButton>div.closeRightSide,div.addCartBtn>div.closeRightSide').attr("class","openRightSide");
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
		//downButton, addCartBtn, mapFileInfo가 존재하면 제거
		if(isThereDownButton==true) {
			$('div.downButton>div.openRightSide,div.addCartBtn>div.openRightSide').attr("class","closeRightSide");
			setTimeout(function() {
				if($('.mapid').val()=="") {
					$('.downButton,.addCartBtn,.mapFileInfo').hide();
				}
				$('div.downButton>div.closeRightSide,div.addCartBtn>div.closeRightSide').attr("class","openRightSide");
			}, 250);
			isThereDownButton=false;
		}
		
		//선택한 select의 value의 값이 존재한다면(mapid가 선택된다면)
		if($('.mapid').val() != "") {
			isThereDownButton=true;
			if($('.mapFileInfo,.downButton,.addCartBtn').attr("style")=="display: none;")	$('.mapFileInfo,.downButton,.addCartBtn').show();
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
			var maplod="";
			if(strf[this.selectedIndex-1].maplod=="veryEasy") {
				maplod="매우쉬움";
			} else if(strf[this.selectedIndex-1].maplod=="easy") {
				maplod="쉬움";
			} else if(strf[this.selectedIndex-1].maplod=="normal") {
				maplod="보통";
			} else if(strf[this.selectedIndex-1].maplod=="hard") {
				maplod="어려움";
			} else if(strf[this.selectedIndex-1].maplod=="hardcore") {
				maplod="매우어려움";
			} 
			$("#mapLod").text("난이도: "+maplod);
			
			var maptime="";
			if(strf[this.selectedIndex-1].maptime=="half") {
				maptime="약30분";
			} else if(strf[this.selectedIndex-1].maptime=="aHour") {
				maptime="약1시간";
			} else if(strf[this.selectedIndex-1].maptime=="twoHour") {
				maptime="약2시간";
			} else if(strf[this.selectedIndex-1].maptime=="soLong") {
				maptime="2시간이상";
			} 
			$("#mapTime").text("총시간: "+maptime);
			$("#mapMana").text("마나무한여부: "+(strf[this.selectedIndex-1].mapmana=="y"?"無":"有"));
			$('div.downButton>div.openRightSide>div.menu04>div.text>a').attr("href","/Ssamtrio/strboard/downloadSMF.str?mapid="+$(this).val());
			mapid=strf[this.selectedIndex-1].mapid;
		}
	});
	
	$('.addCartButton').click(function() {
		$.ajax({
			url:'/Ssamtrio/cart/addCart.str',
			type:'GET',
			data:{"mapid": mapid},
			dataType:'json',
			success:function(msg) {
				alert(msg.state);
			}
		});
	});
});