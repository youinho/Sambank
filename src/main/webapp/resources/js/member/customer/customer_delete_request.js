
$(function(){
	
//	$("input[name='eng_name']").change(function(){
//		$(this).val($(this).val().toUpperCase());
//	})
	
	$(document).ready(function(){
		$('select[name=account]').change(function(e) {
			e.preventDefault();
			var ano = $(this).val();
		
			console.log(ano);
			$.ajax({
				url:"/member/useraccount/get_depositInfo",
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
//					$("input[name='type_text']").val(typeTrans(String(vo.type)));
					$("input[name='p_name']").val(vo.p_name);
					$("input[name='ano']").val(vo.ano);
					$("input[name='balance']").val(viewRest(String(vo.balance)));
				}
			})
			
				$.ajax({
				url:"/member/useraccount/get_customerInfo",
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
//					$("input[name='type_text']").val(typeTrans(String(vo.type)));
					$("input[name='p_name']").val(vo.p_name);
					$("input[name='ano']").val(vo.ano);
					$("input[name='balance']").val(viewRest(String(vo.balance)));
				}
			})
			
			
			
			
			
			
		})
		
	})
	//팝업
	
	
})
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