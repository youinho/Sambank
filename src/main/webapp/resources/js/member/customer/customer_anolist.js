
$(function(){
	

	$("#check_ano").click(function(e){
		e.preventDefault();
		
		$("input[name='name']").val("");
		$("input[name='cno']").val("");
		$("input[name='amount']").val("")
		$("input[name='amount_korean']").val("")
		
		let form = $("#withdrawForm");
		
		
		$.ajax({
			url : "/member/account/transfer/check_ano",
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
				$("input[name='remain']").val(viewNumber(String(vo.balance)));
				$("input[name='remain_korean']").val(viewKorean(String(vo.balance)));
				
			},
			error: function(result){
				alert("계좌와 일치하는 정보가 없습니다.");
			}
			
			
			
		
			
		})
		
		
	})
	
	
	
	
	$("#ano-list").on("click",".account-item" ,function(){
		
		
		
		$("input[name='amount']").val("");
		$("input[name='amount']").val("")
		$("input[name='amount_korean']").val("")
		
		
		
		
		var ano = $(this).text();
		
		$.ajax({
			url:"/member/account/customer_get_depositInfo",
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
		
		
		
		
		
		
	})
	
	
	
	
	
	
	

	
	
})

function viewNumber(strNumber){
	var rest=",";
    var pos = strNumber.length%3;                        //자리수
    var len = (strNumber.length/3).toString();

 
    var korNumber = "";
    var op = 0;

    for( i=0; i<strNumber.length; i++ )
    {
        if(pos==0) pos=3;
        
        var num = parseInt( strNumber.substring( i, i+1 ) );
        if( num != 0 )
        {
        	
            korNumber += strNumber[i]
            op=1;
        }
        if(pos==1&&i!=strNumber.length-1  )
        {
        	
        		if(op==1) korNumber += rest;
        	
            op = 0;
        }
        pos--;
    }
    return korNumber;
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