$(function(){
	
	
	$(".account-item").click(function(){
		$("input[name='ano']").val($(this).text());
	})
	
	
	
	$("#historyBtn").click(function(e){
		e.preventDefault();
		if($("input[name='ano']").val()==""){
			$("input[name='ano']").focus();
			return false;
		}
		if($("input[name='start_date']").val==null){
			$("input[name='start_date']").focus();
			return false;
		}
		if($("input[name='end_date']").val==null){
			$("input[name='end_date']").focus();
			return false;
		}
		

		let hn = "${_csrf.headerName}";
		let tk = "${_csrf.token}"
		
		
		$("#historyList").html("");
		$.ajax({
			url: "/member/account/account/customer_get_history",
			type : "post",
			beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(hn, tk);
            },
			
			
			data : {
				ano : $("input[name='ano']").val(),
				start_date : $("input[name='start_date']").val(),
				end_date : $("input[name='end_date']").val()
			},
			dataType : "text",
			success : function(result){
				let list = JSON.parse(result);
				
				if(list.length == 0){
					return;
				}
				
				let str = "";
				for(let i = 0; i < list.length; i++){
					if(i>100){
						break;
					}
					let date = new Date(list[i].depositdate);
					
					
					str += "<tr>";
					str += "<td>"+date.toISOString().slice(0, 10)+" "+date.toTimeString().slice(0, 8)+"</td>";					
					str += "<td>"+list[i].withdrawal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
					str += "<td>"+list[i].deposit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
					str += "<td>"+list[i].balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
					str += "<td>"+list[i].name+"</td>";
					str += "</tr>";
					
				}
				$("#historyList").html(str);

				
			},
			error : function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//				alert("거래 내역을 조회하는데 실패했습니다.");
			}
		})
		
		
	})
	
	
	
	$("#searchCS").click(function(e){
		e.preventDefault();
		popup_searchCS();
		
		
	})
	
	
	
		
		
		
		
		
		
	function popup_searchCS(){
		var pass = window.open("/admin/popup/searchCS","고객 검색","width=770,height=380, scrollbars=yes, resizable=yes");
	}	
	
	
})

function searchCS_callback(cno){
	$("input[name='p_name']").val("");
	$("input[name='ano']").val("");
	$("input[name='cno']").val(cno);
	
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
					str += "<a class='dropdown-item account-item' href='#'>"+list[i].ano+"</a>";
					total += 1;
				}
			}
			str = "<a class='dropdown-item' href='#'>보유 계좌 : "+total+" 개</a>"+"<div class='dropdown-divider'></div>"+ str;
			$("#ano-list").html(str);
			$("#name").val(name);
			
		}
		
		
		
	
		
	})
		
	
	
}