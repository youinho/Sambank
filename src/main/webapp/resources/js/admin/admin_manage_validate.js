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
				required:"",
				validId:""
			},
			name:{
				required:"",
				validName:""
			},
			branch:{
				required:""
			},
			rank:{
				required:""
			},
			group_id:{
				required:""
			},
			enabled:{
				required:"",
				validEnabled:""
			},
			mobile:{
				required:true,
				mobile:true
			}
		},
		
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
