<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_admin.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
$(function(){
	$("#creACC").addClass("active");
})



</script>

<style>
	.btn{
		border-radius : 0;
	}
	.input-group-text{
		border-radius : 0;
	}
	span{
		text-align : center;
	}
	.table td{
		border-top : 0;
	}
	.input-group-prepend{
		background-color : blue;
		
	}
</style>


<div class="container">
<div class="col-md-10">
	<div class="col-md-10">
		<h3 class="page-header title">계좌 발급</h3>
	</div>
	<form action="" method="post" id="createForm">
		<table class="table" style="margin:0;padding:0;">
		
		<tr>
			<td class="align-middle">
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text text-center" style="width:100%"><strong>고객 정보</strong></p>
			  </div>
			  <input type="text"  class="form-control" id="cno" name="cno" placeholder="고객 번호" readonly>
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
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="input-group">
				  <div class="input-group-prepend" style="width:15%">
				    <span class="input-group-text" style="width:100%"><strong>상품</strong></span>
				  </div>
				  <select class="custom-select" id="type" name="type">
				    <option value="0" selected>-- 계좌 구분 --</option>
				    <option value="1">예금계좌</option>
				    <option value="2">적금계좌</option>
				    <option value="3">대출계좌</option>
				  </select>
				  <select class="custom-select" id="product" name="product">
				    <option value="0" selected>-- 상품 선택 --</option>
				  </select>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="input-group">
				  <div class="input-group-prepend" style="width:15%">
				    <span class="input-group-text" style="width:100%"><strong>계좌번호</strong></span>
				  </div>
				  <input type="text" aria-label="First name" class="form-control" name="ano" readonly>
				  
				  <div class="input-group-append" style="width:18%">
				    <button class="btn btn-outline-secondary" type="button" id="call_ano" style="width:100%">계좌번호 요청</button>
				  </div>
				</div>
			</td>
		</tr>
		
		
		
		<tr>
			<td>
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <span class="input-group-text" style="width:100%"><strong>이체 한도</strong></span>
			  </div>
			  <input type="text"  class="form-control" name="day_withdraw" placeholder="일 이체 한도">
			  <input type="text"  class="form-control" name="max_withdraw" placeholder="1회 이체 한도">
			</div>
			</td>
		</tr>
		
		
		
		
		
		<tr>
			<td>
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <span class="input-group-text" style="width:100%"><strong>비밀번호</strong> </span>
			  </div>
			  <input type="password"  class="form-control" name="password" id="password" readonly>
			    <button class="btn btn-outline-secondary" type="button" id="passwordBtn">
			    	<svg class="bi bi-grid-3x3-gap" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path stroke="#000" d="M1.5 2a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V2zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V7zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5v-2z"/>
					</svg>
			    </button>
			  <input type="password"  class="form-control" name="confirm_password" id="confirm_password" readonly>
			  <button class="btn btn-outline-secondary" type="button" id="confirm_passwordBtn">
			    	<svg class="bi bi-grid-3x3-gap" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path stroke="#000" d="M1.5 2a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V2zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V7zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5v-2z"/>
					</svg>
			    </button>
			  <div class="input-group-append">
			  </div>
			</div>
			</td>
		</tr>
		
		
		<tr>
			<td>
				<div class="d-flex justify-content-end">
					<div class="btn-group outline-primary" role="group">
						<button class="btn btn-outline-primary" style="border-radius:0.25em;" type="submit" id="submitBtn">계좌 발급</button>
					</div>
				</div>
			</td>
		</tr>
		
		
		
		
		
		</table>
		
		<input type="hidden" name="branch" value="01" />
	</form>
</div>
</div>
		
	


	
<script src="/resources/js/admin_createAccount.js"></script>