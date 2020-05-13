$(function (){
	
	alert_success();
	history.replaceState({}, null, null);
	
	
	$("#submitBtn").click(function (e){
		e.preventDefault();
		let form = $("#depositForm");
		console.log($("input[name='balance']").val());
		if($("input[name='balance']").val() == ""){
			alert("잔액을 확인해 주세요.")
			return false;
		}
		
		if($("input[name='ano']").val() == $("input[name='from_ano']").val()){
			alert("계좌가 동일합니다.")
			return false;
		}
		
		if((parseInt($("input[name='balance']").val())-parseInt($("input[name='amount']").val()))<0){
			alert("출금액을 다시 확인해주세요.");
			return false;
		}
		if($("input[name='ano']").val()==""){
			$("input[name='ano']").focus();
			return false;
		}
		
		if($("input[name='amount']").val()==""){
			$("input[name='amount']").focus();
			return false;
		}
		
		if($("input[name='password']").val().length !== 4){
			alert("4자리의 비밀번호를 입력해 주세요");
			return false;
		}else if(!isNaN("input[name='password']")){
			alert("비밀번호는 숫자만 입력가능합니다.");
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

	    var ajax_ano_result=true;
//		$("#from_anoCheckBtn").click(function(e){
//		e.preventDefault();
		
		$.ajax({
			url: "/member/useraccount/exists_deposit_ano",
			type : "post",
			beforeSend : function(xhr)
	        {   
				xhr.setRequestHeader(hn, tk);
	        },
			data : {
				ano : $("input[name='from_ano']").val(),
			},
			async:false,
			dataType : "text",
			success : function(result){
				console.log(result);
				if(result=="true")
					alert("계좌가 확인되었습니다.");
				else{
					alert("보낼 계좌가 존재하지 않습니다1.");
					$("input[name='from_ano']").val("");
					
					ajax_ano_result = false;
				}
					
			},
			error : function(result){
				alert("보낼 계좌가 존재하지 않습니다.");
				$("input[name='from_ano']").val("");
				
				ajax_ano_result = false;
			}
		})
		if(ajax_password_result&&ajax_ano_result){
				$("#depositForm").submit();
		}
		else
			return false;
	
			
	})
	

	
	
})	
	//팝업
	
		
	$("#passwordBtn").click(function(e){
		e.preventDefault();
		popup_password("passpopup");
	})

//	$("#confirm_passwordBtn").click(function(e){
//		e.preventDefault();
//		popup_password("passpopup_c");
//	})
//	$("#changePwdBtn").click(function(e){
//		e.preventDefault();
//		
//		if($("input[name='ano']").val()==""){
//			$("input[name='ano']").focus();
//			return false;
//		}
//		
//		
//		if($("input[name='password']").val().length !== 4){
//			alert("4자리의 비밀번호를 입력해 주세요");
//			return false;
//		}else if(!isNaN("input[name='password']")){
//			alert("비밀번호는 숫자만 입력가능합니다.");
//			return false;
//		}
//		$.ajax({
//			url: "/member/useraccount/check_password",
//			type : "post",
//			beforeSend : function(xhr)
//	        {   
//				xhr.setRequestHeader(hn, tk);
//	        },
//			data : {
//				ano : $("input[name='ano']").val(),
//				password : $("input[name='password']").val(),
//				confirm_password : $("input[name='confirm_password']").val()
//			},
//			dataType : "text",
//			success : function(result){
//				alert("비밀번호가 확인되었습니다."+result);
//				
//			},
//			error : function(result){
//				alert("비밀번호 일치하지 않습니다.");
//				$("input[name='password']").val("");
//				$("input[name='confirm_password']").val("");
//			}
//		})
//		
//	
//
//
//	})
//
//})
function popup_password(wInput){
	var pass = window.open("/member/useraccount/"+wInput,"input_passowrd","width=500,height=320, scrollbars=yes, resizable=yes");
}

function input_password(password, wInput){
	/* alert(wInput);
	alert(password); */
	$("#"+wInput).val(password);
}




$("#M100").button().on("click", function() {
	$("input[name='amount']").val(1000000);

	alert("백만원");
})

$("#M10").button().on("click", function() {
	$("input[name='amount']").val(100000);

	alert("십만원");
})

$("#M5").button().on("click", function() {
	$("input[name='amount']").val(50000);

	alert("오만원");
})

$("#M1").button().on("click", function() {
	$("input[name='amount']").val(10000);

	alert("만원");
})

$("#MAll").button().on("click", function() {
	$("input[name='amount']").val($("input[name='balance']").val());

	alert("전액");
})

