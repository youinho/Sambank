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
} */

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
<script src="/resources/js/member/customer/customer_request_validate.js"></script>

<script>

</script>

	<div class="col-md-10 order-md-1">
      <h4 class="mb-3 title">계좌	 신청</h4>
      	<hr class="mb-4">
      
      <form class="needs-validation" novalidate="novalidate" method="post" id="customer_request">
      
  
   <table class="table table-bordered">
  
  <tbody>
    <tr>
      <th style="width: 10%; vertical-align: middle; text-align: center; ">성명</th>
      <td colspan="4" style="width: 20%"><input type="text" class="form-control" id="name" name="name" placeholder="예) 홍길동"></td>
      <th style="width: 10%; vertical-align: middle; text-align: center; ">생년월일</th>
      <td colspan="4" style="width: 20%"><input type="text" class="form-control" id="birth" name="birth" placeholder="예) 900101"></td>
    </tr>
    
   
   <tr>
    <th style="vertical-align: middle; text-align: center;" >영어이름</th>
    <td colspan="4"><input type="text" class="form-control" id="eng_name" name="eng_name" placeholder="예) Hong Gil Dong"></td>  
    <th style="vertical-align: middle; text-align: center;" >전화번호</th>
    <td colspan="4"><input type="text" class="form-control" id="mobile" name="mobile" placeholder="예) 010-0000-0000"></td>  
   </tr>
   
   <tr>
    <th style="vertical-align: middle; text-align: center;" >이메일</th>
    <td colspan="7"><input type="email" class="form-control" id="email" name="email" placeholder="예) sambank@sambank.com"></td>  
   </tr>
   
   <tr>
    <th style="vertical-align: middle; text-align: center;" >주소</th>
    <td colspan="7"><div class="mb-3">
         <div class="label">
          <label for="address"></label><button class="btn btn-outline-primary btn-sm" id="search_juso">주소 검색</button>
          <small name="address">
            
          </small>
         </div>
         <input type="text" class="form-control" name="address" id="address" placeholder="예) 서울시 노원구 공릉동 444-2" readonly="">
        </div></td>  
   </tr>
   
   <tr>
    <th style="vertical-align: middle; text-align: center;">계좌 종류</th>
    <td style="vertical-align: middle; text-align: center;" colspan="1">
     <select name="account" id="account" class="form-control" >
      <option value="1">예금계좌</option>
      <option value="2">적금계좌</option>
      <option value="3">대출계좌</option>
     </select>
    </td>  
   <input type="hidden" id="type" name="type">

   
    <th style="vertical-align: middle; text-align: center;">상품</th>
    <td colspan="5" style="vertical-align: middle; text-align: center;">
    <input type="radio"  name="product1" value="01" >SamBanK-부자 &nbsp;
    <input type="radio"  name="product1" value="02">SamBanK-갑부 &nbsp;
    <input type="radio"  name="product1" value="03">SamBanK-금돼지 &nbsp;
    </td>  
   </tr>
   <input type="hidden" id="product" name="product">
   
      
   <tr>
    <th style="vertical-align: middle; text-align: center;">방문지점</th>
    <td colspan="7">
    	<input type="text" class="form-control" id="visitAddress" name="visitAddress" placeholder="예) 공릉지점">
    </td>  
   </tr>
   
   
   <tr>
    <th style="vertical-align: middle; text-align: center;">방문희망일시</th>
    <td colspan="7" >
    <div class='x' style="width:30%; vertical-align: middle;">
    <div class="form-group">
        <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
            <input type="text" class="form-control datetimepicker-input" id="visitdate" data-target="#datetimepicker1" value="05/05/2020">
            <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
            </div>
        </div>
    </div>
	</div> 
	</td>
   </tr>
   
   
   <tr>
    <td colspan="10">
    <input type="submit" class="btn btn-primary" id="submitID" value="신청">
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
<script src="/resources/js/member/customer/customer_request.js"></script>
<script src="/resources/js/admin/customer/admin_registerCustomer.js"></script>
 
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