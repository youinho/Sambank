<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div class="panel-body">

<table class="table table-striped table-bordered table-hover">
	<div>
		<label for="name">성함</label>
		<input type="text" name="name" />	
	</div>
	<div>
		<label for="name">생년월일</label>
		<input type="text" name="birth" />	
	</div>
	<div>
		<label for="name">전화번호</label>
		<input type="text" name="mobile" />	
	</div>
	<button id="search">고객 검색</button>
    <thead>
        <tr>
            <th>cno</th>
            <th>성함</th>
            <th>생년월일</th>
            <th>전화번호</th>
            <th>선택</th>
        </tr>									
    </thead>
    <tbody id="resultList">
    	
    </tbody>
<!-- 게시판 리스트 반복문 -->

</table>
</div>
<form action="" method="post" id="createForm">
		<div>
			<label for="cat">통장 종류</label>
			<select name="cat" >
				<option value="1">입/출금</option>
				<option value="2">적금</option>
				<option value="3">대출</option>
			</select>
		</div>
		
		<div>
			<label for="cno">cno</label>
			<input type="text" name="cno" />
		</div>
		<div>
			<label for="ano">ano</label>
			<input type="text" name="ano" readonly/>
		</div>
		<button id="call_ano">계좌번호 요청</button>
		<button id="register">계좌발급</button>
		
	
	</form>
		
	


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
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
	
	$("#search").click(function(){
		$.ajax({
			url : "/admin/search",
			type : "post",
			data : {
				name : $("input[name='name']").val(),
				birth : $("input[name='birth']").val(),
				mobile : $("input[name='mobile']").val()
			},
			dataType : "text",
			success : function(result){
				console.log(result);
				
			}
			
		
		
		})
	})
	
	
})
</script>
</body>
</html>