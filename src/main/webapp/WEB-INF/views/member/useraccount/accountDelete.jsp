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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css"> -->
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
      <h4 class="mb-3 title">계좌	삭제 신청</h4>
      	<hr class="mb-4">
      
      <form class="needs-validation" novalidate="novalidate" method="post" id="register_customer">
      
  
   <table class="table table-bordered">
  
  <tbody>
  	 <tr>
    <th style="vertical-align: middle; text-align: center;">계좌 종류</th>
    <td style="vertical-align: middle; text-align: center;" colspan="5">
     <select name="account" id="account" class="form-control" >
      
      <c:forEach items="${list }" var="vo">
      	<option value="${vo.ano }"><c:out value="${vo.ano }"></c:out></option>
      </c:forEach>
     </select>
    </td> 
     
    <tr>
      <th colspan="1" style="width: 10%; vertical-align: middle; text-align: center; ">성명</th>
      <td colspan="4" style="width: 20%"><input type="text" class="form-control" id="name" name="name" placeholder="예) 홍길동"></td>
      <th colspan="1" style="width: 10%; vertical-align: middle; text-align: center; ">생년월일</th>
      <td colspan="4" style="width: 20%"><input type="text" class="form-control" id="birth" name="birth" placeholder="예) 900101"></td>
    </tr>
   
   
   
         
  
   

   
    <th colspan="2" style="vertical-align: middle; text-align: center;">상품</th>
      <td colspan="3" style="vertical-align: middle; text-align: center;">
      <input type="hidden" class="form-control" name="type" readonly>
    	 <input type="text" class="form-control" name="type_text" readonly>
    	</td>
    <td colspan="3" style="vertical-align: middle; text-align: center;">
	    <input type="text" class="form-control" name="p_name" readonly>
     </td>  
   </tr>
   
   <tr>
    <th colspan="1" style="vertical-align: middle; text-align: center;" >계좌번호</th>
    <td colspan="9"><input type="account-number" class="form-control" name="ano"readonly></td>  
   </tr>
      
    <tr>
      <th colspan="1" style="vertical-align: middle; text-align: center; ">계좌정보</th>
      <td colspan="4"><input type="text" class="form-control" name="name" placeholder="최근 거래일"></td>
      <th colspan="1" style="vertical-align: middle; text-align: center; ">잔여예금</th>
      <td colspan="4"><input type="text" class="form-control" name="balance" readonly></td>
    </tr>
    
    
    <tr>
      <th colspan="1" style="vertical-align: middle; text-align: center; ">비밀번호 입력</th>
      <td colspan="4"><div class="input-group" style="width:100%">
			  <input type="password" class="form-control valid" name="password" id="password" readonly="" aria-invalid="false">
			    <button class="btn btn-outline-secondary" type="button" id="passwordBtn">
			    	<svg class="bi bi-grid-3x3-gap" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path stroke="#000" d="M1.5 2a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V2zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V7zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5v-2z"></path>
					</svg>
			    </button>
			  </div>
			  </td>
      <th colspan="1" style="vertical-align: middle; text-align: center; ">비밀번호 확인</th>
      <td colspan="4"><div class="input-group" style="width:100%">
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
    <input type="submit" class="btn btn-primary" value="신청">
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
    $(function () {
        $('#datetimepicker1').datetimepicker({ format: 'L'});
        $('#datetimepicker2').datetimepicker({
            format: 'L',
            useCurrent: false
        });
        $("#datetimepicker1").on("change.datetimepicker", function (e) {
            $('#datetimepicker2').datetimepicker('minDate', e.date);
        });
        $("#datetimepicker2").on("change.datetimepicker", function (e) {
            $('#datetimepicker1').datetimepicker('maxDate', e.date);
        });
        
    });
    
</script>