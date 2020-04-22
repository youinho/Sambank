<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	form > div{
		padding : 5px;
	}
	small{
		color : red;	
	}	
	form > div > button{
		background-color : #c0c0c0;
		margin-left : 10px;
	}
	
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/admin_registerCustomer_validate.js"></script>
<script>
$(function(){
	$('input').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		});
	
	
	
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
	
	
})
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/admin/jusopopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
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

function popup_password(wInput){
	var pass = window.open("/admin/"+wInput,"input_passowrd","width=370,height=220, scrollbars=yes, resizable=yes");
}

function input_password(password, wInput){
	/* alert(wInput);
	alert(password); */
	$("#"+wInput).val(password);
}



</script>
</head>
<body>

	<div class="mb-6 order-md-1">
      <h4 class="mb-3">고객 정보 등록</h4>
      <form class="needs-validation" novalidate="" method="post" id="register_customer">
        <div class="mb-3">
          <label for="name">이름 </label>
          <small name="name">
            
          </small>
          <input type="text" class="form-control" name="name" id="name" placeholder="예) 홍길동">
        </div>
        
		
		<div class="mb-3">
          <label for="gender">성별 </label>
          <small name="gender">
            
          </small>
          <input type="text" class="form-control" name="gender" id="gender" placeholder="예) 남">
        </div>
		<div class="mb-3">
          <label for="birth">생년월일 </label>
          <small name="birth">
            
          </small>
          <input type="text" class="form-control" name="birth" id="birth" placeholder="예) 930928">
        </div>
		
		<div class="mb-3">
          <label for="resident_registration_no">지점 번호 </label>
          <small name="resident_registration_no">
            
          </small>
          <input type="text" class="form-control" name="resident_registration_no" id="resident_registration_no" placeholder="예) 01">
        </div>
        
        <div class="mb-3">
          <label for="address">주소 </label><button class="btn btn-outline-primary" id="search_juso">주소 검색</button>
          <small name="address">
            
          </small>
          <input type="text" class="form-control" name="address" id="address" placeholder="예) 서울시 노원구 공릉동 444-2" readonly>
        </div>
        <div class="mb-3">
          <label for="mobile">전화번호 </label>
          <small name="mobile">
            
          </small>
          <input type="text" class="form-control" name="mobile" id="mobile" placeholder="예) 01012345678">
        </div>
        <div class="mb-3">
          <label for="email">이메일 </label>
          <small name="email">
            
          </small>
          <input type="text" class="form-control" name="email" id="email" placeholder="예) abc123@naver.com">
        </div>
        
        <div class="mb-3">
          <label for="id">아이디 </label>
          <small name="id">
            
          </small>
          <input type="text" class="form-control" name="id" id="id" placeholder="예) abc123">
        </div>
        <div class="mb-3">
          <label for="password">비밀번호 </label><button class="btn btn-secondary" id="passwordBtn" >고객 입력</button>
          <small name="password">
            
          </small>
          <input type="password" class="form-control" name="password" id="password" placeholder="예) abc123!@#" readonly>
        </div>
        <div class="mb-3">
          <label for="confirm_password">비밀번호 확인 </label><button class="btn btn-secondary" id="confirm_passwordBtn">고객 입력</button>
          <small name="password">
            
          </small>
          <input type="password" class="form-control" name="confirm_password" id="confirm_password" placeholder="예) abc123!@#" readonly>
        </div>
        <div>
	        <input type="hidden" name="rating" value="1" />
	        <input type="hidden" name="passhint" value="없음" />
	        <input type="hidden" name="withdrawal_limits" value="0" />
	        <input type="hidden" name="check_card" value="0" />
        </div>
        
        
        <hr class="mb-4">
        <button class="btn btn-primary btn-lg btn-block" type="submit" id="submit">고객 정보 등록</button>
      </form>
    </div>
<script>

</script>
</body>
</html>