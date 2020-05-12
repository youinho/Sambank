
$(function(){
	$(document).ready(function(){
		$('select[name=account]').change(function(e) {
			e.preventDefault();
			var ano = $(this).val();
		
//		$("input[name='ano']").val("");
//		$("input[name='max_withdraw']").val("");
//		$("input[name='balance']").val("");
//		console.log("aaaaa");
		
			var get_depositInfo=true;
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
					$("input[name='max_withdraw']").val(viewRest(String(vo.max_withdraw))+"원");
					$("input[name='balance_rest']").val(viewRest(String(vo.balance))+"원");
					$("input[name='balance']").val(viewRest(String(vo.balance))+"원");
					},
				error : function(result){
//					alert("계좌 정보를 불러올수없습니다.");
					
					get_depositInfo = false;
				}
				})
				var get_depositHistorySum=true;
				$.ajax({
					url:"/member/useraccount/get_depositHistorySum",
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
<<<<<<< HEAD
						var vo = JSON.parse(result);	
						console.log(vo.sum_deposit);
						$("input[name='sum_deposit']").val(vo.sum_deposit);
						$("input[name='sum_withdrawal']").val(vo.sum_withdrawal);
=======
						var vo = JSON.parse(result);			
						$("input[name='sum_deposit']").val(viewRest(String(vo.sum_deposit))+"원");
						$("input[name='sum_withdrawal']").val(viewRest(String(vo.sum_withdrawal))+"원");
>>>>>>> branch 'master' of https://github.com/youinho/Sambank.git
						
					},
					error : function(result){
<<<<<<< HEAD
						alert("입출금 내역이 없습니다.");
						$("input[name='sum_deposit']").val(0);
						$("input[name='sum_withdrawal']").val(0);
=======
//						alert("입출금 내역이 없습니다.");
						$("input[name='sum_deposit']").val(0+"원");
						$("input[name='sum_withdrawal']").val(0+"원");
>>>>>>> branch 'master' of https://github.com/youinho/Sambank.git
						
						get_depositHistorySum = false;
					}
					})
					if(get_depositInfo&&get_depositHistorySum )
						return true;
					else
						return false;
	
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