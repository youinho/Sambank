<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/account_header_Main.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>

function alert_success(){
	let success = "${success}";
	
	if(success ==="" || history.state){
		return;
	}
	
	
	if(success != "" && success != null){
		if(success=="true"){
			alert("계좌가 삭제 되었습니다.");
		}else if(success=="false"){
			alert("계좌 삭제에 실패했습니다.");
		}
	}
}
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css"> -->
<title>SamBank 개인뱅킹-계좌조회 </title>
</head>
<body>
	
     
  <!--    
     <aside>
     	<div class="asideHeader">
     	<ul>
     	<li>
     	<a href="">개인뱅킹</a>
     	<div class="dropdown-divider"></div>
     	</li>
     	<div class="aside_content">
     	 	<li>     	
	     	<a href="deposit">계좌이체</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
	     	<li>
	     	<a href="depositList">입출금내역</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
	     	<li>      	
	     	<a href="accountList">계좌조회</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
	     	<li>     	
	     	<a href="accountCreate">계좌신청</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
	     	<li>     	
	     	<a href="accountDelete">계좌삭제신청</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
     	</div>
     	</ul>
     	</div>
  	
     </aside>
      -->
     
     
     
     
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

	<div class="col-md-10 order-md-1">
      <h4 class="mb-3 title">계좌 삭제</h4>
      	<hr class="mb-4">
      
      <form action="" class="needs-validation" novalidate="novalidate" method="post" id="accountDelete">
      
  
   <table class="table table-bordered">
  
  <tbody>
  	 <tr>
    <th style="vertical-align: middle; text-align: center;">계좌 종류</th>

    <td style="vertical-align: middle; text-align: center;" colspan="10">
     <select name="account" id="account"  class="form-control" placeholder="입금 금액">
   		<option value="계좌선택" hidden>계좌 선택</option>	
      <c:forEach items="${list }" var="vo">

      	<option value="${vo.ano }"><c:out value="${vo.ano }"></c:out></option>
      </c:forEach>
     </select>
    </td> 
     
    <tr>
      <th colspan="1" style="width: 10%; vertical-align: middle; text-align: center; ">성명</th>
      <td colspan="4" style="width: 20%"><input type="text" class="form-control" id="name" name="name" readonly></td>
      <th colspan="1" style="width: 10%; vertical-align: middle; text-align: center; ">생년월일</th>
      <td colspan="4" style="width: 20%"><input type="text" class="form-control" id="birth" name="birth" readonly></td>
    </tr>
   
   
   
         
  
   

   
    <th colspan="1" style="vertical-align: middle; text-align: center;">상품</th>
      <td colspan="4" style="vertical-align: middle; text-align: center;">
      <input type="text" class="form-control" id="type_text" name="type_text" readonly>
    	<input type="hidden" id="type" name="type">
    	</td>
    <th colspan="1" style="vertical-align: middle; text-align: center;">상품명</th>
    <td colspan="4" style="vertical-align: middle; text-align: center;">
	    <input type="text" class="form-control" name="p_name" readonly>
	    <input type="hidden" id="product" name="product">
     </td>  
   </tr>
   
   <tr>
    <th colspan="1" style="vertical-align: middle; text-align: center;" >계좌번호</th>
    <td colspan="4"><input type="account-number" class="form-control" id="ano" name="ano"readonly></td>  
	<th colspan="1" style="vertical-align: middle; text-align: center;" >카드 보유 갯수</th>
    <td colspan="4"><input type="account-number" class="form-control" id="cardCount_text" name="cardCount_text" placeholder="개" readonly style="text-align: right;"></td>  
  					<input type="hidden" name="cardCount" id="cardCount">
   </tr>
      
    <tr>
      <th colspan="1" style="vertical-align: middle; text-align: center; ">생성날짜</th>
      <td colspan="4"><input type="text" class="form-control" id="createDate_text" name="createDate_text" readonly></td>
    	
      <th colspan="1" style="vertical-align: middle; text-align: center; ">잔여예금</th>
      <td colspan="4"><input type="text" class="form-control" name="balance_text" readonly placeholder="원" style="text-align: right;"></td>
  					  <input type="hidden" class="form-control" name="balance" readonly>
	  </tr>	
    
    
    <tr>
      <th colspan="1" style="vertical-align: middle; text-align: center; ">비밀번호 입력</th>
      <td colspan="10"><div class="input-group" style="width:38%">
			  <input type="password" class="form-control valid" name="password" id="password" readonly="" aria-invalid="false">
			    <button class="btn btn-outline-secondary" type="button" id="passwordBtn">
			    	<svg class="bi bi-grid-3x3-gap" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path stroke="#000" d="M1.5 2a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V2zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V7zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5v-2z"></path>
					</svg>
			    </button>
			  </div>
			  </td>
    </tr>
    
      
   <tr>
    <td colspan="10">
    
    <input type="submit" class="btn btn-primary" id="submitBtn" value="신청">
   	<sec:csrfInput/>
    <input type="reset" class="btn btn-danger" value="취소">
    
    </td>
   </tr>
    </tbody>
   
  </table>
 </form>
 </div>
	
	</main>


		
		
        

</body>
</html>
<%@include file="../../includes/footer_Main.jsp" %>
<script src="/resources/js/member/customer/customer_delete_request.js"></script>
<!-- <script src="/resources/js/admin/customer/admin_registerCustomer.js"></script>
 -->
 <script type="text/javascript">
    
    
</script>