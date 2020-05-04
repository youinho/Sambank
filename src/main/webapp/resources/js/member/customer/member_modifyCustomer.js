$(function(){

	alert_mod();

	history.replaceState({}, null, null);


	$('input').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	});
	
	
	//팝업
	
	$("#search_juso").click(function(e){
		e.preventDefault();
		goPopup();
	})
	
	$("#passwordBtn").click(function(e){
		e.preventDefault();
		popup_password("passpopup");
	})
	
	$("#confirm_passwordBtn").click(function(e){
		e.preventDefault();
		popup_password("passpopup_c");
	})
	
	
	
	
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
	
	
	
	$("#changePwdBtn").click(function(e){
		e.preventDefault();
		if($("input[name='id']").val()==""){
			$("input[name='id']").focus();
			return false;
		}
		if($("input[name='password']").val() !== $("input[name='confirm_password']").val()){
			alert("비밀번호가 일치하지 않습니다.");
			$("input[name='password']").val("");
			$("input[name='confirm_password']").val("");
			return false;
		}
		var regPwd=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
		if(!regPwd.test($("input[name='password']").val())){
			alert("비밀번호는 숫자와 영문자와 특수문자의 조합으로 8~15자리를 사용해야 합니다.");
			return false;
		}
		
		
		
		
		
		$.ajax({
			url: "/member/customer_update_password",
			type : "post",
			beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(hn, tk);
            },
			data : {
				id : $("input[name='id']").val(),
				password : $("input[name='password']").val(),
				confirm_password : $("input[name='confirm_password']").val()
			},
			dataType : "text",
			success : function(result){
				alert("비밀번호가 변경되었습니다."+result);
				$("input[name='password']").val("");
				$("input[name='confirm_password']").val("");
				
			},
			error : function(result){
				alert("비밀번호 변경에 실패했습니다.");
				$("input[name='password']").val("");
				$("input[name='confirm_password']").val("");
			}
		})
		
		
	})
	
	
	$("#button").click(function(e){
		e.preventDefault();
		console.log("submittt")
		$("#submitBtn").click();
	})
	
	
	
	
	
	
})









// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/popup/jusopopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	/* document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo; */
	$("input[name='address']").val(roadAddrPart1+" "+roadAddrPart2+" "+addrDetail);
}