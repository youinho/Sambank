$(function(){
	
	
		
		$("#historyList").html("");
		console.log($("input[name='ano']").val());
		console.log($("input[name='start_date']").val());
		$.ajax({
			url: "/member/useraccount/depositList/customer_get_history",
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
					if (list[i].message==null){
						if(list[i].from_name==null)	
							text=list[i].name;	
						else
							text=list[i].from_name;
					}else{
						text=list[i].from_message;
					}
					
					str += "<tr>";
					str += "<td>"+date.toISOString().slice(0, 10)+" "+date.toTimeString().slice(0, 8)+"</td>";					
					str += "<td>"+list[i].withdrawal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
					str += "<td>"+list[i].deposit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
					str += "<td>"+list[i].balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
					str += "<td>"+text+"</td>";
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
		
	
	
		


