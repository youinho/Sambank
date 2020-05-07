
$(function(){
	$("#ano-list").on("click",".account-item" ,function(){
		
//		$("input[name='ano']").val("");
//		$("input[name='max_withdraw']").val("");
//		$("input[name='balance']").val("");
//		console.log("aaaaa");
		var ano = $(this).text();
		
		$.ajax({
			url:"/member/useraccount/get_depositInfo",
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
//				$("input[name='p_name']").val(vo.p_name);
				$("input[name='ano']").val(vo.ano);
				$("input[name='max_withdraw']").val(vo.max_withdraw);
				$("input[name='remain']").val(viewNumber(vo.balance+""));
			}
		})
		
		
		
		
		
		
	})

	$("#check_ano").click(function(e){
		
		e.preventDefault();
		//링크누르면 막는기능
		console.log("bbb");
		let form = $("#withdrawForm");
		
		
		$.ajax({
			url : "/member/useraccount/get_row",
			type : "post",
			beforeSend : function(xhr)
            {   
                xhr.setRequestHeader(hn, tk);
            },
			data :{
				ano : $("#ano").val()
			},
			dataType : "text",
			success : function(result){
				var vo = JSON.parse(result);
				$("input[name='cno']").val(vo.cno);
				$("input[name='name']").val(vo.name);	
				$("input[name='max_withdraw']").val(vo.max_withdraw);
				$("input[name='remain']").val(viewRest(String(vo.balance)));
				$("input[name='hidden_balance']").val(vo.balance);
				$("input[name='remain_korean']").val(viewKorean(String(vo.balance)));
				
			},
			error: function(result){
				alert("계좌와 일치하는 정보가 없습니다.");
			}
			
			
			
		
			
		})
		
		
	})
	
	
	
	

	
	
	
	
	
	
	

	
	
})
  	function viewRest(restNumber) {
		return restNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	
	
	function viewKorean(strNumber)
	{
	    strNumber = strNumber.replace(new RegExp(",", "g"), "");
	
	    var arrayAmt = new Array("일", "이", "삼", "사", "오", "육", "칠", "팔", "구", "십");
	    var arraypos = new Array("", "십 ", "백 ", "천 ");
	    var arrayUnit = new Array("", "만 ", "억 ", "조 ", "경 ", "해", "자", "양", "구", "간", "정", "재", "극", "항하사", "아승기", "나유타", "불가사의", "무량대수");
	 
	    var pos = strNumber.length%4;                        //자리수
	    var len = (strNumber.length/4).toString();
	
	 
	
	    if( len.indexOf(".") > 0 )
	        var unit = len.substring(0, len.indexOf("."));      //단위(0:일단위, 1:만단위...)
	     else
	        var unit = strNumber.length/4-1;
	
	 
	
	    var korNumber = "";
	    var op = 0;
	
	 
	
	    for( i=0; i<strNumber.length; i++ )
	    {
	        if(pos==0) pos=4;
	        var num = parseInt( strNumber.substring( i, i+1 ) );
	        if( num != 0 )
	        {
	            korNumber += arrayAmt[ num-1 ];
	            korNumber += arraypos[ pos-1 ];
	            op=1;
	        }
	        if(pos==1)
	        {
	            if(op==1) korNumber += arrayUnit[unit];
	            unit--;
	            op = 0;
	        }
	        pos--;
	    }
	
	    if (korNumber.length==0 || korNumber.length==null )
	        return  "";
	    else
	        return korNumber+" 원" ;
	}