<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header_admin.jsp" %>
<style>
	form > div{
		padding : 0;
	}
	small{
		color : red;	
	}	
	form > div > div> button{
		background-color : #c0c0c0;
		margin-left : 10px;
	}
	.label{
		margin-bottom: 3px;
	}
	
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/admin_registerCustomer_validate.js"></script>
<script>
$(function(){
	$("#delCS").addClass("active");
	
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
		var pass = window.open("/popup/searchCS","고객 검색","width=770,height=380, scrollbars=yes, resizable=yes");
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
			url : "/admin/getCSInfo",
			type : "post",
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
				$("input[name='gender']").val(vo.gender);
				$("input[name='birth']").val(vo.birth);
				$("input[name='reg_no']").val(vo.reg_no);
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

</script>

	<div class="col-md-8 order-md-1">
	
      <h4 class="mb-3 title">고객 정보 수정</h4>
      <div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text text-center" style="width:100%"><strong>고객 정보</strong></p>
			  </div>
			  <input type="text"  class="form-control" id="cno" name="cno" placeholder="고객 번호" readonly>
			  <input type="text"  class="form-control" id="id" name="id" placeholder="아이디" readonly>
			  
			  <div class="input-group-append" style="width:18%">
			    <button class="btn btn-outline-secondary" type="button" id="searchCS" style="width:100%">고객 검색</button>
			  </div>
			</div>
      
      <form class="needs-validation" novalidate="" method="post" id="register_customer">
      
        <div class="mb-3">
       	 <div class="label d-flex justify-content-between" >
       	  <div class="col-6" style="padding:0">
	          <label for="name">이름 </label>
	          <small name="name">
	            
	          </small>
          </div>
          <div class="col-6" style="padding:0">
          	  <label for="eng_name">영문 이름 </label>
	          <small name="eng_name">
	            
	          </small>
          </div>
         </div>
         <!-- <input type="text" class="form-control" name="name" id="name" placeholder="예) 홍길동"> -->
			<div class="input-group">
				<input type="text" aria-label="name" class="form-control" name="name" id="name" placeholder="예) 홍길동" readonly>
				<input type="text" aria-label="eng_name" class="form-control" name="eng_name" id="eng_name" placeholder="예) HONG GIL DONG" readonly>
				<button class="btn btn-outline-secondary" type="button" id="names_lockU">
			    	<svg class="bi bi-lock-fill" width="1.25em" height="1.25em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <rect width="11" height="9" x="2.5" y="7" rx="2"/>
					  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd"/>
					</svg>
			    </button>
			</div>
        </div>
        
		
		<div class="mb-3">
		<div class="label">
          <label for="gender">성별 </label>
          <small name="gender">
            
          </small>
          </div>
          <div class="input-group">
	          <input type="text" class="form-control" name="gender" id="gender" placeholder="예) 남" readonly>
	          <button class="btn btn-outline-secondary" type="button" id="gender_lock">
				    	<svg class="bi bi-lock-fill" width="1.25em" height="1.25em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <rect width="11" height="9" x="2.5" y="7" rx="2"/>
						  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd"/>
						</svg>
				    </button>
		    </div>
        </div>
		<div class="mb-3">
		<div class="label">
          <label for="birth">생년월일 </label>
          <small name="birth">
            
          </small>
          </div>
          <div class="input-group">
	          <input type="text" class="form-control" name="birth" id="birth" placeholder="예) 19930928" readonly>
	          <button class="btn btn-outline-secondary" type="button" id="birth_lock">
					    	<svg class="bi bi-lock-fill" width="1.25em" height="1.25em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <rect width="11" height="9" x="2.5" y="7" rx="2"/>
							  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd"/>
							</svg>
					    </button>
		    </div>
        </div>
		
		<div class="mb-3">
		<div class="label">
          <label for="reg_no">주민등록번호</label>
          <small name="reg_no">
            
          </small>
          </div>
          <div class="input-group">
          <input type="text" class="form-control" name="reg_no" id="reg_no" placeholder="예) 1223344" readonly>
          <button class="btn btn-outline-secondary" type="button" id="reg_no_lock">
					    	<svg class="bi bi-lock-fill" width="1.25em" height="1.25em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <rect width="11" height="9" x="2.5" y="7" rx="2"/>
							  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd"/>
							</svg>
					    </button>
		    </div>
        </div>
        
        <div class="mb-3">
         <div class="label">
          <label for="address">주소 </label><button class="btn btn-outline-primary btn-sm" id="search_juso">주소 검색</button>
          <small name="address">
            
          </small>
         </div>
         <div class="input-group">
         <input type="text" class="form-control" name="address" id="address" placeholder="예) 서울시 노원구 공릉동 444-2" readonly>
         <button class="btn btn-outline-secondary" type="button" id="address_lock">
					    	<svg class="bi bi-lock-fill" width="1.25em" height="1.25em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <rect width="11" height="9" x="2.5" y="7" rx="2"/>
							  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd"/>
							</svg>
					    </button>
		    </div>
        </div>
        <div class="mb-3">
        <div class="label">
          <label for="mobile">전화번호 </label>
          <small name="mobile">
            
          </small>
          </div>
          <div class="input-group">
          <input type="text" class="form-control" name="mobile" id="mobile" placeholder="예) 01012345678" readonly>
          <button class="btn btn-outline-secondary" type="button" id="mobile_lock">
					    	<svg class="bi bi-lock-fill" width="1.25em" height="1.25em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <rect width="11" height="9" x="2.5" y="7" rx="2"/>
							  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd"/>
							</svg>
					    </button>
		    </div>
        </div>
        <div class="mb-3">
        <div class="label">
          <label for="email">이메일 </label>
          <small name="email">
            
          </small>
          </div>
          <div class="input-group">
          <input type="text" class="form-control" name="email" id="email" placeholder="예) abc123@naver.com" readonly>
          <button class="btn btn-outline-secondary" type="button" id="email_lock">
					    	<svg class="bi bi-lock-fill" width="1.25em" height="1.25em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <rect width="11" height="9" x="2.5" y="7" rx="2"/>
							  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd"/>
							</svg>
					    </button>
		    </div>
        </div>
        
        
        
        <hr class="mb-4">
        <input type="hidden" name="cno" id="form_cno"/>
        <button class="btn btn-primary btn-lg btn-block" type="submit" id="submit">고객 정보 수정</button>
      </form>
    </div>
    <div class="bottom">
    </div>
<script>


let updated = "${updated}";

alert_reg();

history.replaceState({}, null, null);

function alert_reg(){
	if(updated ==='' || history.state){
		return;
	}
	
	if(updated === "success"){
		alert("${name}"+" 고객님의 정보 수정이 완료되었습니다.");
	}else if(updated === "failed"){
		alert("수정에 실패했습니다.");
	}
	
	
}
</script>
