$(function(){
	
	alert_success();
	history.replaceState({}, null, null);
	
	$("input[name='amount']").change(function(){
		if($(this).val() == "" || isNaN($(this).val())){
			return;
		}
		$("input[name='amount_korean']").val(viewKorean($(this).val().trim()));
	})
	$("input[name='remain']").change(function(){
		
		$("input[name='remain_korean']").val(viewKorean($(this).val().trim()));
	})
//	$("#check_from_ano").click(function(e){
//		e.preventDefault();
//		
//		
//		$("input[name='from_name']").val("")
//		let form = $("#withdrawForm");
//		
//		
//		$.ajax({
//			url : "/member/account/transfer/check_ano",
//			type : "post",
//			beforeSend : function(xhr)
//            {   
//                xhr.setRequestHeader(hn, tk);
//            },
//			data :{
//				ano : $("#from_ano").val()
//			},
//			dataType : "text",
//			success : function(result){
//				var vo = JSON.parse(result);
//			
//				$("input[name='from_name']").val(vo.name);				
//				
//			},
//			error: function(result){
//				alert("계좌와 일치하는 정보가 없습니다.");
//			}
//			
//			
//			
//		
//			
//		})
//		
//		
//	})
	
	
	
	

		
		
		
		
		
	
	
	
	
	$("#submitBtn").click(function(e){
		e.preventDefault();
		if($("input[name='hidden_balance']").val() == ""){
			alert("잔액을 확인해 주세요.")
			return false;
		}
		
		if((parseInt($("input[name='hidden_balance']").val())-parseInt($("input[name='amount']").val()))<0){
			alert("출금액을 다시 확인해주세요.")
			return false;
		}
		$("#withdrawForm").submit();
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
	$("#changePwdBtn").click(function(e){
		e.preventDefault();
		
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
			url: "/member/useraccount/check_password",
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
				
			},
			error : function(result){
				alert("비밀번호 일치하지 않습니다.");
				$("input[name='password']").val("");
				$("input[name='confirm_password']").val("");
			}
		})
		
	


	})

})
function popup_password(wInput){
	var pass = window.open("/member/useraccount/"+wInput,"input_passowrd","width=370,height=220, scrollbars=yes, resizable=yes");
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
	$("input[name='amount']").val($("input[name='hidden_balance']").val());

	alert("전액");
})

