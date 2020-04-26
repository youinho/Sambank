
$(function(){
	$("#register_customer").validate({
		errorPlacement:function(error,element){ 
			$(element).closest("form")
			.find("small[name='"+element.attr("id")+"']")
			.append(error);
			},
		rules:{
			name:{
				required:true,
				minlength:2,
				maxlength:20,
				validName:true
			},
			eng_name:{
				required:true,
				maxlength:20,
				validEngName:true
			},
			gender:{
				required:true,
				gender:true
			},
			birth:{
				required:true,
				birth:true
			},
			reg_no:{
				required:true,
				regNo:true
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
			},
			id:{
				required:true,
				validId : true,
				checkId : true
			},
			password:{
				required:true,
				validPwd : true
			},
			confirm_password:{
				required:true,
				validPwd : true,
				equalTo:"#password"
			}
		},
		messages:{
			name:{
				required:"필수 입력 요소입니다.",
				minlength:"이름은 최소 2자리는 입력해야 합니다",
				maxlength:"20자 이내로 입력해 주세요."
			},
			eng_name:{
				required:"필수 입력 요소입니다.",
				maxlength:"20자 이내로 입력해 주세요."
			},
			
			gender:{
				required:"필수 입력 요소입니다."
			},
			birth:{
				required:"필수 입력 요소입니다."
			},
			reg_no:{
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
			},
			id:{
				required:"필수 입력 요소입니다."				
				
			},
			password:{
				required:"필수 입력 요소입니다."				
			},
			confirm_password:{
				required:"필수 입력 요소입니다."	,				
				equalTo:"이전 비밀번호와 다릅니다."
			},
		}
	});	
});
$.validator.addMethod("validName",function(value){
	var regName=/^[가-힣]{2,}$/;
	return regName.test(value);
},"한글 이름을 입력해 주세요.");
$.validator.addMethod("validEngName",function(value){
	var regEngName=/^[A-Z,\s]{3,}$/;
	return regEngName.test(value);
},"영어 이름을 입력해 주세요.");


$.validator.addMethod("validId",function(value){
	var regId=/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,12}$/;
	return regId.test(value);
},"아이디는 영문 대소문자,숫자를 포함하여 5~12자리 사이로 입력해야 합니다.");
$.validator.addMethod("validPwd",function(value){
	var regPwd=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
	return regPwd.test(value);
},"비밀번호는 숫자와 영문자와 특수문자의 조합으로 8~15자리를 사용해야 합니다.");
$.validator.addMethod("email",function(value){
	var regEmail=/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return regEmail.test(value);
},"이메일 형식을 확인해 주세요");
$.validator.addMethod("gender",function(value){
	var regGender=/^[남,여]{1}$/;
	return regGender.test(value);
},"입력 가능 : (남, 여)");
$.validator.addMethod("birth",function(value){
	var regBirth=/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
	return regBirth.test(value);
}, "8자리의 생년월일을 입력하세요.");
$.validator.addMethod("regNo", function(value) {
	var regRegNo = /^[1-4][0-9]{6}$/;
	return regRegNo.test(value);
}, "정확한 번호를 입력해 주세요.");
$.validator.addMethod("mobile", function(value) {
	var regMobile = /^01[0,1,6,7,9][0-9]{3,4}[0-9]{4}$/;
	
	
	return regMobile.test(value);
}, "정확한 전화번호를 입력해 주세요");
$.validator.addMethod("checkId", function(value) {
	let check = "";
	
	console.log("method");
	$.ajax({
		url:"/admin/customer/checkId",
		type:"post",
		beforeSend : function(xhr)
        {   
			xhr.setRequestHeader(hn, tk);
        },
		async:false,
		data:{
			"id" :value
		},
		success: function(result){
			check = result;
			console.log("success"+result);
		}
	});
	console.log("check? "+check);
	if(check==="false"){
		return false;
	}else{
		return true;
	}
}, "중복되는 아이디가 있습니다.")





