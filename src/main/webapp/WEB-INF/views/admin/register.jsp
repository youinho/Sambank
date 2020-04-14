<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post" id="registerForm">
		<label for="num">��ȣ</label>
		<input type="text" name="num"/>
		<button>submit</button>
	</form>
	<div id="result">
		<label for="resulttxt">���</label>
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
				$("#result").find("input[name='resulttxt']").val("���� ����");
			}
		})
		
		
		
	})
})

</script>
</body>
</html>