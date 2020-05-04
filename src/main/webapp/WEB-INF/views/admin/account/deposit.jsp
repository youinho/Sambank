<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_admin.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>

$(function(){
	$("#deposit").addClass("active");
})
function alert_success(){
	let success = "${success}";
	
	if(success ==="" || history.state){
		return;
	}
	
	
	if(success != "" && success != null){
		if(success=="true"){
			alert("${ano}계좌에 ${amount}원이 입금되었습니다.");
		}else if(success=="false"){
			alert("입금에 실패했습니다.");
		}
	}
}

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/admin/account/admin_createAccount_validate.js"></script>

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
		<h3 class="page-header title">입금</h3>
	</div>
	<form action="" method="post" id="depositForm">
		<table class="table" style="margin:0;padding:0;">
		
		<tr>
			<td class="align-middle">
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text text-center" style="width:100%" data-for="cno"><strong>고객 정보</strong></p>
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
				    <p class="input-group-text" style="width:100%"><strong>계좌번호</strong></p>
				  </div>
				  <input type="text" aria-label="First name" class="form-control" id="ano" name="ano" required>
				  
				  <div class="input-group-append" style="width:18%">
				    <button class="btn btn-outline-secondary" type="button" id="check_ano" style="width:100%">계좌번호 확인</button>
				  </div>
				</div>
			</td>
		</tr>
		
		
		
		<tr>
			<td>
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text" style="width:100%"><strong>입금액</strong></p>
			  </div>
			  <input type="text"  class="form-control" id="amount" name="amount" placeholder="입금액" required>
			  <input type="text"  class="form-control" id="amount_korean" name="amount_korean" placeholder="" readonly>
			</div>
			</td>
		</tr>
		
		
		<tr>
			<td>
				<div class="d-flex justify-content-end">
					<div class="btn-group outline-primary" role="group">
						<button class="btn btn-outline-primary" style="border-radius:0.25em;" type="submit" id="submitBtn">입금</button>
					</div>
				</div>
			</td>
		</tr>
		</table>
		
		<sec:csrfInput/>
		
	</form>
	
	
	
	
	
	
	
	
	
	
</div>
</div>
		
	


	
<script src="/resources/js/admin/account/admin_deposit.js"></script>