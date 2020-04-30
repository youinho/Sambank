$(function(){
	$("#delCS").addClass("active");

	alert_del();
	history.replaceState({}, null, null);


	
	
	
	
	$('input').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	});
	
	
	
	$("#searchCS").click(function(e){
		e.preventDefault();
		popup_searchCS();
		
		
	})
	
	
	
	function popup_searchCS(){
		var pass = window.open("/admin/popup/searchCS","고객 검색","width=770,height=380, scrollbars=yes, resizable=yes");
	}	
	
	
	//팝업
	
	
	//lock button
	$("#names_lockU").click(function(e){
		e.preventDefault();
		$("#name").prop("readonly", !$("#name").prop("readonly"));
		$("#eng_name").prop("readonly", !$("#eng_name").prop("readonly"));
	})
	
	$("button[id$='lock']").click(function(e){
		e.preventDefault();
		let lock_name = $(this).attr("id").replace("_lock", "");
		$("#"+lock_name).prop("readonly", !$("#"+lock_name).prop("readonly"));
	})
	
	
})


function searchCS_callback(cno){
	$("input[name='cno']").val(cno);
	$("#register_customer")[0].reset();
	
	$.ajax({
		url : "/admin/customer/getCSInfo",
		type : "post",
		beforeSend : function(xhr)
        {   
            xhr.setRequestHeader(hn, tk);
        },
		data :{
			cno : cno
		},
		dataType : "text",
		success : function(result){
			let vo = JSON.parse(result); 
			if(vo == null){
				return;
			}
			$("#form_cno").val(vo.cno);
			
			$("input[name='id']").val(vo.id);
			$("#form_id").val(vo.id);
			
		}
		
		
		
	
		
	})
		
	
	
	$.ajax({
		url : "/admin/account/getAccInfo",
		type : "post",
		beforeSend : function(xhr)
        {   
			xhr.setRequestHeader(hn, tk);
        },
		data :{
			cno : cno
		},
		dataType : "text",
		success : function(result){
			
			let list = JSON.parse(result); 
			if(list.length == 0){
				return;
			}
			let total = 0;
			let name = list[0].name;
			str = ""
			for(let i = 0; i < list.length; i++){
				if(list[i].ano!=null && list[i].ano!=""){
					str += "<a class='dropdown-item' href='#'>"+list[i].ano+"</a>";
					total += 1;
				}
			}
			str = "<a class='dropdown-item' href='#'>보유 계좌 : "+total+" 개</a>"+"<div class='dropdown-divider'></div>"+ str;
			$("#ano-list").html(str);
			$("#name").val(name);
			if(total>0){
				$("#submit").prop("disabled", true);
				$("#total").css("color", "red");
			}else{
				$("#total").css("color", "black");
				$("#submit").removeAttr("disabled");
			}
			
		}
		
		
		
	
		
	})
		
}
