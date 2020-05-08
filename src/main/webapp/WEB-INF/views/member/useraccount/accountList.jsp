<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header_Main.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>

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
<title>SamBank 개인뱅킹-계좌조회 </title>
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
      <h4 class="mb-3 title">계좌	 조회</h4>
	<hr class="mb-4">
      <form class="needs-validation" novalidate="novalidate" method="post" id="register_customer">
      
        <div class="mb-3">
       	 <div class="label d-flex justify-content-between">
       	  <div class="col-12" style="margin-right: auto; position: relative; font-weight: bold; font-size: 20px;">
	          <label for="balance">자산</label>
	          <label for="total-balance" style="float: right; color:#336633;">가지고 있는 총 금액 원</label>
          </div>
          
         </div>
         
	<hr class="mb-0" style="border: 0; height: 3px; background: #E5E5E5;">
		<div class="mb-3">
		<div class="label d-flex justify-content-between">
       	  <div class="col-12" style="width: 100%; background-color:#FBFBFB; font-weight: bold;">
	          <label for="deposit">입출금</label>
          </div>
        </div>
        <div class="col-12 mt-3" style="margin-right: auto; position: relative; font-weight: bold;">
	          <label for="balance">xx 통장</label>
	          <label for="total-balance" style="font-weight: bold; float: right;">통장 잔액 원</label>
          </div>
        <div class="col-12" style="margin-right: auto; position: relative;">
	          <label for="balance">통장 번호</label>
	          <label for="total-balance" style="float: right;">통장상품명</label>
        	</div>
        </div>
		<hr class="mb-4">
		↑이런식으로 리스트
		<hr class="mb-0" style="border: 0; height: 3px; background: #E5E5E5;">
		<div class="mb-3">
		<div class="label d-flex justify-content-between">
       	  <div class="col-12" style="width: 100%; background-color:#FBFBFB; font-weight: bold;">
	          <label for="deposit">적금</label>
          </div>
        </div>
        <div class="col-12 mt-3" style="margin-right: auto; position: relative; font-weight: bold;">
	          <label for="balance">xx 통장</label>
	          <label for="total-balance" style="font-weight: bold; float: right;">통장 잔액 원</label>
          </div>
        <div class="col-12" style="margin-right: auto; position: relative;">
	          <label for="balance">통장 번호</label>
	          <label for="total-balance" style="float: right;">통장상품명</label>
        	</div>
        </div>
		<hr class="mb-4">
        ↑이것도 이런식으로 리스트
        <hr class="mb-0" style="border: 0; height: 3px; background: #E5E5E5;">
		<div class="mb-3">
		<div class="label d-flex justify-content-between">
       	  <div class="col-12" style="width: 100%; background-color:#FBFBFB; font-weight: bold;">
	          <label for="deposit">대출?</label>
          </div>
        </div>
        <div class="col-12 mt-3" style="margin-right: auto; position: relative; font-weight: bold;">
	          <label for="balance">xx 통장</label>
	          <label for="total-balance" style="font-weight: bold; float: right;">통장 잔액 원</label>
          </div>
        <div class="col-12" style="margin-right: auto; position: relative;">
	          <label for="balance">통장 번호</label>
	          <label for="total-balance" style="float: right;">통장상품명</label>
        	</div>
        </div>
		<hr class="mb-4">
        ↑이것도 이런식으로 리스트
        <input type="hidden" name="_csrf" value="">
        <button class="btn btn-primary btn-lg btn-block" type="submit" id="submit">문의??</button>
      </form>
    </div>
    <div class="bottom">
    </div>
<!-- <script src="/resources/js/admin/customer/admin_registerCustomer.js"></script> -->
</div></main>


		
		
        

</body>
</html>
<%@include file="../../includes/footer_Main.jsp" %>
<script src="/resources/js/user/account/user_modifyAccount.js"></script>