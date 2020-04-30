<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post" id="registerForm">
		<label for="num">번호</label>
		<input type="text" name="num"/>
		<button>submit</button>
	</form>
	<div id="result">
		<label for="resulttxt">결과</label>
		<input type="text" name="resulttxt" readonly/>
	</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(function(){
	$("#registerForm").click(function(e){
		e.preventDefault();
		
		let num = {"num" : $("#registerForm").find("input[name='num']").val()};
		
		$.ajax({
			type : "post",
			url : "/admin/register",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(num),
			success : function(result){
				$("#result").find("input[name='resulttxt']").val("개설 성공");
			}
		})
		
		
		
	})
})

</script>
</body>
</html>