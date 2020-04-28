<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../../includes/header_admin.jsp" %>
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
function alert_reg(){
	let registered = "${registered}";
	if(registered ==='' || history.state){
		return;
	}
	
	if(registered === "success"){
		alert("${name}"+" 고객님의 등록이 완료되었습니다.");
	}else if(registered === "failed"){
		alert("등록에 실패했습니다.");
	}
	
	
}








</script>

	<div class="col-md-12 order-md-1">
	
      <h4 class="mb-3 title">고객 정보 등록</h4>
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
			<input type="text" aria-label="name" class="form-control" name="name" id="name" placeholder="예) 홍길동">
			<input type="text" aria-label="eng_name" class="form-control" name="eng_name" id="eng_name" placeholder="예) HONG GIL DONG">
			</div>
        </div>
        
		
		<div class="mb-3">
		<div class="label">
          <label for="gender">성별 </label>
          <small name="gender">
            
          </small>
          </div>
          <!-- <input type="text" class="form-control" name="gender" id="gender" placeholder="예) 남"> -->
          <div class="input-group">
			  <div class="input-group-prepend">
			    <div class="input-group-text">
			      <input type="radio" aria-label="Radio button for following text input" name="gender" id="male" value="남" checked>
			    </div>
			    
			  </div>
		  	  <input type="text" class="form-control" aria-label="Text input with radio button" readonly placeholder="남">
		  	  <div class="input-group-prepend">
			    <div class="input-group-text">
			      <input type="radio" aria-label="Radio button for following text input" name="gender" id="female" value="여">
			    </div>
			  </div>
		  	  <input type="text" class="form-control" aria-label="Text input with radio button" readonly placeholder="여">
		</div>
        </div>
		<div class="mb-3">
		<div class="label">
          <label for="birth">생년월일 </label>
          <small name="birth">
            
          </small>
          </div>
          <input type="text" class="form-control" name="birth" id="birth" placeholder="예) 19930928">
        </div>
		
        
        <div class="mb-3">
         <div class="label">
          <label for="address">주소 </label><button class="btn btn-outline-primary btn-sm" id="search_juso">주소 검색</button>
          <small name="address">
            
          </small>
         </div>
         <input type="text" class="form-control" name="address" id="address" placeholder="예) 서울시 노원구 공릉동 444-2" readonly>
        </div>
        <div class="mb-3">
        <div class="label">
          <label for="mobile">전화번호 </label>
          <small name="mobile">
            
          </small>
          </div>
          <input type="text" class="form-control" name="mobile" id="mobile" placeholder="예) 01012345678">
        </div>
        <div class="mb-3">
        <div class="label">
          <label for="email">이메일 </label>
          <small name="email">
            
          </small>
          </div>
          <input type="text" class="form-control" name="email" id="email" placeholder="예) abc123@naver.com">
        </div>
        
        <div class="mb-3">
        <div class="label">
          <label for="id">아이디 </label>
          <small name="id">
            
          </small>
          </div>
          <input type="text" class="form-control" name="id" id="id" placeholder="예) abc123">
        </div>
        <div class="mb-3">
        <div class="label">
          <label for="password">비밀번호 </label><button class="btn btn-outline-primary btn-sm" id="passwordBtn" >고객 입력</button>
          <small name="password">
            
          </small>
          </div>
          <input type="password" class="form-control" name="password" id="password" placeholder="예) abc123!@#" readonly>
        </div>
        <div class="mb-3">
        <div class="label">
          <label for="confirm_password">비밀번호 확인 </label><button class="btn btn-outline-primary btn-sm" id="confirm_passwordBtn">고객 입력</button>
          <small name="password">
            
          </small>
          </div>
          <input type="password" class="form-control" name="confirm_password" id="confirm_password" placeholder="예) abc123!@#" readonly>
        </div>
        
        
        <hr class="mb-4">
        
        <sec:csrfInput/>
        <button class="btn btn-primary btn-lg btn-block" type="submit" id="submit">고객 정보 등록</button>
      </form>
    </div>
    <div class="bottom">
    </div>
<script src="/resources/js/admin_registerCustomer.js"></script>
