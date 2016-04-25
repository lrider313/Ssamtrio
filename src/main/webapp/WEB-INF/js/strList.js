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

	$('body').on('click','.mdfyMCtgrBtn',function() {
		var id = $(this).parent().parent().children("a").attr("id"); //			alert(id);
		$(this).parent().parent().addClass("hideMenu"+id);
		setTimeout(function() {
//			var ctgrText = $('.hideMenu').html(); //			alert(ctgrText);
			var strtitle = $('.hideMenu'+id+'>a[id='+id+']').text(); //			alert(strtitle);
			var strcont = $('.hideMenu'+id+'>a[id='+id+']').attr("title"); //		alert(strcont);
			
			var mdfyForm1 = "<input type='text' value='"+strtitle+"' class='strtitle"+id+"'/>"+
						   "<span><a href='javascript:void(0)' class='next"+id+" btn btn-default btn-xs'>다음</a> ";
			var mdfyForm2 = "<input type='text' value='"+strcont+"' class='strcont"+id+"'/>"+
							"<span><a href='javascript:void(0)' class='cpltMdfyMCtgrBtn"+id+" btn btn-default btn-xs'>완료</a></span>";
			
			$('.hideMenu'+id).removeClass("hideMenu"+id).html(mdfyForm1).addClass("showMenu");
			
			$('.next'+id).click(function() {
				if($('.strtitle'+id).val()==""){
					alert("값을 입력해야합니다.");
					return false;
				}
				$('input[class=strtitle'+id+']').parent().addClass("hideMenu"+id);
				setTimeout(function() {
					var chgdStrtitle = $('.strtitle'+id).val();
					var chgdStrcont;
					$('.hideMenu'+id).removeClass("hideMenu"+id).html(mdfyForm2).addClass("showMenu");
					$('.cpltMdfyMCtgrBtn'+id).click(function() {
						if($('.strcont'+id).val()=="") {
							alert("값을 입력해야합니다.");
							return false;
						}
						chgdStrcont = $('.strcont'+id).val();
						var strumn = {"strid":id,"strtitle":chgdStrtitle,"strcont":chgdStrcont};
						$.ajax({
							url: '/Ssamtrio/strboard/updateOne.str',
							contentType : 'application/json; charset=utf-8',
							type: 'POST',
							data: JSON.stringify(strumn),
							dataType: 'json',
							success: function(msg) {
								alert(msg.state);
							}
						});
						$(this).parent().parent().addClass("hideMenu"+id);
//						alert(chgdStrcont);
//						alert(chgdStrtitle);
						setTimeout(function() {
							var ctgrText = "<a href='javascript:void(0)' title='"+chgdStrcont+"'" +
										   "class='getFileInfo' id='"+id+"'>"+chgdStrtitle+"</a>" +
										   "<span><a href='javascript:void(0)' class='mdfyMCtgrBtn btn btn-default btn-xs'>수정</a> " +
										   "<a href='javascript:void(0)' class='delMCtgrBtn btn btn-default btn-xs'>삭제</a></span>";
							$('.hideMenu'+id).removeClass("hideMenu"+id).html(ctgrText).addClass("showMenu");
						}, 250);
					});
				}, 250);
			});
			

			
			setTimeout(function() {
				$('.showMenu').removeClass("showMenu");
			}, 250);
		}, 250);
	});
	
	$('body').on('click','.delMCtgrBtn',function() {
		var del = confirm("삭제하면 하위의 맵파일들도 삭제됩니다.\n계속하시겠습니까?");
		if(del==true) {
			var strid = $(this).parent().parent().children('a').attr("id");
			$.ajax({
				url:'/Ssamtrio/strboard/deleteOne.str',
				type:'GET',
				data: {"strid":strid},
				dataType:'json',
				success:function(msg) {
					alert(msg.state);
//					alert($('li>a[id='+strid+']').attr("class"));
					$('li>a[id='+strid+']').parent().attr("class","closeRightSide");
					setTimeout(function() {
						$('li[class=closeRightSide]').hide();
						api.reinitialise();
					}, 250);
				}
			});
		}
	});
});