<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../includes/header_Main.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- resources 앞에 / 를 붙일때는 context path가 없는 경우일 때 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/member/customer/member_registerCustomer_validate.js"></script>
<script>
	$(function(){
		let sended = "false";
		$("aside").remove();
		$("input[value='남']").prop("checked", true);
	
		
		
		$("input[name='eng_name']").change(function(){
			$(this).val($(this).val().toUpperCase());
		})
		
		$(".gender-radio").change(function(){
			$("input[name='gender']").val($(this).val());
		})
		
		
		
		$("#search_juso").click(function(e){
			e.preventDefault();
			goPopup();
		})
		
		$('input').keydown(function() {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
		});
		
		$("#submitBtn").click(function(e){
			e.preventDefault();
			if(sended==="false"){
				
				$("#submitBtn").prop("disabled",true);
				sended = "true";
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
	console.log("cb")
	$("input[name='address']").val(roadAddrPart1+" "+roadAddrPart2+" "+addrDetail);
}
</script>
</head>
<body  style="background-color:#F5F5F5;">
<div class="container" style="margin-top:40px">
<form id="register_customer" method="post" action="register2">	
	<div class="form-group row justify-content-center">
		<label for="userid" class="col-sm-2 col-form-label">아이디</label>
		<div class="col-sm-6">			
			<input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력하세요" value="${vo.id }"/>
			 <small name="id" class="text-info"></small>	
		</div>
	</div>
	<div class="form-group row justify-content-center">
		<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
		<div class="col-sm-6">	
			<input type="password" name="password" id = "password" class="form-control" placeholder="비밀번호를 입력하세요"/>
			<small name="password" class="text-info"></small>	
		</div>
	</div>	
	<div class="form-group row justify-content-center">
		<label for="confirm_password" class="col-sm-2 col-form-label">비밀번호 확인 </label>
		<div class="col-sm-6">	
			<input type="password" name="confirm_password" id = "confirm_password" class="form-control" placeholder="비밀번호를 다시 입력하세요"/>
			<small name="confirm_password" class="text-info"></small>
		</div>	
	</div>	
	<div class="form-group row justify-content-center">
		<label for="name" class="col-sm-2 col-form-label">이름 </label>
		<div class="col-sm-6">	
			<input type="text" name="name" id="name" class="form-control" placeholder="이름을 입력하세요" value="${vo.name }"/>
			<small name="name" class="text-info"></small>
		</div>	
	</div>
	<div class="form-group row justify-content-center">
		<label for="eng_name" class="col-sm-2 col-form-label">영문이름 </label>
		<div class="col-sm-6">	
			<input type="text" name="eng_name" id="eng_name" class="form-control" placeholder="영어 이름을 입력하세요" value="${vo.eng_name }"/>
			<small name="eng_name" class="text-info"></small>
		</div>	
	</div>
	<div class="form-group row justify-content-center">
	<label for="gender" class="col-sm-2 col-form-label">성별 </label>
	  <div class="col-sm-6">		
			<div class="form-check form-check-inline">		
				<input type="radio" id="male" name="gender-radio" value="남" class="form-check-input gender-radio"/>남 <!--  ${vo.gender=='남'?'checked':""} -->				
		  	</div>	
		  	<div class="form-check form-check-inline">
				<input type="radio" id="female" name="gender-radio" value="여" class="form-check-input gender-radio" />여	<!-- ${vo.gender=='여'?'checked':""} -->			
			</div>
			<small  name="gender" class="text-info"></small>
		</div> 
	</div>		
	<div class="form-group row justify-content-center">
		<label for = "phone" class="col-sm-2 col-form-label">휴대폰번호</label>
		<div class="col-sm-6">	
			<input type="mobile" name="mobile" id="mobile" class="form-control" placeholder="01012345678" value="${vo.mobile }"/>	
			<small  name="mobile" class="text-info"></small>		
		</div>	
	</div>
	<div class="form-group row justify-content-center">
		<label for = "birth" class="col-sm-2 col-form-label">생년월일</label>
		<div class="col-sm-6">	
			<input type="birth" name="birth" id="birth" class="form-control" placeholder="19900101" value="${vo.birth}"/>	
			<small name="birth" class="text-info"></small>		
		</div>	
	</div>
	
	<div class="form-group row justify-content-center">
		<label for = "phone" class="col-sm-2 col-form-label">주소&nbsp&nbsp<button class="btn btn-outline-primary btn-sm" id="search_juso">주소 검색</button></label>
		<div class="col-sm-6">	
			<input type="address" name="address" id="address" class="form-control" placeholder="서울시 xx구 xx동" value="${vo.address }"/>	
			<small  name="address" class="text-info"></small>		
		</div>	
	</div>
	<div class="form-group row justify-content-center">
		<label for = "email" class="col-sm-2 col-form-label">이메일</label>
		<div class="col-sm-6">	
			<input type="email" name="email" id="address" class="form-control" placeholder="example@gmail.com" value="${vo.email }"/>	
			<small  name="email" class="text-info"></small>		
		</div>	
	</div>
	
	<div class="form-group text-center">		
		<button type="submit" class="btn btn-primary" id="submitBtn">입력</button>
	    <button type="reset" class="btn btn-secondary">취소</button>		
	</div>	
	<input type="hidden" name="gender" value="남" />	
	<sec:csrfInput/>
</form>
</div>
</body>
</html>