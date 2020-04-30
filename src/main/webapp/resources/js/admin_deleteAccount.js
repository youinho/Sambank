$(function(){
	
	alert_deleted();
	history.replaceState({}, null, null);
	let total_cards = 0;
	//팝업
	
	$("#passwordBtn").click(function(e){
		e.preventDefault();
		popup_password("passpopup");
	})
	
	$("#confirm_passwordBtn").click(function(e){
		e.preventDefault();
		popup_password("passpopup_c");
	})
	
	
	$("#changePwdBtn").click(function(e){
		e.preventDefault();
		if($("input[name='cno']").val()==""){
			$("input[name='cno']").focus();
			return false;
		}
		if($("input[name='ano']").val()==""){
			$("input[name='ano']").focus();
			return false;
		}
		
		
		if($("input[name='password']").val() !== $("input[name='confirm_password']").val()){
			alert("비밀번호가 일치하지 않습니다.");
			$("input[name='password']").val("");
			$("input[name='confirm_password']").val("");
			return false;
		}
		
		if($("input[name='password']").val().length !== 4){
			alert("4자리의 비밀번호를 입력해 주세요");
			return false;
		}else if(!isNaN("input[name='password']")){
			alert("비밀번호는 숫자만 입력가능합니다.");
			return false;
		}
		
		
		
		
		
		$.ajax({
			url: "/admin/account/check_password",
			type : "post",
			beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(hn, tk);
            },
			data : {
				ano : $("input[name='ano']").val(),
				password : $("input[name='password']").val(),
				confirm_password : $("input[name='confirm_password']").val()
			},
			dataType : "text",
			success : function(result){
				alert("비밀번호가 확인되었습니다."+result);
				if($("input[name='balance']").val()==0){
					if(total_cards===0){
						$("#submitBtn").removeAttr("disabled");
					}
				}
			},
			error : function(result){
				alert("비밀번호 일치하지 않습니다.");
				$("input[name='password']").val("");
				$("input[name='confirm_password']").val("");
			}
		})
		
		
	})
	
	
	
	$("#searchCS").click(function(e){
		e.preventDefault();
		popup_searchCS();
		
		
	})
	
	$("#ano-list").on("click",".account-item" ,function(){
		console.log("클릭!")
		$("input[name='p_name']").val("");
		$("input[name='ano']").val("");
		$("input[name='latest_date']").val("");
		$("input[name='balance']").val("");
		$("input[name='password']").val("");
		$("input[name='confirm_password']").val("");
		var ano = $(this).text();
		
		$.ajax({
			url:"/admin/account/get_depositInfo",
			type : "post",
			beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(hn, tk);
            },
			data : {
				ano : ano
			},
			dataType : "text",
			success : function(result){
				var vo = JSON.parse(result);
				
				$("input[name='p_name']").val(vo.p_name);
				$("input[name='ano']").val(vo.ano);
				
				$("input[name='balance']").val(vo.balance);
				if(vo.depositdate!=null){
					var date = new Date(vo.depositdate);
					var year = date.getFullYear();
					var month = date.getMonth()+1;
					month = month >=10?month:"0"+month;
					var day = date.getDate();
					day = day>=10?day:"0"+day;
							
					$("input[name='latest_date']").val(year+"년 "+month+"월 "+day+"일"  );
					
				}else{
					$("input[name='latest_date']").val("거래내역 없음");
				}
				$("#submitBtn").prop("disabled", true);
			}
		})
		
		
		$.ajax({
			url:"/admin/card/get_cardInfo",
			type : "post",
			beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(hn, tk);
            },
			data : {
				ano : ano
			},
			dataType : "text",
			success : function(result){
				console.log("accinfo result : "+result)
				let list = JSON.parse(result); 
				let total = 0;
				
				str = ""
				for(let i = 0; i < list.length; i++){
					str += "<a class='dropdown-item card-item' href='#'>"+list[i].card_no+"</a>";
					total += 1;
				}
				str = "<a class='dropdown-item' href='#'>계좌의 카드 : "+total+" 개</a>"+"<div class='dropdown-divider'></div>"+ str;
				$("#card-list").html(str);
				if(total>0){
					console.log("card X"+total);
					$("#submitBtn").prop("disabled", true);
				}
				total_cards=total;
			}
			
			
			
		})
		
		
		
		
		
	})
	
	function popup_searchCS(){
		var pass = window.open("/admin/popup/searchCS","고객 검색","width=770,height=380, scrollbars=yes, resizable=yes");
	}	
	
	
})

function popup_password(wInput){
	var pass = window.open("/admin/popup/"+wInput,"input_passowrd","width=370,height=220, scrollbars=yes, resizable=yes");
}

function input_password(password, wInput){
	/* alert(wInput);
	alert(password); */
	$("#"+wInput).val(password);
}





function searchCS_callback(cno){
	$("#deleteForm")[0].reset();
	$("input[name='cno']").val(cno);
	
	$.ajax({
		url : "/admin/account/getAccInfo",
		type : "post",
		beforeSend : function(xhr)
        {   
			xhr.setRequestHeader(hn, tk);
        },
		data :{
			cno : cno
		},
		dataType : "text",
		success : function(result){
			console.log("accinfo result : "+result)
			let list = JSON.parse(result); 
			if(list.length == 0){
				return;
			}
			let total = 0;
			let name = list[0].name;
			str = ""
			for(let i = 0; i < list.length; i++){
				if(list[i].ano!=null && list[i].ano!=""){
					str += "<a class='dropdown-item account-item' href='#'>"+list[i].ano+"</a>";
					total += 1;
				}
			}
			str = "<a class='dropdown-item' href='#'>보유 계좌 : "+total+" 개</a>"+"<div class='dropdown-divider'></div>"+ str;
			$("#ano-list").html(str);
			$("#name").val(name);
			$("#submitBtn").prop("disabled", true);
		}
		
		
		
	
		
	})
		
	
	
}