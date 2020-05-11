
$(function(){
	
//	$("input[name='eng_name']").change(function(){
//		$(this).val($(this).val().toUpperCase());
//	})
	
	
	$(document).ready(function(){
		$('select[name=account]').click(function(e) {
			e.preventDefault();
			var ano = $(this).val();
		
//			console.log(ano);
			$.ajax({
				url:"/member/useraccount/get_deposit_customerInfo",
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
					console.log(vo.createDate);
					$("input[name='name']").val(vo.name);
					$("input[name='birth']").val(vo.birth);
					$("input[name='type_text']").val(typeTrans(String(vo.type)));
					$("input[name='type']").val(vo.type);
					$("input[name='p_name']").val(vo.p_name);
					$("input[name='ano']").val(vo.ano);
					$("input[name='createDate_text").val(dateformat(vo.createDate));
					$("input[name='createDate']").val(vo.createDate);
					$("input[name='balance_text']").val(viewRest(String(vo.balance)));
					$("input[name='balance']").val(vo.balance);
				}
			})
			
		})
		
	})
	$("#submitBtn").click(function (e){
//		e.preventDefault();
		let from=$("#accountDelete");
		
		if($("input[name='ano']").val()==""){
			console.log("계좌번호없음");
			$("input[name='ano']").focus();
			return false;
		}
		
		var ajax_password_result = true;
		$.ajax({
			url: "/member/useraccount/check_password",
			type : "post",
			beforeSend : function(xhr)
	        {   
				xhr.setRequestHeader(hn, tk);
	        },
	        async:false,
			data : {
				ano : $("input[name='ano']").val(),
				password : $("input[name='password']").val(),
				confirm_password : $("input[name='password']").val()
			},
			dataType : "text",
			success : function(result){
				alert("비밀번호가 확인되었습니다."+result);
				
			},
			error : function(result){
				alert("비밀번호 일치하지 않습니다.");
				$("input[name='password']").val("");
				ajax_password_result = false;
				return false;
				
			}
		})
		return ajax_password_result;
		$("#accountDelete").submit();
	})
})	
	//팝업
	$("#passwordBtn").click(function(e){
		e.preventDefault();
		popup_password("passpopup");
	

	
})

function popup_password(wInput){
	var pass = window.open("/member/useraccount/"+wInput,"input_passowrd","width=500,height=320, scrollbars=yes, resizable=yes");
}

function input_password(password, wInput){
	/* alert(wInput);
	alert(password); */
	$("#"+wInput).val(password);
}

function typeTrans(type){
	if(type=="1"){
		return "예금";
	}
	else if(type=="2"){
		return "적금";
	}
	else if(type=="3"){
		return "대출";
	}
}
function viewRest(restNumber) {
	return restNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function dateformat(changeDate){
	var myDate=new Date(changeDate);
	return myDate.getFullYear() + "-" +('0' + (myDate.getMonth()+1)).slice(-2)+ '-' +  ('0' + myDate.getDate()).slice(-2);
	
}