<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- resources 앞에 / 를 붙일때는 context path가 없는 경우일 때 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<!-- validation 사용자 작성 코드 삽입-->
<script src="/resources/js/register.js"></script>

</head>
<body  style="background-color:#F5F5F5;">
<div class="container" style="margin-top:40px">
테스트<br>
	${c_balance }
<form id="balance" method="get" action="">	
	
	
	<div class="form-group text-center">		
		<button type="submit" class="btn btn-primary">뒤로가기</button>
	  		
	</div>		
</form>
</div>
</body>
</html>