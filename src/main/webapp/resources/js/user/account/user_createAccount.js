$(function(){
	
	/*alert_created();
	history.replaceState({}, null, null);
	*/
	
	
	$("#call_ano").click(function(e){
		e.preventDefault();
		
		
		
		
		let form = $("#createForm");
		let product = form.find("#product").val();
		let cno = form.find("input[name='cno']").val();
		
		if(cno==null||cno==""||product==null||product=="0"){
			return false;
		}
		
		
		$.ajax({
			url : "/admin/account/call_ano",
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
				$("input[name='ano']").val(result);
			}
			
			
			
		
			
		})
		
		
	})
	
	
	$("#type").change(function(){
		
		let type = $(this).val();
		$.ajax({
			url : "/admin/account/getProduct",
			type : "post",
			beforeSend : function(xhr)
            {   
                xhr.setRequestHeader(hn, tk);
            },
			data :{
				type : type
			},
			dataType : "text",
			success : function(result){
				let list = JSON.parse(result); 
				
				if(list.length == 0){
					return;
				}
				let str = "<option value='0' selected>-- 상품 선택 --</option>";
				for(let i = 0; i < list.length; i++){
					str += "<option value='"+list[i].product+"'>"+list[i].p_name+"</option>"
				}
				$("#product").html(str);
				
				
			}
			
			
			
		
			
		})
		
	})
	
	
	
	
	
	//팝업
	
	$("#passwordBtn").click(function(e){
		e.preventDefault();
		popup_password("passpopup");
	})
	
	$("#confirm_passwordBtn").click(function(e){
		e.preventDefault();
		popup_password("passpopup_c");
	})
	
	$("#searchCS").click(function(e){
		e.preventDefault();
		popup_searchCS();
		
		
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
					str += "<a class='dropdown-item' href='#'>"+list[i].ano+"</a>";
					total += 1;
				}
			}
			str = "<a class='dropdown-item' href='#'>보유 계좌 : "+total+" 개</a>"+"<div class='dropdown-divider'></div>"+ str;
			$("#ano-list").html(str);
			$("#name").val(name);
			
			//$("#total").text("보유 계좌 : "+total+" 개");
			
			
		}
		
		
		
	
		
	})
		
	
	
}
