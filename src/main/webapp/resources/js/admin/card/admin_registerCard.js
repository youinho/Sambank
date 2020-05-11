$(function(){
	
	alert_registered();
	history.replaceState({}, null, null);
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
			url: "/admin/account/update_password",
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
				alert("비밀번호가 변경되었습니다."+result);
				$("input[name='password']").val("");
				$("input[name='confirm_password']").val("");
				
			},
			error : function(result){
				alert("비밀번호 변경에 실패했습니다.");
				$("input[name='password']").val("");
				$("input[name='confirm_password']").val("");
			}
		})
		
		
	})
	
	
	
	$("#searchCS").click(function(e){
		e.preventDefault();
		popup_searchCS();
		
		
	})
	
	$("#ano-list").on("click",".account-item" ,function(e){
		e.preventDefault();
		
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
			}
		})
		
		
		$.ajax({
			url:"/admin/card/get_cardList",
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
				
				let list = JSON.parse(result); 
				let total = 0;
				
				str = ""
				for(let i = 0; i < list.length; i++){
					str += "<a class='dropdown-item card-item' href='#'>"+list[i].card_no+"</a>";
					total += 1;
				}
				str = "<a class='dropdown-item' href='#'>계좌의 카드 : "+total+" 개</a>"+"<div class='dropdown-divider'></div>"+ str;
				$("#card-list").html(str);
				
			}
			
			
			
		})
		
		
	})
	
	$("#call_card_no").click(function(e){
		e.preventDefault();
		
		
		
		
		let form = $("#registerForm");
		let product = form.find("#product").val();
		let cno = form.find("input[name='cno']").val();
		
		if(cno==null||cno==""||product==null||product=="0"){
			return false;
		}
		
		
		$.ajax({
			url : "/admin/card/call_card_no",
			type : "post",
			beforeSend : function(xhr)
            {   
                xhr.setRequestHeader(hn, tk);
            },
			data :{
				product : product,
				cno : cno
			},
			dataType : "text",
			success : function(result){
				$("input[name='card_no']").val(result);
			}
			
			
			
		
			
		})
	
	})
	
	
	
	$("#submitBtn").click(function(e){
		e.preventDefault();
		
		if($("input[name='ano']").val()===""){
			
			return false;
		}
		if($("input[name='card_no']").val()===""){
			
			return false;
		}
		if($("input[name='limit']").val()==="" || $("input[name='limit_month']").val()===""){
			
			return false;
		}
		if($("#c_type").val()=="0"){
			
			return false;
		}
		if($("input[name='password']").val()===""||$("input[name='password']").val()!==$("input[name='confirm_password']").val()){
			alert("비밀번호를 확인해 주세요.");
			return false;
		}
		$("#registerForm").submit();
	})
	
	
	
	$.ajax({
		url : "/admin/card/get_card_product",
		type : "post",
		beforeSend : function(xhr)
	    {   
	        xhr.setRequestHeader(hn, tk);
	    },
	    dataType : "text",
		success : function(result){
			
			let list = JSON.parse(result); 
			if(list.length == 0){
				return;
			}
			
			str = "<option value='0' selected>-- 상품 선택 --</option>"
			for(let i = 0; i < list.length; i++){
				
				str += "<option value='"+list[i].product+"'>"+list[i].p_name+"</option>";		
				
			}
			$("#product").html(str);
			
		},
		error: function(result){
			alert("상품목록을 불러오는 중 오류가 발생했습니다.");
		}
			
			
			

			
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
	$("#registerForm")[0].reset();
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
			
		}
		
		
		
	
		
	})
		
	
	
}