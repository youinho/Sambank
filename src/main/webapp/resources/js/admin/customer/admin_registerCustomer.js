$(function(){
	$("#regCS").addClass("active");
	let sended= "false";

	alert_reg();

	history.replaceState({}, null, null);

	
	
	$('input').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	});
	
	
	$("input[name='eng_name']").change(function(){
		$(this).val($(this).val().toUpperCase());
	})
	
	$(".gender-radio").change(function(){
		$("input[name='gender']").val($(this).val());
	})
	
	
	
	
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
	$("#submitBtn").click(function(e){
		e.preventDefault();
		if(sended==="false"){
			
			sended = "true";
			$("#submitBtn").prop("disabled",true);
			$("#register_customer").submit();				
		}else{
			alert("이미 처리된 요청입니다");
		}
		
	})		
	$("#register_customer").on("change","input",function(){
		console.log("change!")
		sended = "false";
		$("#submitBtn").removeAttr("disabled");
			
	})
})
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
	console.log("cb")
	$("input[name='address']").val(roadAddrPart1+" "+roadAddrPart2+" "+addrDetail);
}

function popup_password(wInput){
	var pass = window.open("/admin/popup/"+wInput,"input_passowrd","width=370,height=220, scrollbars=yes, resizable=yes");
}

function input_password(password, wInput){
	/* alert(wInput);
	alert(password); */
	$("#"+wInput).val(password);
}