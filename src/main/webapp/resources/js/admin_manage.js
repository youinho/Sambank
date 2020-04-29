$(function(){
	
	alert_updated();
	alert_reg();
	history.replaceState({}, null, null);
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
		if($("input[name='id']").val()==""){
			$("input[name='id']").focus();
			return false;
		}
		if($("input[name='password']").val() !== $("input[name='confirm_password']").val()){
			alert("비밀번호가 일치하지 않습니다.");
			$("input[name='password']").val("");
			$("input[name='confirm_password']").val("");
			return false;
		}
		var regPwd=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
		if(!regPwd.test($("input[name='password']").val())){
			alert("비밀번호는 숫자와 영문자와 특수문자의 조합으로 8~15자리를 사용해야 합니다.");
			return false;
		}
		
		
		
		
		
		$.ajax({
			url: "/admin/admin_update_password",
			type : "post",
			beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(hn, tk);
            },
			data : {
				id : $("input[name='id']").val(),
				password : $("input[name='password']").val(),
				confirm_password : $("input[name='confirm_password']").val()
			},
			dataType : "text",
			success : function(result){
				alert("비밀번호가 변경되었습니다."+result);
				$("input[name='password']").val("");
				$("input[name='confirm_password']").val("");
				
			},
			error : function(result){
				alert("비밀번호 변경에 실패했습니다.");
				$("input[name='password']").val("");
				$("input[name='confirm_password']").val("");
			}
		})
		
		
	})
	
	
	
	$("#searchAD").click(function(e){
		e.preventDefault();
		popup_searchAD();
		
		
	})
	
	
	
	$("#registerBtn").click(function(e){
		e.preventDefault();
		console.log("prevent");
		
		if($("input[name='id']").val()==="" || $("input[name='name']").val()===""){
			return false;
		}
		if($("input[name='branch']").val()==="" || $("input[name='rank']").val()===""){
			return false;
		}
		if($("select[name='group_id']").val()==="-1" || $("input[name='enabled']").val()==="-1"){
			return false;
		}
		$("#manageForm").attr("action", "/admin/registerAdmin");
		$("#manageForm").submit();
	})
	
	
	
	function popup_searchAD(){
		var pass = window.open("/popup/searchAD","고객 검색","width=770,height=380, scrollbars=yes, resizable=yes");
	}	
	
	
})

function popup_password(wInput){
	var pass = window.open("/popup/"+wInput,"input_passowrd","width=370,height=220, scrollbars=yes, resizable=yes");
}

function input_password(password, wInput){
	/* alert(wInput);
	alert(password); */
	$("#"+wInput).val(password);
}





function searchAD_callback(id){
	$("#manageForm")[0].reset();
	
	$.ajax({
		url : "/admin/getAdminInfo",
		type : "post",
		beforeSend : function(xhr)
        {   
			xhr.setRequestHeader(hn, tk);
        },
		data :{
			id : id
		},
		dataType : "text",
		success : function(result){
			console.log("admin result : "+result)
			let vo = JSON.parse(result); 

			$("input[name='name']").val(vo.name);
			$("input[name='id']").val(vo.id);
			$("input[name='branch']").val(vo.branch);
			$("input[name='rank']").val(vo.rank);
			$("input[name='mobile']").val(vo.mobile);
			
			
			$("select[name='group_id']").find("option").removeAttr("selected");
			$("select[name='enabled']").find("option").removeAttr("selected");
			
			$("select[name='group_id']").find("option[value='"+vo.group_id+"']").prop("selected", true);
			$("select[name='enabled']").find("option[value='"+vo.enabled+"']").prop("selected", true);
			
		}
		
		
		
	
		
	})
		
	
	
}