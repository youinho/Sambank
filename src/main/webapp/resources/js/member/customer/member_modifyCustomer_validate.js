
$(function(){
	$("#register_customer").validate({
		errorPlacement:function(error,element){ 
			$(element).closest("form")
			.find("small[name='"+element.attr("id")+"']")
			.append(error);
			},
		rules:{
			birth:{
				required:true,
				birth:true
			},
			address:{
				required:true,
				maxlength:100
			},
			mobile:{
				required:true,
				mobile:true
			},
			email:{
				required:true,
				maxlength:30,
				email : true
			}			
		},
		messages:{
			birth:{
				required:"필수 입력 요소입니다."
			},
			address:{
				required:"필수 입력 요소입니다.",
				maxlength:"100자 이내로 입력해 주세요."
			},
			mobile:{
				required:"필수 입력 요소입니다."
			},
			email:{
				required:"필수 입력 요소입니다.",
				maxlength:"30자 이내로 입력해 주세요."
			}
		}
	});	
});




$.validator.addMethod("email",function(value){
	var regEmail=/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return regEmail.test(value);
},"이메일 형식을 확인해 주세요");
$.validator.addMethod("birth",function(value){
	var regBirth=/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	return regBirth.test(value);
}, "8자리의 생년월일을 입력하세요.");
$.validator.addMethod("mobile", function(value) {
	var regMobile = /^01[0,1,6,7,9][0-9]{3,4}[0-9]{4}$/;
	
	
	return regMobile.test(value);
}, "정확한 전화번호를 입력해 주세요");






