<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/account_header_Main.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>SamBank 개인뱅킹-계좌조회 </title>
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
      <h4 class="mb-3 title">계좌	 조회</h4>
	<hr class="mb-4">
      <form class="needs-validation" novalidate="novalidate" method="post" id="register_customer">
      
        <div class="mb-3">
       	 <div class="label d-flex justify-content-between">
       	  <div class="col-12" style="margin-right: auto; position: relative; font-weight: bold; font-size: 20px;">
	          <label for="balance">자산</label>
	          <label for="total-balance" style="float: right; color:#336633;"><fmt:formatNumber value="${sumBalance }" type="currency"/> </label>
          </div>
          
         </div>
         
	
		<hr class="mb-0" style="border: 0; height: 3px; background: #E5E5E5;">
		<div class="mb-3">
		
		<div class="label d-flex justify-content-between">
       	  <div class="col-12" style="width: 100%; background-color:#FBFBFB; font-weight: bold;">
	          <label for="deposit">입출금</label>
          </div>
        </div>
        <c:forEach items="${list }" var="vo">
        <c:set var="type" value="${vo.type }"/>
		<c:if test="${type == 1 }">
        <div class="col-12 mt-3" style="margin-right: auto; position: relative; font-weight: bold;">
	          <label for="balance">입출금</label>
	          <label for="total-balance" style="font-weight: bold; float: right;"><fmt:formatNumber value="${vo.balance }" type="currency"/></label>
          </div>
        <div class="col-12" style="margin-right: auto; position: relative;">
	          <label for="balance"><c:out value="${vo.ano }"></c:out></label>
	          <label for="total-balance" style="float: right;"><c:out value="${vo.p_name }"></c:out></label>
        	</div>
        	</c:if>
        	</c:forEach>
        </div>
        
		<hr class="mb-4">
		
		<hr class="mb-0" style="border: 0; height: 3px; background: #E5E5E5;">
		<div class="mb-3">
		<div class="label d-flex justify-content-between">
       	  <div class="col-12" style="width: 100%; background-color:#FBFBFB; font-weight: bold;">
	          <label for="deposit">적금</label>
          </div>
        </div>
        <c:forEach items="${list }" var="vo">
        <c:set var="type" value="${vo.type }"/>
		<c:if test="${type == 2 }">
       <div class="col-12 mt-3" style="margin-right: auto; position: relative; font-weight: bold;">
	          <label for="balance">적금</label>
	          <label for="total-balance" style="font-weight: bold; float: right;"><fmt:formatNumber value="${vo.balance }" type="currency"/></label>
          </div>
        <div class="col-12" style="margin-right: auto; position: relative;">
	          <label for="balance"><c:out value="${vo.ano }"></c:out></label>
	          <label for="total-balance" style="float: right;"><c:out value="${vo.p_name}"></c:out></label>
        	</div>
        	</c:if>
        	</c:forEach>
        </div>
		<hr class="mb-4">
       
        <hr class="mb-0" style="border: 0; height: 3px; background: #E5E5E5;">
		<div class="mb-3">
		<div class="label d-flex justify-content-between">
       	  <div class="col-12" style="width: 100%; background-color:#FBFBFB; font-weight: bold;">
	          <label for="deposit">대출</label>
          </div>
        </div>
        <c:forEach items="${list }" var="vo">
        <c:set var="type" value="${vo.type }"/>
		<c:if test="${type == 3 }">
        <div class="col-12 mt-3" style="margin-right: auto; position: relative; font-weight: bold;">
	          <label for="balance">대출</label>
	          <label for="total-balance" style="font-weight: bold; float: right;"><fmt:formatNumber value="${vo.balance }" type="currency"/></label>
          </div>
        <div class="col-12" style="margin-right: auto; position: relative;">
	          <label for="balance"><c:out value="${vo.ano }"></c:out></label>
	          <label for="total-balance" style="float: right;"><c:out value="${vo.p_name}"></c:out></label>
        	</div>
        	</c:if>
        	</c:forEach>
        </div>
		<hr class="mb-4">
      
        <input type="hidden" name="_csrf" value="">
        <button class="btn btn-primary btn-lg btn-block" type="submit" id="submit">문의??</button>
      </form>
    </div>
    <div class="bottom">
    </div>
<!-- <script src="/resources/js/admin/customer/admin_registerCustomer.js"></script> -->
</div></main>

<script>
function viewRest(restNumber) {
	return restNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
}

</script>
		
		
        

</body>
</html>
<%@include file="../../includes/footer_Main.jsp" %>
<script src="/resources/js/user/account/user_modifyAccount.js"></script>
