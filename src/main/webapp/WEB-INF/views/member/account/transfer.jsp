<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


<script>

$(function(){
	$("#withdraw").addClass("active");
})finp
function alert_success(){
	let success = "${success}";
	
	if(success ==="" || history.state){
		return;
	}
	
	
	if(success != "" && success != null){
		if(success=="true"){
			alert("${from_name}님에게 ${amount}원이 이체되었습니다.");
		}else if(success=="false"){
			alert("이체에 실패했습니다.");
		}
	}
}
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
<div class="col-md-12">
	<div class="col-md-12">
		<h3 class="page-header title">계좌이체</h3>
	</div>
	<form action="" method="post" id="withdrawForm">
		<table class="table" style="margin:0;padding:0;">
		
		<tr>
			<td class="align-middle">
			<div class="input-group">
			  <input type="text"  class="form-control" id="cno" name="cno" placeholder="${cno}"   readonly>
			  <input type="text"  class="form-control" id="name" name="name" placeholder="${name}" readonly>
			  <div class="input-group-append" style="width:18%">
			    
			    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="total" name="total" style="width:100%">보유 계좌</button>
			    <div class="dropdown-menu" id="ano-list">
			    	<c:forEach items="${list }" var="vo">
			    		<a class='dropdown-item account-item' href='#'><c:out value="${vo.ano}"></c:out> </a>
		    		</c:forEach>
			    </div>
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
				    <button class="btn btn-outline-secondary" type="button" id="check_ano" style="width:100%">계좌잔액 확인</button>
				  </div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text" style="width:100%"><strong>잔액</strong></p>
			  </div>
			  <input type="text"  class="form-control" id="remain" name="remain" placeholder="잔액" readonly>
			  <input type="text"  class="form-control" id="remain_korean" name="remain_korean" placeholder="" readonly>
			</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
				  <div class="input-group-prepend" style="width:15%">
				    <p class="input-group-text" style="width:100%"><strong>상대계좌</strong></p>
				  </div>
				  	  
				  <input type="text" aria-label="First name" class="form-control" id="from_ano" name="from_ano" placeholder="계좌번호">
				  <input type="text" aria-label="First name" class="form-control" id="from_name" name="from_name" placeholder="이름" readonly>
			
				  <div class="input-group-append" style="width:18%">
				    <button class="btn btn-outline-secondary" type="button" id="check_from_ano" style="width:100%">계좌 확인</button>
				  </div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text" style="width:100%"><strong>보내는 사람</strong></p>
			  </div>
			  <input type="text"  class="form-control" id="message" name="message" placeholder="미입력시 예금주명" required>
			</div>
			</td>
		</tr>
		
		<tr>
			<td>
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text" style="width:100%"><strong>계좌이체</strong></p>
			  </div>
			  <input type="text"  class="form-control" id="amount" name="amount" placeholder="송금액" required>
			  <input type="text"  class="form-control" id="amount_korean" name="amount_korean" placeholder="" readonly>
			</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="d-flex justify-content-end">
					<div class="btn-group outline-primary" role="group">
						<button class="btn btn-outline-primary" style="border-radius:0.25em;" type="submit" id="submitBtn">계좌이체</button>
					</div>
				</div>
			</td>
		</tr>
		</table>
		
		<sec:csrfInput/>
		
	</form>
	
	
	
	
	
	
	
	
	
</div>
</div>
		
<script>
let hn = "${_csrf.headerName}";
let tk = "${_csrf.token}"
</script>


	


	
<script src="/resources/js/member/customer/customer_anolist.js"></script>
<script src="/resources/js/member/customer/customer_transfer.js"></script>