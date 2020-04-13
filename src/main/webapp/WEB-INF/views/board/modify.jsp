<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Modify</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           Board Modify Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" method="post" role="form">
                				<div class="form-group">
                					<label>Bno</label>
                					<input class="form-control" name="bno" readonly="readonly" value="${vo.bno}">                				
                				</div> 
                				<div class="form-group">
                					<label>Title</label>
                					<input class="form-control" name="title" value="${vo.title}">                				
                				</div>  
                				<div class="form-group">
                					<label>Content</label>
                					<textarea class="form-control" rows="3" name="content">${vo.content}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Writer</label>
                					<input class="form-control" name="writer" readonly="readonly" value="${vo.writer}">                				
                				</div>  
                				<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>              			
                				<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>              			
                				<button type="submit" data-oper='list' class="btn btn-info">List</button>              			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
<%-- remove와 list를 위한 폼--%>
<form id="myform" method="post">
	<input type="hidden" name="bno" value="${vo.bno}" />
	<!-- 페이지 나누기 정보 -->
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>
<%-- 스크립트 --%>
<script>
$(function(){
	let formObj = $("#myform");
	
	$("button").click(function(e){
		//submit 막기
		e.preventDefault();		
		
		let oper = $(this).data("oper");
		
		//remove 버튼이 눌러지면 myform 보내기
		// /board/remove
		if(oper==='remove'){
			formObj.attr("action","/board/remove");
		}else if(oper==='list'){
			//list 버튼이 눌러지면 페이지 이동하기
			// /board/list
			formObj.attr("action","/board/list")
			       .attr("method","get")
			       .find("input[name='bno']").remove(); //bno지우기
		}else{  //modify
			formObj = $("form[role='form']");  //원래 폼
		}
		formObj.submit();		
	})
	
})
	
</script>
<%@include file="../includes/footer.jsp" %>   





    