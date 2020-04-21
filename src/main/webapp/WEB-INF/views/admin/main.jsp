<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="col-md-8 order-md-1">
      <h4 class="mb-3">고객 정보 등록</h4>
      <form class="needs-validation" novalidate="">
        <div class="mb-3">
          <label for="name">이름 </label>
          <input type="text" class="form-control" id="name" placeholder="홍길동">
          <small name="name">
            
          </small>
        </div>
		
		<div class="mb-3">
          <label for="gender">성별 </label>
          <input type="text" class="form-control" id="gender" placeholder="남">
          <small name="gender">
            
          </small>
        </div>
		<div class="mb-3">
          <label for="birth">생년월일 </label>
          <input type="text" class="form-control" id="birth" placeholder="930928">
          <small name="birth">
            
          </small>
        </div>
		
		<div class="mb-3">
          <label for="resident_registration_no">지점 번호 </label>
          <input type="text" class="form-control" id="resident_registration_no" placeholder="01">
          <small name="resident_registration_no">
            
          </small>
        </div>
        
        <div class="mb-3">
          <label for="address">주소 </label>
          <input type="text" class="form-control" id="address" placeholder="서울시 노원구 공릉동 444-2">
          <small name="address">
            
          </small>
        </div>
        <div class="mb-3">
          <label for="mobile">전화번호 </label>
          <input type="text" class="form-control" id="mobile" placeholder="01012345678">
          <small name="mobile">
            
          </small>
        </div>
        <div class="mb-3">
          <label for="email">이메일 </label>
          <input type="text" class="form-control" id="email" placeholder="abc123@naver.com">
          <small name="email">
            
          </small>
        </div>
        
        <div class="mb-3">
          <label for="id">아이디 </label>
          <input type="text" class="form-control" id="id" placeholder="abc123">
          <small name="id">
            
          </small>
        </div>
        <div class="mb-3">
          <label for="password">비밀번호 </label><button class="btn btn-secondary" href="">dlq</button>
          <input type="password" class="form-control" id="password" placeholder="abc123">
          <small name="password">
            
          </small>
        </div>
        
        
        <input type="hidden" name="rating" value="1" />
        <input type="hidden" name="passhint" value="" />
        <input type="hidden" name="withdrawal_limits" value="0" />
        <input type="hidden" name="check_card" value="0" />
        
        
        
        <hr class="mb-4">
        <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
      </form>
    </div>
</body>
</html>