<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../../includes/header_Main.jsp" %>
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
<script src="/resources/js/admin/customer/admin_registerCustomer_validate.js"></script>
<script>




function alert_del(){
	let deleted = "${deleted}";
	if(deleted ==='' || history.state){
		return;
	}
	
	if(deleted === "success"){
		alert("${name}"+" 고객님의 정보가 삭제되었습니다.");
	}else if(deleted === "failed"){
		alert("삭제에 실패했습니다.");
	}
	
	
}
</script>

	<div class="col-md-12 order-md-1">
	
      <h4 class="mb-3 title">고객 정보 삭제</h4>
      <div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text text-center" style="width:100%"><strong>고객 정보</strong></p>
			  </div>
			  <input type="text"  class="form-control" id="cno" name="cno" placeholder="고객 번호" readonly>
			  <input type="text"  class="form-control" id="id" name="id" placeholder="아이디" readonly>
			  <input type="text"  class="form-control" id="name" name="name" placeholder="성함" readonly>
			  <div class="input-group-append" style="width:18%">
			    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="total" name="total" style="width:100%">보유 계좌</button>
			    <div class="dropdown-menu" id="ano-list">
			    	<div role="separator" class="dropdown-divider"></div>
			    </div>
			  </div>
			  <div class="input-group-append" style="width:18%">
			    <button class="btn btn-outline-secondary" type="button" id="searchCS" style="width:100%">고객 검색</button>
			  </div>
			</div>
      
      <form class="needs-validation" novalidate="" method="post" id="register_customer">
      
        
        
		
		
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
        
        
        
        
        <hr class="mb-4">
        <sec:csrfInput/>
        <button class="btn btn-danger btn-lg btn-block" type="submit" id="submit" disabled>고객 정보 삭제</button>
      </form>
    </div>
    <div class="bottom">
    </div>
<script src="/resources/js/admin/customer/admin_deleteCustomer.js"></script>
