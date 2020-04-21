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
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/admin_registerCustomer_validate.js"></script>
</head>
<body>

	<div class="mb-6 order-md-1">
      <h4 class="mb-3">고객 정보 등록</h4>
      <form class="needs-validation" novalidate="" method="post" id="register_customer">
        <div class="mb-3">
          <label for="name">이름 </label>
          <small name="name">
            
          </small>
          <input type="text" class="form-control" name="name" id="name" placeholder="홍길동">
        </div>
        
		
		<div class="mb-3">
          <label for="gender">성별 </label>
          <small name="gender">
            
          </small>
          <input type="text" class="form-control" name="gender" id="gender" placeholder="남">
        </div>
		<div class="mb-3">
          <label for="birth">생년월일 </label>
          <small name="birth">
            
          </small>
          <input type="text" class="form-control" name="birth" id="birth" placeholder="930928">
        </div>
		
		<div class="mb-3">
          <label for="resident_registration_no">지점 번호 </label>
          <small name="resident_registration_no">
            
          </small>
          <input type="text" class="form-control" name="resident_registration_no" id="resident_registration_no" placeholder="01">
        </div>
        
        <div class="mb-3">
          <label for="address">주소 </label>
          <small name="address">
            
          </small>
          <input type="text" class="form-control" name="address" id="address" placeholder="서울시 노원구 공릉동 444-2">
        </div>
        <div class="mb-3">
          <label for="mobile">전화번호 </label>
          <small name="mobile">
            
          </small>
          <input type="text" class="form-control" name="mobile" id="mobile" placeholder="01012345678">
        </div>
        <div class="mb-3">
          <label for="email">이메일 </label>
          <small name="email">
            
          </small>
          <input type="text" class="form-control" name="email" id="email" placeholder="abc123@naver.com">
        </div>
        
        <div class="mb-3">
          <label for="id">아이디 </label>
          <small name="id">
            
          </small>
          <input type="text" class="form-control" name="id" id="id" placeholder="abc123">
        </div>
        <div class="mb-3">
          <label for="password">비밀번호 </label><button class="btn btn-secondary">dlq</button>
          <small name="password">
            
          </small>
          <input type="password" class="form-control" name="password" id="password" placeholder="abc123">
        </div>
        <div class="mb-3">
          <label for="confirm_password">비밀번호 확인 </label><button class="btn btn-secondary">dlq</button>
          <small name="password">
            
          </small>
          <input type="password" class="form-control" name="confirm_password" id="confirm_password" placeholder="abc123">
        </div>
        <div>
	        <input type="hidden" name="rating" value="1" />
	        <input type="hidden" name="passhint" value="없음" />
	        <input type="hidden" name="withdrawal_limits" value="0" />
	        <input type="hidden" name="check_card" value="0" />
        </div>
        
        
        <hr class="mb-4">
        <button class="btn btn-primary btn-lg btn-block" type="submit">고객 정보 등록</button>
      </form>
    </div>
</body>
</html>