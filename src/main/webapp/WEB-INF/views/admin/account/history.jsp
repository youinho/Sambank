<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_admin.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
	#historyTBL{
		
		text-align: center;
		white-space: nowrap;
	}
	#historyTBL > thead{
		font-size:14px;
	}
	#historyTBL > tbody{
		font-size: 12px;
	}
</style>


<div class="container">
<div class="col-md-12">
	<div class="col-md-12">
		<h3 class="page-header title">거래 내역 조회</h3>
	</div>
	<form action="" method="post" id="historyForm">
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
				    <span class="input-group-text" style="width:100%"><strong>상품/ 계좌</strong></span>
				  </div>
				  <input type="text" aria-label="p_name" class="form-control" name="p_name" readonly>
				  <input type="text" aria-label="ano" class="form-control" name="ano" readonly>
				  
				</div>
			</td>
		</tr>
		
		
		
		<tr>
			<td>
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <span class="input-group-text" style="width:100%"><strong>기간 조회</strong> </span>
			  </div>
			  <input type="date"  class="form-control" name="start_date" id="start_date">
			    
			  <input type="date"  class="form-control" name="end_date" id="end_date">
			  <div class="input-group-append" style="width:18%">
			    <button class="btn btn-outline-primary" type="button" id="historyBtn" style="width:100%">
			    	조회하기
			    </button>
			  </div>
			  <div class="input-group-append">
			  </div>
			</div>
			</td>
		</tr>
		
		
		</table>
		
		<sec:csrfInput/>
	</form>
	<table class="table table-striped table-bordered table-hover table-sm" id="historyTBL">
		    <thead>
		        <tr>
		            <th scope="col" style='width: 20%'>년 월 일 시간</th>
		            <th scope="col" style='width: 20%'>찾으신 금액</th>
		            <th scope="col" style='width: 20%'>맡기신 금액</th>
		            <th scope="col" style='width: 20%'>남 은 금 액</th>
		            <th scope="col" style='width: 20%'>거래내용</th>
		        </tr>									
		    </thead>
		    <tbody id="historyList">
		    	
		    </tbody>
		
		</table>
</div>
</div>
		
	
<script>
$(function(){
	$("#histACC").addClass("active");
	let date = new Date();
	$("input[name='end_date']").val(date.toISOString().slice(0, 10));
	date.setMonth(date.getMonth()-6);
	$("input[name='start_date']").val(date.toISOString().slice(0, 10));
})
</script>

<script src="/resources/js/admin/account/admin_historyAccount.js"></script>