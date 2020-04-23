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
	
	$("#cancel").click(function(e){
		e.preventDefault();
		$("#modForm").attr("method", "get");
		$("#modForm").attr("action","/admin/notice/read/"+"${vo.admin_bno}");
		$("#modForm").find("input[name='content']").remove();
		$("#modForm").find("input[name='title']").remove();
		$("#modForm").submit();
	})
	
})
</script>
<div class="col-md-10">
	<h3 class="page-header title">공지 수정</h3>
</div>

<div class="col-md-10">     
	<form action="/admin/notice/modify" method="post" id="modForm">   
		<div class="input-group">
		  <div class="input-group-prepend">
		    <span class="input-group-text">제목</span>
		  </div>
		  <input type="text" aria-label="제목" class="form-control" name="title" value="${vo.title }">
		<div class="input-group-append" id="button-addon4">
			<button class="btn btn-outline-primary" type="submit">수정</button>
			<button class="btn btn-outline-warning" type="button" id="cancel">취소</button>
		</div>
		</div>
		<div class="form-group">
			<textarea class="form-control" id="content" name="content" rows="3"><c:out value="${vo.content }"></c:out> </textarea>
		</div>
		<div class="form-group">
			<input type="file" class="form-control-file" id="file">
		</div>
		<input type="hidden" name="admin_bno" value="${vo.admin_bno }" />
		
		<input type="hidden" name="pageNum" value="${cri.pageNum }"/>
		<input type="hidden" name="amount" value="${cri.amount }"/>
		<input type="hidden" name="type" value="${cri.type }" />
		<input type="hidden" name="keyword" value="${cri.keyword }" />	
	</form>
	
	
	
	
	
	
	
	
</div>