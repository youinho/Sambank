
$(function(){
	alert_success();
	history.replaceState({}, null, null);
//	$("input[name='eng_name']").change(function(){
//		$(this).val($(this).val().toUpperCase());
//	})
	
	
	$(document).ready(function(){
		$('select[name=account]').change(function(e) {
			
			var i = $(this).val();
//			console.log($("input[name='type']").val());
			$("input[name='type']").val(i);
			console.log($("input[name='type']").val());
		})
		$("input[type='radio']").click(function() {
			var p = $(this).val();
//			var p = $("input[name='product1']:radio").val();

				console.log(p);
			$("input[name='product']").val(p);
		})
		
			$("#submitBtn").click(function (e){
//				e.preventDefault();
//				let from=$("#accountDelete");
				if($("input[name='visitDate']").val==null){
					$("input[name='visitDate']").focus();
					return false;
				}
				if($("input[name='type']").val()==""){
					console.log("계좌종류없음");
					$("input[name='type']").focus();
					return false;
				}
				if($("input[name='product']").val()==""){
					alert("상품을 선택하세요.");
					$("input[name='product']").focus();
					return false;
				}
				else{
					$("input[name='product']").val($("input[name='type']").val()+$("input[name='product']").val())
				}
				
				
			})
	
		})
	
})	


//	$("#type").change(function(){
//		
//		let type = $(this).val();
//		$.ajax({
//			url : "/member/useraccount/getProduct",
//			type : "post",
//			beforeSend : function(xhr)
//            {   
//                xhr.setRequestHeader(hn, tk);
//            },
//			data :{
//				type : type
//			},
//			dataType : "text",
//			success : function(result){
//				let list = JSON.parse(result); 
//				
//				if(list.length == 0){
//					return;
//				}
//				let str = "<option value='0' selected>-- 상품 선택 --</option>";
//				for(let i = 0; i < list.length; i++){
//					str += "<option value='"+list[i].product+"'>"+list[i].p_name+"</option>"
//				}
//				$("#product").html(str);
//				
//				
//			}
//			
//			
//			
//		
//			
//		})
//		
//	})
	
	


