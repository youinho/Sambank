<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/account_header_Main.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<script>

</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* a:visited {color:black; text-decoration:none;}
.tag_var a:visited {color:#fff; text-decoration:none;}
a:hover {color:#5a5a5a; text-decoration:none;}
a:link {color:#9e9e9e; text-decoration:none;}
html, body, div, span, object, iframe,h1, h2, h3, h4, h5, h6, p, blockquote, pre,a, abbr, acronym, address, big, cite, code,del, dfn, em, img, strong, sub, sup, var,
h1, h2, h3, h4, h5, h6 {font-family:'맑은 고딕', 'Malgun Gothic','돋움',Dotum,AppleGothic,Tahoma,Helvetica,sans-serif;}
main{
	width : 70%;
	position: relative;
	margin-left: 300px;
	margin-top: 50px;
	font: bolder;
	position: fixed;
    left: 120px;
}
[class^="sm"]{
	border: 1px solid white;
}

.tag_var button {
	color: #fff;
}
 */
</style>
<title>SamBank 개인뱅킹-입출금내역</title>
</head>
<body>
	
     
     
     
     
     
     <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
	<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
	<div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
	<div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0">
	</div></div>
	<div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
	<div style="position:absolute;width:200%;height:200%;left:0; top:0">
	</div></div></div>
     

    
    <!-- </main>
  </div>
</div> -->

        <div id="page-wrapper">
        
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
<script src="/resources/js/user/account/user_registerCustomer_validate.js"></script>
<script>

</script>

	<div class="col-md-9 order-md-1">
      <h4 class="mb-3 title">입출금 내역</h4>
	<hr class="mb-4">
      <form class="needs-validation" novalidate="novalidate" method="post" id="register_customer">
      
        <div class="mb-3">
       	 <div class="label d-flex justify-content-between">
       	  <div class="col-6" style="padding:0">
	          <label for="accountNumber">계좌번호</label>
          </div>
          
         </div>
		<div class="mb-3">
			<div class="label d-flex justify-content-between">
			<select name="account" id="account"  class="form-control" placeholder="입금 금액">
   				<option value="계좌선택" hidden>계좌선택</option>	
    			  <c:forEach items="${list }" var="vo">

      				<option value="${vo.ano }"><c:out value="${vo.ano }"></c:out></option>
     			 </c:forEach>
    		 </select>
 		</div>
 		
  		    <div class="input-group col-12 mt-3" style="width:100%">
			    <p class="input-group-text" style="width:20%"><strong>선택 계좌</strong> </p>
			  <input type="text" class="form-control valid" name="ano" id="ano" readonly="ano" aria-invalid="false">
			  </div>
			<div class="input-group mt-3" style="width:100%">
			  <div class="input-group-prepend col-6" style="width:45%">
			    <p class="input-group-text" style="width:40%"><strong>잔액</strong> </p>
			  <input type="text" class="form-control valid" name="balance" id="balance" readonly aria-invalid="false" placeholder="원" style="text-align: right;">
			   
			  </div>
			  <div class="input-group-prepend col-6" style="width:45%">
  			    <p class="input-group-text" style="width:40%"><strong>출금가능금액</strong> </p>
			  <input type="text" class="form-control valid" name="max_withdraw" id="max_withdraw" readonly aria-invalid="false" placeholder="원" style="text-align: right;">
			  
			  </div>
			  <div class="input-group-append">
			  </div>
			</div>        
		</div>
        <hr class="mb-3"/>
        </div>
        
        <div class="mb-3">
			<div class="label d-flex justify-content-between">
       	  		<div class="col-6" style="padding:0">
	          		<label for="setDay">기간설정</label>
          		</div>
          
        	</div>
	
        	<div class="search-list" style="width:100%;">
				<button class="btn btn-outline-secondary" type="button" id="today" style="width:14.8%"  >당일</button>
				<button class="btn btn-outline-secondary" type="button" id="week" style="width:14.8%">일주일</button>
				<button class="btn btn-outline-secondary" type="button" id="1-month" style="width:14.8%">1개월</button>
				<button class="btn btn-outline-secondary" type="button" id="3-month" style="width:14.8%">3개월</button>
				<button class="btn btn-outline-secondary" type="button" id="6-month" style="width:14.8%">6개월</button>
				<button class="btn btn-outline-secondary" type="button" id="12-month" style="width:14.8%">12개월</button>
			</div>
        </div>
        <hr class="mb-3">
               
		
       	<div class="mb-3">
		<div class="label d-flex justify-content-between">
       	  <div class="col-6" style="padding:0">
	          <label for="deposit-date">날짜 </label>
          </div>
          
         </div>
      		<div class="input-group" style="width:100%">
         	 	<input type="date"  class="form-control" name="start_date" id="start_date" style="width:20%">~
         	 	<input type="date"  class="form-control" name="end_date" id="end_date" style="width:20%">
         	 	<button class="btn btn-success" type="submit" id="historyBtn" style="width:10%">검색</button>
          	</div>
        </div>
		<hr class="mb-3">
		<div class="input-group" style="width:100%">
			  <div class="input-group-prepend col-6" style="width:30%">
			    <p class="input-group-text" style="width:40%"><strong>입금</strong> </p>
			  <input type="text" class="form-control valid" name="sum_withdrawal" id="sum_withdrawal" readonly="" aria-invalid="false" placeholder="총 입금금액" style="text-align: right;">
			   
			  </div>
			  <div class="input-group-prepend col-6" style="width:30%">
			    <p class="input-group-text" style="width:40%"><strong>출금</strong> </p>
			  <input type="text" class="form-control valid" name="sum_deposit" id="sum_deposit" readonly="" aria-invalid="false" placeholder="총 출금금액" style="text-align: right;">
			   
			  </div>
			 <!--  <div class="input-group-prepend col-4" style="width:30%">
  			    <p class="input-group-text" style="width:40%"><strong>이체</strong> </p>
			  <input type="text" class="form-control valid" name="maxBalance" id="maxBalance" readonly="" placeholder="총 이체건수">
			  
			  </div> -->
			  <div class="input-group-append">
			  </div>
			</div>     
        
        <hr class="mb-4">
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
        <hr class="mb-4">
        
        
        <button class="btn btn-primary btn-lg btn-block" type="submit" id="listAllBtn">더보기+</button>
      	<sec:csrfInput/>
      </form>
    </div>
    <div class="bottom">
    </div>
<!-- <script src="/resources/js/admin/customer/admin_registerCustomer.js"></script> -->
</div></main>


 <input type="hidden" name="ano" id="ano" value="${vo.ano}">		
		
        
<script>
console.log(ano );
console.log(max_withdraw );
$(function(){
	$("#histACC").addClass("active");
	let date = new Date();
	$("input[name='end_date']").val(date.toISOString().slice(0, 10));
	date.setMonth(date.getMonth()-6);
	$("input[name='start_date']").val(date.toISOString().slice(0, 10));
})


</script>
</body>
</html>
<%@include file="../../includes/footer_Main.jsp" %>
<script src="/resources/js/member/customer/customer_anolist_depositList.js"></script>
<script src="/resources/js/member/customer/customer_historyAccount.js"></script>
