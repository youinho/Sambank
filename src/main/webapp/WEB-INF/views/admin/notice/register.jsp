<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header_admin.jsp" %>
<style>
	#content{
		height:500px;
	}
</style>
<script>
$(function(){
	$('input').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	});
})
</script>
<div class="col-md-10">
	<h3 class="page-header title">공지 등록</h1>
</div>

<div class="col-md-10">     
	<form action="/admin/notice/register" method="post">   
		<div class="input-group">
		  <div class="input-group-prepend">
		    <span class="input-group-text">제목</span>
		  </div>
		  <input type="text" aria-label="제목" class="form-control" name="title">
		<div class="input-group-append" id="button-addon4">
			<button class="btn btn-outline-primary" type="submit">공지 등록</button>
		</div>
		</div>
		<div class="form-group">
			<textarea class="form-control" id="content" name="content" rows="3">내용을 입력해 주세요.</textarea>
		</div>
		<div class="form-group">
			<input type="file" class="form-control-file" id="file">
		</div>
	</form>
	
	
	
	
	
	
	
	
</div>