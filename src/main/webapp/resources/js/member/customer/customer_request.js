
$(function(){
	
//	$("input[name='eng_name']").change(function(){
//		$(this).val($(this).val().toUpperCase());
//	})
	$(document).ready(function(){
		$('select[name=account]').change(function() {
			$("input[name='type']").val(1);
			var i = $("#account").val();
			console.log(i);
			$("input[name='type']").val(i);
		
	})
	
	$("input[name='product1']:radio").change(function() {
			$("input[name='product']").val(1);

			var p = $("input[name='product1']:radio").val();

//			console.log(p);
			$("input[name='product']").val(p);
	})
		
})
	
//	$("#type").change(function(){
//		
//		let type = $(this).val();
//		$.ajax({
//			url : "/member/useraccount/getProduct",
//			type : "post",
//			beforeSend : function(xhr)
//            {   
//                xhr.setRequestHeader(hn, tk);
//            },
//			data :{
//				type : type
//			},
//			dataType : "text",
//			success : function(result){
//				let list = JSON.parse(result); 
//				
//				if(list.length == 0){
//					return;
//				}
//				let str = "<option value='0' selected>-- 상품 선택 --</option>";
//				for(let i = 0; i < list.length; i++){
//					str += "<option value='"+list[i].product+"'>"+list[i].p_name+"</option>"
//				}
//				$("#product").html(str);
//				
//				
//			}
//			
//			
//			
//		
//			
//		})
//		
//	})
	//팝업
	
	$("#search_juso").click(function(e){
		e.preventDefault();
		goPopup();
	})
	
})
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/member/useraccount/jusopopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
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
