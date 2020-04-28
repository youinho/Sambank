<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header_admin.jsp" %>
<style>
	#content{
		height:500px;
	}
</style>

<div class="col-md-10">
	<h3 class="page-header title">공지 등록</h3>
</div>

<div class="col-md-10">     
	<form action="/admin/notice/register" method="post">   
		<div class="input-group">
		  <div class="input-group-prepend">
		    <span class="input-group-text">제목</span>
		  </div>
		  <input type="text" aria-label="제목" class="form-control" name="title">
		<div class="input-group-append" id="button-addon4">
			<button class="btn btn-outline-primary" type="submit">등록</button>
			<button class="btn btn-outline-secondary" type="button" id="cancel">취소</button>
		</div>
		</div>
		<div class="form-group">
			<textarea class="form-control" id="content" name="content" rows="3">내용을 입력해 주세요.</textarea>
		</div>
		

		<div class="input-group">
			<div class="custom-file">
				<input type="file" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04">
				<label class="custom-file-label" for="inputGroupFile04">파일 업로드</label>
			</div>
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04">확인</button>
			</div>
		</div>
		<sec:csrfInput/>
	</form>
	
	
	
	
	
	
	
	
</div>
<script>
$(function(){
	$('input').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	});
	
	$("#cancel").click(function(e){
		e.preventDefault();
		location.href = "/admin/notice";
	})
	
	$("input[name='title']").focus();
})
</script>