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
		console.log("버튼눌림");
		
		
		$("#historyList").html("");
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
				let sum_withdrawal=0;
				let sum_deposit=0;
				for(let i = 0; i < list.length; i++){
					if(i>5){
						break;
					}
					let date = new Date(list[i].depositdate);
					if (list[i].message==null){
						if(list[i].from_name==null)	
							text=list[i].name;	
						else
							text=list[i].from_name;
					}else{
						text=list[i].message;
					}
					
					str += "<tr>";
					str += "<td>"+date.toISOString().slice(0, 10)+" "+date.toTimeString().slice(0, 8)+"</td>";					
					str += "<td>"+list[i].deposit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
					str += "<td>"+list[i].withdrawal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
					str += "<td>"+list[i].balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
					str += "<td>"+list[i].name+" "+list[i].message+"</td>";
					str += "</tr>";
					
					sum_withdrawal+=list[i].withdrawal;
					sum_deposit+=list[i].deposit;
				}

				$("input[name='sum_deposit']").val(sum_deposit+"원");
				$("input[name='sum_withdrawal']").val(sum_withdrawal+"원");
				$("#historyList").html(str);

				
			},
			error : function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("거래 내역을 조회하는데 실패했습니다.");
			}
		})
		
		
	})
	

	$("#listAllBtn").click(function(e){
		
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
		console.log("더보기 버튼눌림");
		
		let form = $("#register_customer");
		form.attr("action","depositListAll");
		form.submit();
		
		
		console.log("더보기 버튼눌림2");

//		
//		$("#historyList").html("");
//		$.ajax({
//			url: "/member/useraccount/depositList/customer_get_history",
//			type : "post",
//			beforeSend : function(xhr)
//            {   
//				xhr.setRequestHeader(hn, tk);
//            },
//			
//			data : {
//				ano : $("input[name='ano']").val(),
//				start_date : $("input[name='start_date']").val(),
//				end_date : $("input[name='end_date']").val()
//			},
//			dataType : "text",
//			success : function(result){
//				let list = JSON.parse(result);
//				
//				if(list.length == 0){
//					return;
//				}
//				
//				let str = "";
//				for(let i = 0; i < list.length; i++){
//					if(i>5){
//						break;
//					}
//					let date = new Date(list[i].depositdate);
//					if (list[i].message==null){
//						if(list[i].from_name==null)	
//							text=list[i].name;	
//						else
//							text=list[i].from_name;
//					}else{
//						text=list[i].from_message;
//					}
//					
//					str += "<tr>";
//					str += "<td>"+date.toISOString().slice(0, 10)+" "+date.toTimeString().slice(0, 8)+"</td>";					
//					str += "<td>"+list[i].withdrawal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
//					str += "<td>"+list[i].deposit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
//					str += "<td>"+list[i].balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</td>";
//					str += "<td>"+text+"</td>";
//					str += "</tr>";
//					
//				}
//				$("#historyList").html(str);
//
//				
//			},
//			error : function(request,status,error){
//				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//				alert("거래 내역을 조회하는데 실패했습니다.");
//			}
//		})
		
	})	
		
	
	
		
		
	
		

	


// $(document).ready(function() {
	 
	
	let date = new Date();
	
	
	$("#today").button().on("click", function() {
		let date = new Date();
		$("input[name='start_date']").val(date.toISOString().slice(0, 10));

//		alert("오늘 버튼을 누르셨습니다.");
	})
	
	$("#week").button().on("click", function() {
		let date = new Date();
		date.setDate(date.getDate()-6);
		$("input[name='start_date']").val(date.toISOString().slice(0, 10));
		
//		alert("이번주 버튼을 누르셨습니다.");
	})
	
	$("#1-month").button().on("click", function() {
		let date = new Date();
		date.setMonth(date.getMonth()-1);
		date.setDate(date.getDate()+1);
		$("input[name='start_date']").val(date.toISOString().slice(0, 10));

//		alert("한달전 버튼을 누르셨습니다.");
	})
	
	$("#3-month").button().on("click", function() {
		let date = new Date();
		date.setMonth(date.getMonth()-3);
		date.setDate(date.getDate()+1);
		$("input[name='start_date']").val(date.toISOString().slice(0, 10));

//		alert("세달전 버튼을 누르셨습니다.");
	})
	
	$("#6-month").button().on("click", function() {
		let date = new Date();
		date.setMonth(date.getMonth()-6);
		date.setDate(date.getDate()+1);
		$("input[name='start_date']").val(date.toISOString().slice(0, 10));

//		alert("육개월전 버튼을 누르셨습니다.");
	})
	
	$("#12-month").button().on("click", function() {
		let date = new Date();
		date.setMonth(date.getMonth()-12);
		date.setDate(date.getDate()+1);
		$("input[name='start_date']").val(date.toISOString().slice(0, 10));

//		alert("1년전 버튼을 누르셨습니다.");
	})
	
	
	
	
 })
		


