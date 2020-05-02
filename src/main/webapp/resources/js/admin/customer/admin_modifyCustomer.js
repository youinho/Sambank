$(function(){
	

	alert_reg();

	history.replaceState({}, null, null);


	
	$("#modCS").addClass("active");
	
	$('input').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	});
	
	
	$("input[name='eng_name']").change(function(){
		$(this).val($(this).val().toUpperCase());
	})
	
	
	$("#searchCS").click(function(e){
		e.preventDefault();
		popup_searchCS();
		
		
	})
	
	
	
	function popup_searchCS(){
		var pass = window.open("/admin/popup/searchCS","고객 검색","width=770,height=380, scrollbars=yes, resizable=yes");
	}	
	
	
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
	
	
})


function searchCS_callback(cno){
		$("input[name='cno']").val(cno);
		
		
		$.ajax({
			url : "/admin/customer/getCSInfo",
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
				console.log("accinfo result : "+result)
				let vo = JSON.parse(result); 
				if(vo == null){
					return;
				}
				$("#form_cno").val(vo.cno);
				
				$("input[name='id']").val(vo.id);
				$("input[name='name']").val(vo.name);
				$("input[name='eng_name']").val(vo.eng_name);
				$("input[value!='"+vo.gender+"']").removeAttr("checked");
				$("input[value='"+vo.gender+"']").prop("checked", true);
				$("input[name='birth']").val(vo.birth);
				$("input[name='address']").val(vo.address);
				$("input[name='mobile']").val(vo.mobile);
				$("input[name='email']").val(vo.email);
				
				
				
				
			}
			
			
			
		
			
		})
			
		
		
}








// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/admin/popup/jusopopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
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