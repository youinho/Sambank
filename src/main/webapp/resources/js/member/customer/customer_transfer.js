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
	$("#check_from_ano").click(function(e){
		e.preventDefault();
		
		
		$("input[name='from_name']").val("")
		let form = $("#withdrawForm");
		
		
		$.ajax({
			url : "/member/account/transfer/check_ano",
			type : "post",
			beforeSend : function(xhr)
            {   
                xhr.setRequestHeader(hn, tk);
            },
			data :{
				ano : $("#from_ano").val()
			},
			dataType : "text",
			success : function(result){
				var vo = JSON.parse(result);
			
				$("input[name='from_name']").val(vo.name);				
				
			},
			error: function(result){
				alert("계좌와 일치하는 정보가 없습니다.");
			}
			
			
			
		
			
		})
		
		
	})
	
	
	
	

		
		
		
		
		
	
	
	
	
	$("#submitBtn").click(function(e){
		e.preventDefault();
		if($("input[name='remain']").val() == ""){
			alert("잔액을 확인해 주세요.")
			return false;
		}
		
		if((parseInt($("input[name='remain']").val())-parseInt($("input[name='amount']").val()))<0){
			alert("출금액을 다시 확인해주세요.")
			return false;
		}
		$("#withdrawForm").submit();
	})
	
	
	
	
	
	
	
	//팝업
	
	
	$("#searchCS").click(function(e){
		e.preventDefault();
		popup_searchCS();
		
		
	})
	
	
	
	function popup_searchCS(){
		var pass = window.open("/admin/popup/searchCS","고객 검색","width=770,height=380, scrollbars=yes, resizable=yes");
	}	
	
	
	
})



