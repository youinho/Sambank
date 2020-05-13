
$(function(){
	
	
	
	$("#manageForm").validate({
		errorPlacement:function(error,element){ 
				
			},
		rules:{
			id:{
				required:true,
				validId:true
			},
			name:{
				required:true,
				validName:true
			},
			branch:{
				required:true
			},
			rank:{
				required:true
			},
			group_id:{
				required:true
			},
			enabled:{
				required:true,
				validEnabled:true
			},
			mobile:{
				required:true,
				mobile:true
			}
		},
		messages:{
			id:{
				required:"아이디를 입력해 주세요.",
				validId:"올바른 아이디를 입력해 주세요."
			},
			name:{
				required:"이름을 입력해 주세요.",
				validName:"올바른 이름을 입력해 주세요."
			},
			branch:{
				required:"지점을 입력해 주세요."
			},
			rank:{
				required:"직급을 입력해 주세요"
			},
			group_id:{
				required:"권한을 선택해 주세요."
			},
			enabled:{
				required:"로그인 승인 여부를 선택해 주세요.",
				validEnabled:"로그인 승인 여부를 선택해 주세요."
			},
			mobile:{
				required:"전화번호를 입력해 주세요.",
				mobile:"올바른 전화번호를 입력해 주세요."
			}
		}
		
	});	
});



$.validator.addMethod("validName",function(value){
	var regName=/^[가-힣]{2,}$/;
	return regName.test(value);
},"");

$.validator.addMethod("validId",function(value){
	var regId=/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,12}$/;
	return regId.test(value);
},"");
$.validator.addMethod("mobile", function(value) {
	var regMobile = /^01[0,1,6,7,9][0-9]{3,4}[0-9]{4}$/;
	return regMobile.test(value);
}, "");

$.validator.addMethod("validEnabled", function(value) {
	var regEnabled = /^[0,1]{1}$/;
	return regEnabled.test(value);
}, "");


