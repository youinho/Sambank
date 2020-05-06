<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

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
		<h3 class="page-header title">잔액확인</h3>
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