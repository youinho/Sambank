
$(function(){
	$("#createForm").validate({
		errorPlacement:function(error,element){ 
			
			},
		rules:{
			cno:{
				required:true
			},
			type:{
				required:true,
				validType:true
			},
			product:{
				required:true,
				validProduct:true
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
			},
			password:{
				required:true,
				minlength:4,
				maxlength:4,
				validPwd : true
			},
			confirm_password:{
				required:true,
				minlength:4,
				maxlength:4,
				validPwd : true,
				equalTo:"#password"
			}
		},
		messages:{
			cno:{
				required:"필수 입력요소입니다."
			},
			type:{
				required:"필수 입력요소입니다."
			},
			product:{
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
			},
			password:{
				required:"필수 입력요소입니다.",
				minlength:"4자리 숫자를 입력해주세요",
				maxlength:"4자리 숫자를 입력해주세요",
				validPwd : "4자리 숫자를 입력해주세요"
			},
			confirm_password:{
				required:"필수 입력요소입니다.",
				minlength:"4자리 숫자를 입력해주세요",
				maxlength:"4자리 숫자를 입력해주세요",
				equalTo:"비밀번호가 다릅니다."
			}
		},
		
	});	
});

$.validator.addMethod("validPwd",function(value){
	var regPwd=/^[0-9]{4}$/;
	return regPwd.test(value);
},"4자리 숫자를 입력해주세요");
$.validator.addMethod("validAno",function(value){
	var regAno=/^[1,2,3]{1}[0-9]{13}$/;
	return regAno.test(value);
},"ano 형식이 맞지않습니다.");
$.validator.addMethod("validType",function(value){
	var regType=/^[1,2,3]{1}$/;
	return regType.test(value);
},"계좌종류 형식이 맞지않습니다.");
$.validator.addMethod("validProduct",function(value){
	var regProduct=/^[1,2,3]{1}[0-9]{2}$/;
	return regProduct.test(value);
},"상품정보 형식이 맞지않습니다.");
$.validator.addMethod("validWD",function(value){
	var regWD=/^[0-9]{1,12}$/;
	return regWD.test(value);
},"한도 형식이 맞지않습니다.");



