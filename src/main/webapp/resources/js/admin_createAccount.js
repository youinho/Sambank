$(function(){
	
	alert_created();
	
	
	
	
	$("#call_ano").click(function(e){
		e.preventDefault();
		
		
		
		console.log("call_ano")
		let form = $("#createForm");
		let product = form.find("#product").val();
		let cno = form.find("input[name='cno']").val();
		
		if(cno==null||cno==""||product==null||product=="0"){
			return false;
		}
		
		
		$.ajax({
			url : "/admin/call_ano",
			type : "post",
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
		console.log("type changed");
		let type = $(this).val();
		$.ajax({
			url : "/admin/getProduct",
			type : "post",
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
		var pass = window.open("/popup/searchCS","고객 검색","width=770,height=380, scrollbars=yes, resizable=yes");
	}	
	
	
	
})

function popup_password(wInput){
	var pass = window.open("/popup/"+wInput,"input_passowrd","width=370,height=220, scrollbars=yes, resizable=yes");
}

function input_password(password, wInput){
	/* alert(wInput);
	alert(password); */
	$("#"+wInput).val(password);
}

function alert_created(){
	let created = "${created}";
	console.log("alert_created");
	if(created ==="" || history.state){
		return;
	}
	
	
	if(created != "" && created != null){
		if(created=="true"){
			alert("${name}"+"님의 계좌등록이 완료되었습니다.");
		}else if(created=="false"){
			alert("계좌등록에 실패했습니다.");
		}
	}
}

function searchCS_callback(cno){
	$("input[name='cno']").val(cno);
	
	
	$.ajax({
		url : "/admin/getAccInfo",
		type : "post",
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