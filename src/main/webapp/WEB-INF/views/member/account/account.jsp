<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		
		
		<tr>
			<td class="align-middle">
			<div class="input-group">
			  <input type="text"  class="form-control" id="cno" name="cno" placeholder="${cno }"   readonly>
			  <input type="text"  class="form-control" id="name" name="name" placeholder="${name }" readonly>
			  <div class="input-group-append" style="width:18%">
			    
			    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="total" name="total" style="width:100%">보유 계좌</button>
			    <div class="dropdown-menu" id="ano-list">
			    	<c:forEach items="${list }" var="vo">
			    		<a class='dropdown-item account-item' href='#'><c:out value="${vo.ano }"></c:out> </a>
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
		
	<input type="hidden" name="ano">
<script>
$(function(){
	$("#histACC").addClass("active");
	let date = new Date();
	$("input[name='end_date']").val(date.toISOString().slice(0, 10));
	date.setMonth(date.getMonth()-6);
	$("input[name='start_date']").val(date.toISOString().slice(0, 10));
})
</script>

<script src="/resources/js/member/customer/customer_historyAccount.js"></script>