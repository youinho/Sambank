$(function(){
	alert_del();
	history.replaceState({}, null, null);

	console.log("ooook")
	$.ajax({
		url : "/member/account/getAccInfo",
		type : "post",
		beforeSend : function(xhr)
        {   
			xhr.setRequestHeader(hn, tk);
        },
		data :{},
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
	
	
	
	$('input').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	});
	
	
	
	//팝업
	console.log("ooook2")
	
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



	