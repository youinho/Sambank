$(function(){
	
	
	
	
	
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
					if (list[i].from_ano==null){
						message=list[i].name;
					}else{
						message=list[i].from_ano;
					}
					
					str += "<tr>";
					str += "<td>"+date.toISOString().slice(0, 10)+" "+date.toTimeString().slice(0, 8)+"</td>";					
					str += "<td>"+list[i].withdrawal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
					str += "<td>"+list[i].deposit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
					str += "<td>"+list[i].balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
					str += "<td>"+message+"</td>";
					str += "</tr>";
					
				}
				$("#historyList").html(str);

				
			},
			error : function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("거래 내역을 조회하는데 실패했습니다.");
			}
		})
		
		
	})
	
	
	
	

		
		
		
	
		
		
	
	
})


		
	

