<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header_Main.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(function(){
	$("#withdraw").addClass("active");
})
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
a:visited {color:black; text-decoration:none;}
.asideHeader a:visited {color:#fff; text-decoration:none;}
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
aside {
    width: 340px;
    color: #ffff;
    /* padding: 10px; */
    /* margin: 10px; */
    /* margin-top:50px; */
    padding-bottom: 650px;
    box-sizing: border-box;
    border: 7px solid;
    position: absolute;
    font-size: 35px;
    background-color: #336633;
   	visited {color:#9e9e9e; text-decoration:none;}
   }

.aside_content{
	margin-top:30px;
	margin-left: 50px;
	font-size: 22px;
	font: bolder;
}
.tag_var button {
	color: #fff;
}

</style>
<title>SamBank 개인뱅킹-계좌이체 </title>
</head>
<body>
	<div id="title_imageo" style="margin-left: 3%">  
	  <strong><img src="/resources/SB_files/title logo.png" alt="로고 이미지"></strong>
	  <a class="navbar-brand" src="/resources/SB_files/title logo.png" href="#"></a>
	</div>
	
	<br />
	
	
	
    <div class="tag_var">
    <!--  -->
      <nav class="navbar navbar-expand-lg navbar-light"style="background-color: #666633;">
        <div class="collapse navbar-collapse" id="navbarnav">
      		<!-- Example split danger button -->
				<div class="btn-group">
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="">공지사항</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="">보안센터</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="">자료실</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="">새소식</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="">이벤트</a></button>
				  <!-- 2 -->
				  <div class="btn-group" style="margin-left: 25px;">
					  <button type="button" class="btn btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    문의 사항
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="#">문의사항</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="#">문의사항 작성</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="#">문의사항 취소</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="#">1:1 비공개 문의사항</a>
					  </div>
					</div>
				  <!-- 3 -->
				  <div class="btn-group" style="margin-left: 25px;">
					  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    카드 관련
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="#">카드 신청</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="#">카드 취소</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="#">카드 결과 확인</a>
					  </div>
					</div>


				</div>
     	 </div>
      
      
      
      

      </nav>
      <!--nav영역 종료-->
     </div>
     
     
     
     
     
     
     <aside>
     	<div class="asideHeader">
     	<ul>
     	<li>
     	<a href="">개인뱅킹</a>
     	<div class="dropdown-divider"></div>
     	</li>
     	<div class="aside_content">
     	 	<li>     	
	     	<a href="/deposit">계좌이체</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
	     	<li>
	     	<a href="/depositList">입출금내역</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
	     	<li>      	
	     	<a href="/accountList">계좌조회</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
	     	<li>     	
	     	<a href="/accountCreate">계좌신청</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
	     	<li>     	
	     	<a href="/accountDelete">계좌삭제신청</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
     	</div>
     	</ul>
     	</div>
  	
     </aside>
     
     
     
     
     
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
      <h4 class="mb-3 title">계좌	 이체</h4>
	<hr class="mb-4">
      <form action="" class="needs-validation" novalidate="novalidate" method="post" id="withdrawForm">
      
        <div class="mb-3">
       	 <div class="label d-flex justify-content-between">
       	  <div class="col-6" style="padding:0">
	          <label for="accountNumber">출금 계좌번호</label>
          </div>
          	
         </div>
		<div class="input-group">
			<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="total" name="total" style="width:100%">보유 계좌</button>
			    <div class="dropdown-menu" id="ano-list">
			    	<c:forEach items="${list }" var="vo">
			    		<a class='dropdown-item account-item'  href='#'><c:out value="${vo.ano}"></c:out> </a>
		    		</c:forEach>
			    </div>
			    	  <input type="text" class="form-control valid" name="ano" id="ano" readonly="ano" >
			    	  	    
					 <input type="text" class="form-control valid" name="remain" id="remain"  readonly>
					 <button class="btn btn-outline-secondary" type="button" id="check_ano" style="width:10%">계좌잔액 확인</button>
			</div>
        </div>
      
			    		
		
		<div class="mb-3">
		<div class="label d-flex justify-content-between">
       	  <div class="col-6" style="padding:0">
	          <label for="">받는 분 정보</label>
          </div>
        </div>
        	
		<div class="account-list" style="width:100% padding:0">
			<button class="btn btn-outline-secondary" type="button" style="width:23%">자주쓰는</button>
			<button class="btn btn-outline-secondary" type="button" style="width:23%">빠른이체</button>
			<button class="btn btn-outline-secondary" type="button" style="width:23%">최근이체</button>
			<button class="btn btn-outline-secondary" type="button" style="width:23%">내계좌</button>
			</div>
        </div>
		
       	<div class="mb-3">
		<div class="label">
          <label for="deposit-account">입금 계좌번호 </label>
          <small name="deposit-account">
            
          </small>
          </div>
          <input type="text" class="form-control" name="from_ano" id="from_ano" placeholder="입금계좌번호(숫자만 입력)" required>
        </div>
		
        
        
        <div class="mb-3">
		<div class="label d-flex justify-content-between">
       	  <div class="col-6" style="padding:0">
	          <label for="">이체금액</label> 	
          </div>
        </div>
         
        <div class="balance mb-3" style="width:100%">
			<button class="btn btn-secondary" type="button" style="width:18%" id="M100">+100만</button>
			<button class="btn btn-secondary" type="button" style="width:18%" id="M10">+10만</button>
			<button class="btn btn-secondary" type="button" style="width:18%" id="M5">+5만</button>
			<button class="btn btn-secondary" type="button" style="width:18%" id="M1">+1만</button>
			<button class="btn btn-secondary" type="button" style="width:18%" id="MAll">전액</button>
		</div>
			<input type="text" class="form-control" name="amount" id="amount" placeholder="입금 금액" required>
        </div>
		
        
        
        <div class="mb-3">
        <div class="label">
          <label for="sendName">받는분 통장 표시</label>
          <small name="sendName">
            
          </small>
          </div>
          <input type="text" class="form-control" name="message" id="message" placeholder="미입력시 예금주명">
        </div>
        
        
        <div class="mb-3">
	        <div class="label d-flex justify-content-between">
	       	  <div class="col-6" style="padding:0">
		          <label for="">비밀번호 입력</label>
	          </div>
	        </div>
        	<div class="input-group" style="width:100%">
			  <div class="input-group-prepend col-6" style="width:35%">
			    <p class="input-group-text" style="width:30%"><strong>비밀번호</strong> </p>
			  <input type="password" class="form-control valid" name="password" id="password" readonly="" aria-invalid="false">
			    <button class="btn btn-outline-secondary" type="button" id="passwordBtn">
			    	<svg class="bi bi-grid-3x3-gap" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path stroke="#000" d="M1.5 2a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V2zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V7zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5v-2z"></path>
					</svg>
			    </button>
			  </div>
			  <div class="input-group-prepend col-6" style="width:35%">
  			    <p class="input-group-text" style="width:30%"><strong>비밀번호 확인</strong> </p>
			  <input type="password" class="form-control valid" name="confirm_password" id="confirm_password" readonly=""required>
			  <button class="btn btn-outline-secondary" type="button" id="confirm_passwordBtn">
			    	<svg class="bi bi-grid-3x3-gap" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path stroke="#000" d="M1.5 2a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V2zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V7zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5v-2z"></path>
					</svg>
			    </button>
			   
			  </div>
			  <div class="input-group-prepend col-6" style="width:20%">
			 	 <button class="btn btn-secondary" type="button"  id="changePwdBtn">
			    	비밀번호 확인
			    </button>
			    </div>
			  <div class="input-group-append">
			  </div>
			</div>        
			</div>
        	 
        
        <hr class="mb-4">
        

     
        <button class="btn btn-primary btn-lg btn-block" type="submit" id="submitBtn">이체</button>
     	<sec:csrfInput/>
      </form>
    </div>
    <div class="bottom">
    </div>
<!-- <script src="/resources/js/admin/customer/admin_registerCustomer.js"></script> -->
</div></main>

		
		  <input type="hidden"  class="form-control" id="hidden_balance" name="hidden_balance" >		
       
 
</body>
</html>
<script>
</script>
<%@include file="../../includes/footer_Main.jsp" %>
<script src="/resources/js/member/customer/customer_anolist.js"></script>
<script src="/resources/js/member/customer/customer_transfer.js"></script>
