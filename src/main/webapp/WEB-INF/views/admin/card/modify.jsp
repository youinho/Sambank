<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_admin.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
$(function(){
	$("#modCard").addClass("active");
	
	
	
	
	
	
})

function alert_updated(){
	let updated = "${updated}";
	
	if(updated ==='' || history.state){
		return;
	}
	
	
	if(updated != "" && updated != null){
		if(updated=="true"){
			alert("${card_no}"+"카드의 카드 수정이 완료되었습니다.");
		}else if(updated=="false"){
			alert("카드 정보 수정에 실패했습니다.");
		}
	}
}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/admin/account/admin_modifyAccount_validate.js"></script>

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
<div class="col-md-12">
	<div class="col-md-12">
		<h3 class="page-header title">신규 카드 등록</h3>
	</div>
	<form action="" method="post" id="modifyForm">
		<table class="table" style="margin:0;padding:0;">
		
		<tr>
			<td class="align-middle">
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text text-center" style="width:100%"><strong>고객 정보</strong></p>
			  </div>
			  <input type="text"  class="form-control" id="cno" name="cno" placeholder="고객 번호" readonly>
			  <input type="text"  class="form-control" id="name" name="name" placeholder="성함" readonly>
			  <div class="input-group-append" style="width:110px">
			    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="total_card" name="total" style="width:100%">보유 카드</button>
			    <div class="dropdown-menu" id="card-list">
			    	<div role="separator" class="dropdown-divider"></div>
			    </div>
			  </div>
			  <div class="input-group-append" style="width:110px">
			    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="total" name="total" style="width:100%">보유 계좌</button>
			    <div class="dropdown-menu" id="ano-list">
			    	<div role="separator" class="dropdown-divider"></div>
			    </div>
			  </div>
			  <div class="input-group-append" style="width:20%">
			    <button class="btn btn-outline-secondary" type="button" id="searchCS" style="width:100%">고객 검색</button>
			  </div>
			</div>
			</td>
		</tr>
		
		
		
		<tr>
			<td>
				<div class="input-group">
				  <div class="input-group-prepend" style="width:15%">
				    <span class="input-group-text" style="width:100%"><strong>상품/ 계좌</strong></span>
				  </div>
				  <input type="text" aria-label="p_name" class="form-control" name="deposit_p_name" readonly>
				  <input type="text" aria-label="ano" class="form-control" name="ano" readonly>
				  
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
				  <div class="input-group-prepend" style="width:15%">
				    <span class="input-group-text" style="width:100%"><strong>상품/ 카드</strong></span>
				  </div>
				  <input type="text" aria-label="p_name" class="form-control" name="card_p_name" readonly>
				  <input type="text" aria-label="ano" class="form-control" name="card_no" readonly>
				  
				</div>
			</td>
		</tr>
		
		
		
		
		
		
		<tr>
			<td>
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <span class="input-group-text" style="width:100%"><strong>한도</strong></span>
			  </div>
			  <input type="text"  class="form-control" name="limit_month" placeholder="월 한도" required>
			  <input type="text"  class="form-control" name="limit" placeholder="1회 한도" required>
			</div>
			</td>
		</tr>
		
		
		<tr>
			<td>
				<div class="input-group">
				  <div class="input-group-prepend" style="width:15%">
				    <p class="input-group-text" style="width:100%"><strong>카드 상태</strong></p>
				  </div>
				  <select class="custom-select" id="condition" name="condition">
				    <option value="-1" selected>-- 상태 선택 --</option>
				    <c:forEach items="${condition }" var="vo">
				    	<option value="${vo.condition }"><c:out value="${vo.condition_name }"></c:out> </option>
				    	
				    </c:forEach>
				  </select>
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
			    <button class="btn btn-outline-primary" type="button" id="changePwdBtn">
			    	비밀번호 변경
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
						<button class="btn btn-outline-primary" style="border-radius:0.25em;" type="submit" id="submitBtn">카드 정보 변경</button>
					</div>
				</div>
			</td>
		</tr>
		
		
		
		
		
		</table>
		<sec:csrfInput/>
	</form>
</div>
</div>
		
	


<script src="/resources/js/admin/card/admin_modifyCard.js"></script>
<script>

</script>