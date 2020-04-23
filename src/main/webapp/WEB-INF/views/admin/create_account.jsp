<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_admin.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$("#creACC").addClass("active");
	
	
	$("#searchCS").click(function(e){
		e.preventDefault();
		popup_searchCS();
		
		
	})
	
	
	
	function popup_searchCS(){
		var pass = window.open("/popup/searchCS","고객 검색","width=770,height=380, scrollbars=yes, resizable=yes");
	}	
	
})

function searchCS_callback(cno){
		$("input[name='cno']").val(cno);
}

</script>
</head>
<body>

<form action="" method="post" id="createForm">
		
			<label for="cat">통장 종류</label>
			<select name="cat" >
				<option value="1">입/출금</option>
				<option value="2">적금</option>
				<option value="3">대출</option>
			</select>
		
		
		
			<label for="cno">cno</label>
			<input type="text" name="cno" />
		
		
			<label for="ano">ano</label>
			<input type="text" name="ano" readonly/>
		
		<button id="call_ano">계좌번호 요청</button>
		<button id="register">계좌발급</button>
		<button id="searchCS">고객 검색</button>
		
	
</form>


		
	


	
<script>
$(function(){
	$("#call_ano").click(function(e){
		e.preventDefault();
		let form = $("#createForm");
		let cat = form.find("select[name='cat']").val();
		let cno = form.find("input[name='cno']").val();
		$.ajax({
			url : "/admin/call_ano",
			type : "post",
			data :{
				cat : cat,
				cno : cno
			},
			dataType : "text",
			success : function(result){
				$("input[name='ano']").val(result);
			}
			
			
			
		
			
		})
		
	})
	
})
</script>
</body>
</html>