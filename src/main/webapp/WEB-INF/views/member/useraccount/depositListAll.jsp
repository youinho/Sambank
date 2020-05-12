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

	<div class="col-md-9 order-md-1">
      <h4 class="mb-3 title">입출금 내역</h4>
	<hr class="mb-4">
      <form class="needs-validation" novalidate="novalidate" method="post" id="register_customer">

 		<input type=hidden name="ano" id="ano" value="${ano}">
		 <input type=hidden name="start_date" id="start_date" value="${start_date}">
		 <input type=hidden name="end_date" id="end_date" value="${end_date}">        
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
        
      
      </form>
    </div>
    <div class="bottom">
    </div>
<!-- <script src="/resources/js/admin/customer/admin_registerCustomer.js"></script> -->
</div></main>


 <input type="hidden" name="ano" id="ano" value="${vo.ano}">		
		
        
<script>



</script>
</body>
</html>
<%@include file="../../includes/footer_Main.jsp" %>
<script src="/resources/js/member/customer/customer_historyAccountAll.js"></script>
