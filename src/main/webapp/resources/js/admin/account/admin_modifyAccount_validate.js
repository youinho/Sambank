$(function(){
	$("#modifyForm").validate({
		errorPlacement:function(error,element){ 
			
			},
		rules:{
			cno:{
				required:true
			},
			ano:{
				required:true,
				validAno:true
			},
			day_withdraw:{
				required:true,
				validWD:true
			},
			max_withdraw:{
				required:true,
				validWD:true
			}
		},
		messages:{
			cno:{
				required:"필수 입력요소입니다."
			},
			ano:{
				required:"필수 입력요소입니다."
			},
			day_withdraw:{
				required:"필수 입력요소입니다."
			},
			max_withdraw:{
				required:"필수 입력요소입니다."
			}
		},
		
	});	
});


$.validator.addMethod("validAno",function(value){
	var regAno=/^[1,2,3]{1}[0-9]{13}$/;
	return regAno.test(value);
},"ano 형식이 맞지않습니다.");
$.validator.addMethod("validWD",function(value){
	var regWD=/^[0-9]{1,12}$/;
	return regWD.test(value);
},"한도 형식이 맞지않습니다.");



