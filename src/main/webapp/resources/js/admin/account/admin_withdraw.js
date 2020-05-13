$(function(){
	
	alert_success();
	history.replaceState({}, null, null);
	
	$("input[name='amount']").change(function(){
		if($(this).val() == "" || isNaN($(this).val())){
			return;
		}
		$("input[name='amount_korean']").val(viewKorean($(this).val().trim()));
	})
	$("input[name='remain']").change(function(){
		
		$("input[name='remain_korean']").val(viewKorean($(this).val().trim()));
	})
	$("#check_ano").click(function(e){
		e.preventDefault();
		
		$("input[name='name']").val("");
		$("input[name='cno']").val("");
		$("input[name='amount']").val("")
		$("input[name='amount_korean']").val("")
		
		let form = $("#withdrawForm");
		
		
		
		$.ajax({
			url : "/admin/account/check_ano",
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
				$("input[name='remain']").val(vo.balance);
				$("input[name='remain_korean']").val(viewKorean(String(vo.balance)));
				if(vo.balance>0){
					$("#submitBtn").removeAttr("disabled");
				}else{
					$("#submitBtn").prop("disabled", true);
				}
				
			},
			error: function(result){
				alert("계좌와 일치하는 정보가 없습니다.");
				$("#submitBtn").prop("disabled", true);
			}
			
			
			
		
			
		})
		
		
	})
	
	
	$("input[name='ano']").change(function(){
		$("#submitBtn").prop("disabled", true);
	})
	
	$("#ano-list").on("click",".account-item" ,function(){
		$("#submitBtn").prop("disabled", true);
		
		
		$("input[name='amount']").val("");
		$("input[name='amount']").val("")
		$("input[name='amount_korean']").val("")
		
		
		
		
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
				
				$("input[name='ano']").val(vo.ano);
				
				
			}
		})
		
		
		
		
		
		
	})
	
	
	
	
	$("#submitBtn").click(function(e){
		e.preventDefault();
		if($("input[name='remain']").val() == ""){
			alert("잔액을 확인해 주세요.")
			return false;
		}
		
		if((parseInt($("input[name='remain']").val())-parseInt($("input[name='amount']").val()))<0){
			alert("출금액을 다시 확인해주세요.")
			return false;
		}
		
		if($("input[name='amount']").val()<=0||isNaN($("input[name='amount']").val())){
			alert("올바른 출금액을 입력해 주세요.");
			$("input[name='amount']").focut();
			return false;
		}
		
		$("#withdrawForm").submit();
	})
	
	
	
	
	
	
	
	//팝업
	
	
	$("#searchCS").click(function(e){
		e.preventDefault();
		popup_searchCS();
		
		
	})
	
	
	
	function popup_searchCS(){
		var pass = window.open("/admin/popup/searchCS","고객 검색","width=770,height=380, scrollbars=yes, resizable=yes");
	}	
	
	
	
})


function searchCS_callback(cno){
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
function viewKorean(strNumber)
{
    strNumber = strNumber.replace(new RegExp(",", "g"), "");

    var arrayAmt = new Array("일", "이", "삼", "사", "오", "육", "칠", "팔", "구", "십");
    var arraypos = new Array("", "십", "백", "천");
    var arrayUnit = new Array("", "만", "억", "조", "경", "해", "자", "양", "구", "간", "정", "재", "극", "항하사", "아승기", "나유타", "불가사의", "무량대수");
 
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