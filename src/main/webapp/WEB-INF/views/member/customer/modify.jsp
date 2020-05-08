<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header_Main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SamBank < 고객 정보 수정 > </title>
<style>
/* main{
	/* <img src="/resources/SB_files/pull-1.png" style="position: fixed;bottom: 10px; right:10px"/> */
	background-image: url("/resources/SB_files/pull-1.png");
	background-repeat: no-repeat; /* repeat(기본값),no-repeat,repeat-x,repeat-y */
	background-position: bottom right; /* 수평 : left,center,right  수직 : top, center, bottom */
} */
</style>

</head>
<main>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/member/customer/member_modifyCustomer_validate.js"></script>
<script>
function alert_mod(){
	let updated = "${updated}";
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

	<div class="col-md-12 order-md-1">
	
      <h4 class="mb-3 title">고객 정보 수정</h4>
      <div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text text-center" style="width:100%"><strong>고객 정보</strong></p>
			  </div>
			  <input type="text"  class="form-control" id="id" name="id" placeholder="아이디" value="${vo.id }" readonly>
			  <input type="text"  class="form-control" id="name" name="name" placeholder="성함" value="${vo.name }" readonly>
			  
			</div>
      
      <form class="needs-validation" novalidate="" method="post" id="register_customer">        
		<div class="mb-3">
		<div class="label">
          <label for="birth">생년월일 </label>
          <small name="birth">
            
          </small>
          </div>
          <div class="input-group">
	          <input type="text" class="form-control" name="birth" id="birth" placeholder="예) 19930928" value="${vo.birth }" readonly>
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
          <label for="address">주소 </label><button class="btn btn-outline-primary btn-sm" id="search_juso" >주소 검색</button>
          <small name="address">
            
          </small>
         </div>
         <div class="input-group">
         <input type="text" class="form-control" name="address" id="address" placeholder="예) 서울시 노원구 공릉동 444-2" value="${vo.address }" readonly>
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
          <input type="text" class="form-control" name="mobile" id="mobile" placeholder="예) 01012345678" value="${vo.mobile }" readonly>
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
          <input type="text" class="form-control" name="email" id="email" placeholder="예) abc123@naver.com" value="${vo.email }" readonly>
          <button class="btn btn-outline-secondary" type="button" id="email_lock">
					    	<svg class="bi bi-lock-fill" width="1.25em" height="1.25em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <rect width="11" height="9" x="2.5" y="7" rx="2"/>
							  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd"/>
							</svg>
					    </button>
		    </div>
        </div>
       	
        
        
        <hr class="mb-4">
        
        <button type="submit" style="display:none" id="submitBtn"></button>
        <sec:csrfInput/>
      </form>

      <div class="input-group">
		  <div class="input-group-prepend" style="width:15%">
		    <span class="input-group-text" style="width:100%"><strong>비밀번호</strong> </span>
		  </div>
		  <input type="password"  class="form-control" name="password" id="password">
		    
		  <input type="password"  class="form-control" name="confirm_password" id="confirm_password">
		  
		    <button class="btn btn-outline-primary" type="button" id="changePwdBtn">
		    	비밀번호 변경
		    </button>
		  <div class="input-group-append">
		  </div>
		</div>
            <button class="btn btn-primary btn-lg btn-block" type="button" id="button" style="margin-top:20px">고객 정보 수정</button>
    </div>
    <div class="bottom">
    </div>
<script src="/resources/js/member/customer/member_modifyCustomer.js"></script>
     
</main>

</html>
<%@include file="../../includes/footer_Main.jsp" %>