$(function(){
	let list_count = 1;
	let history_total = 0;
	let td_count=0;
	
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
			url: "/admin/account/get_history",
			type : "post",
			beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(hn, tk);
            },
			data : {
				ano : $("input[name='ano']").val(),
				start_date : $("input[name='start_date']").val(),
				end_date : $("input[name='end_date']").val(),
				list_count : 1
			},
			
			dataType : "text",
			success : function(result){
				let list = JSON.parse(result);
				
				if(list.length == 0){
					return;
				}
				
				let str = "";
				for(let i = 0; i < list.length; i++){
					if(i==0){
						history_total = list[i].history_total;
					}
					let date = new Date(list[i].depositdate);
					
					
					str += "<tr>";
					str += "<td>"+date.toISOString().slice(0, 10)+" "+date.toTimeString().slice(0, 8)+"</td>";					
					str += "<td>"+list[i].withdrawal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" 원</td>";
					str += "<td>"+list[i].deposit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" 원</td>";
					str += "<td>"+list[i].balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" 원</td>";
					str += "<td>"+list[i].name+" "+list[i].message+"</td>";
					str += "</tr>";
					
				}
				$("#historyList").html(str);
				if(list.length >= list[0].history_total){
					console.log("None");
					$("#moreDiv").css("display","none");
				}else{
					console.log("block");
					$("#moreDiv").css("display","block");
				}
				list_count = parseInt(list.length/10)+1;
				td_count=list.length;
			},
			error : function(result){
				alert("거래 내역을 조회하는데 실패했습니다.");
			}
		})
		
		
	})
	
	$("#moreBtn").click(function(e){
		e.preventDefault();
		console.log("more click")
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
		
		
		
		
		
		$.ajax({
			url: "/admin/account/get_history",
			type : "post",
			beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(hn, tk);
            },
			data : {
				ano : $("input[name='ano']").val(),
				start_date : $("input[name='start_date']").val(),
				end_date : $("input[name='end_date']").val(),
				list_count : list_count
			},
			
			dataType : "text",
			success : function(result){
				let list = JSON.parse(result);
				
				if(list.length == 0){
					return;
				}
				
				let str = "";
				for(let i = 0; i < list.length; i++){
					if(i==0){
						history_total = list[i].history_total;
					}
					let date = new Date(list[i].depositdate);
					
					
					str += "<tr>";
					str += "<td>"+date.toISOString().slice(0, 10)+" "+date.toTimeString().slice(0, 8)+"</td>";					
					str += "<td>"+list[i].withdrawal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" 원</td>";
					str += "<td>"+list[i].deposit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" 원</td>";
					str += "<td>"+list[i].balance.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" 원</td>";
					str += "<td>"+list[i].name+"</td>";
					str += "</tr>";
					
				}
				$("#historyList").append(str);
				if(td_count+list.length >= list[0].history_total){
					console.log("td :"+$("#historyList").find("td").length)
					$("#moreDiv").css("display","none");
				}else{
					console.log("td :"+$("#historyList").find("td").length)
					$("#moreDiv").css("display","block");
				}
				list_count = parseInt((td_count+list.length)/10)+1;
				td_count += list.length;
			},
			error : function(result){
				alert("거래 내역을 조회하는데 실패했습니다.");
			}
		})
		
	})
	
	
	$("#searchCS").click(function(e){
		e.preventDefault();
		popup_searchCS();
		
		
	})
	
	$("#ano-list").on("click",".account-item" ,function(e){
		e.preventDefault();
		
		var ano = $(this).text();
		
		$.ajax({
			url:"/admin/account/get_depositInfo",
			type : "post",
			beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(hn, tk);
            },
			data : {
				ano : ano
			},
			dataType : "text",
			success : function(result){
				var vo = JSON.parse(result);
				$("input[name='p_name']").val(vo.p_name);
				$("input[name='ano']").val(vo.ano);
			}
		})
		$("#historyList").html("");
		list_count=1;
		history_total = 0;
		$("#moreDiv").css("display","none");
		
		
		
		
		
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