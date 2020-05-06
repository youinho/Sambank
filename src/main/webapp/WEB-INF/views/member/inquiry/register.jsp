<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="../../includes/header_Main.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SamBank '<'관련항목 적기'>' </title>
</head>
<body>
   
     <main>
	

<div class="col-md-10">
	<h3 class="page-header title">1:1 문의 등록</h3>
</div>

<div class="col-md-10">     
	<form action="" method="post" id="registerForm">   
		<div class="input-group">
		  <div class="input-group-prepend">
		    <span class="input-group-text">제목</span>
		   
		  </div>
		  <input type="text" aria-label="제목" class="form-control" name="title" required>
		<div class="input-group-append" id="button-addon4">
			<button class="btn btn-outline-primary" type="submit" id="submitBtn">등록</button>
			<button class="btn btn-outline-secondary" type="button" id="cancel">취소</button>
		</div>
		</div>
		<div class="form-group">
			<textarea class="form-control" id="content" name="content" rows="3">내용을 입력해 주세요.</textarea>
		</div>
		

		
		<sec:csrfInput/>
	</form>
	<div class="uploadResult">
		<ul>
			
		</ul>
	</div>
	
	
	
	
	
	
	
</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
     
     </main>


		
		
<script>
$(function(){
	$('input').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	});
	
	$("#cancel").click(function(e){
		e.preventDefault();
		location.href = "/member/inquiry";
	})
	

	$("input[name='title']").focus();
	
	$("#submitBtn").click(function(e){
		e.preventDefault();
		if($("input[name='title']").val()===""){
			$("input[name='title']").focus();
			alert("제목을 입력해 주세요.")
			return false;
		}
		if($("#content").val()==="" || $("#content").val()== null){
			
			alert("글 내용을 입력해 주세요.")
			return false;
		}
		$("#registerForm").submit();
				
			
		
	})
})



</script>        

</body>
</html>
<%@include file="../../includes/footer_Main.jsp" %>