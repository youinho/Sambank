<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header_admin.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	alert_registered();
	history.replaceState({}, null, null);
	
	let go_check = true;
	$("#customer_notice").addClass("active");
	/* $("input[type='checkbox']").hover(function(e) {
		go_check = false;
	}, function(e) {
		go_check = true;
	}) */
	
	function alert_registered(){
		let registered = "${registered}";
		
		if(registered ==="" || history.state){
			return;
		}
		
		
		if(registered != "" && registered != null){
			if(registered=="true"){
				alert("${notice_bno}"+"번 글이 등록되었습니다.");
			}else if(registered=="false"){
				alert("실패했습니다.");
			}
		}
	}
	
	
	
	$(".checker").click(function(e){
		e.preventDefault();
		
		if(!go_check){
			return;
		}
		
		if($("input[value='"+$(this).data("check")+"']").prop("checked")){
			$("input[value='"+$(this).data("check")+"']").prop("checked", false);
		}else{
			$("input[value='"+$(this).data("check")+"']").prop("checked", true);
		}
	})
	
	
	
	/* $(".dropdown-menu").hover(function() {
		$(this).dropdown("show");
		
	}) */
	
	
	
	
	
	
})
</script>
<style>
	table{
		text-align:center;
	}
	a{
		color:black;
		
	}
	th, tr{
		font-size:14px;
		font-weight:normal;
	}
	.bno{
		font-size:12px;
	}
	.panel-body{
		margin-top:2px;
	}
	
</style>
</head>
<body>
	
	<div class="col-md-10 order-md-1">
      <h4 class="mb-3 title">고객 공지</h4>
      <div class="row">
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        
                        <form action="" id="searchForm">
	                        <div class="input-group">
							  <div class="input-group-prepend">
							    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">검색조건</button>
							    <div class="dropdown-menu">
							    	<div class="dropdown-item">
							      		<input class="form-check-input" type="checkbox" value="T" id="defaultCheck1" name="typeT">
								    	<div class="checker" data-check="T" style="display:flex;width:100%">
											<label class="form-check-label" for="defaultCheck1">
										    	제목
											</label>
								    	</div>
							    	</div>
							    	<div class="dropdown-item">
							      		<input class="form-check-input" type="checkbox" value="C" id="defaultCheck2" name="typeC">
								    	<div class="checker" data-check="C">
											<label class="form-check-label" for="defaultCheck2">
										    	내용
											</label>
								    	</div>
							    	</div>
							    	<div class="dropdown-item">
							      		<input class="form-check-input" type="checkbox" value="W" id="defaultCheck3" name="typeW">
								    	<div class="checker" data-check=W>
											<label class="form-check-label" for="defaultCheck3">
										    	작성자
											</label>
								    	</div>
							    	</div>
							    </div>
							  </div>
							  <input type="hidden" name="pageNum" value="${cri.pageNum }" />
							  <input type="hidden" name="amount" value="${cri.amount }" />
							  <input type="hidden" name="type" value="" />
							  
							  
							  
						  
                          
							  <input type="text" class="form-control" placeholder="검색어" aria-label="검색어 또는 글작성제목" aria-describedby="button-addon4" id="keyword" name="keyword">
							  <div class="input-group-append" id="button-addon4"  >
							    <button class="btn btn-outline-secondary" type="button" id="searchBtn">검색</button>
							    <button class="btn btn-outline-secondary" type="button" id="registerBtn" <sec:authorize access="!hasAnyRole('ROLE_10,ROLE_5')">disabled</sec:authorize> >글 등록</button>
							  </div>
							  
							</div>
							<%-- <sec:csrfInput/> --%>
							
						</form>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover table-sm">
                                <thead>
                                    <tr>
                                        <th style="width:8%">글 번호</th>
                                        <th style="width:12%">분류</th>
                                        <th>제 목</th>
                                        <th style="width:15%">작성자</th>
                                        <th style="width:20%">수정일</th>
                                    </tr>									
                                </thead>
								<tbody>
								<c:forEach items="${list }" var="vo">
									<tr>
                                        <td class="bno"><c:out value="${vo.notice_bno }"></c:out></td>
                                        <td class="type"><c:out value="${vo.type}"></c:out></td>
                                        <td><a href="${vo.notice_bno}" class="move"><c:out value="${vo.title }" ></c:out> </a></td>
                                        
                                        <td><c:out value="${vo.writer }"></c:out></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.updatedate }"/> </td>
                                    </tr>		
								</c:forEach>
									
									
									
								</tbody>
                            </table>
							
                            <!-- start Pagination -->
                            <div class="text-center">
                            	<ul class="pagination pagination-sm justify-content-end">
                            		
                            			<li class="page-item ${pageVO.prev?'':'disabled' }"><a class="page-link" href="${pageVO.startPage-1 }">Previous</a></li>
                            		
                            		
                            		<c:forEach  begin="${pageVO.startPage }" end="${pageVO.endPage }" var="idx">
                            			
                            			<li class="page-item ${cri.pageNum==idx?'active':'' }"><a class="page-link" href="${idx}">${idx}</a></li>
                            			
                            		</c:forEach>
                            		
                            		
                            			<li class="page-item ${pageVO.next?'':'disabled' }"><a class="page-link" href="${pageVO.endPage+1 }">Next</a></li>
                            		
                            		
                            	</ul>
                            </div>
                            <!-- end Pagination -->   
                            </div>
                            <!-- end panel-body -->
                        </div>
                        <!-- end panel -->
                    </div>                   
                </div>     
    </div>
<form action="/admin/customer_notice" id="actionForm">
	<input type="hidden" name="pageNum" value="${cri.pageNum }" />
	<input type="hidden" name="amount" value="${cri.amount }" />
	<input type="hidden" name="type" value="${cri.type }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />
	<%-- <sec:csrfInput/> --%>
</form>
<script>
$(function(){
	
	let keywordType = "${cri.type}";
	typeL = keywordType.split("");
	
	for(let i=0; i < typeL.length; i++){
		$("input[value='"+typeL[i]+"']").prop("checked", true);
	}
	
	$("#keyword").val("${cri.keyword}")
	
	
	
	
	let groupId = 0;
	$.ajax({
		url : "/admin/get_groupId",
		type : "post",
		beforeSend : function(xhr)
           {   
               xhr.setRequestHeader(hn, tk);
           },
		data :{
		},
		dataType : "text",
		success : function(result){
			groupId = parseInt(result);
		}
	})
	
	
	let actionForm = $("#actionForm");
	$(".page-link").click(function(e){
		e.preventDefault();
		//	/board/list?pageNum=5&amount=20
		//actionForm 안의 pageNum값과 amount 값 변경하기
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		actionForm.submit();
	})
	
	$("#registerBtn").click(function(e){
		e.preventDefault();
		if(groupId < 5){
			alert("공지를 등록할 권한이 없습니다.");
			return false;
		}
		
		location.href = "/admin/customer_notice/register";
		
		
	})
	
	
	
	
	$("#searchBtn").click(function(e) {
		e.preventDefault();
		let searchForm = $("#searchForm");
		//type과 keyword 하나라도 입력이 안된 경우
		//사용자에게 메세지 띄워주기
		if(!searchForm.find("input[type='checkbox']:checked").val()){
			alert("검색 기준을 선택해 주세요");
			return false;
		}
		if(!searchForm.find("input#keyword").val()){
			alert("검색어를 입력해 주세요");
			searchForm.find("input#keyword").focus();
			return false;
		}
		
		let type="";
		$("input[type='checkbox']:checked").each(function(i, element) {
			type += $(this).val();
		})
		$("input[name='type']").val(type);
		
		
		
		searchForm.find("input[name='pageNum']").val("1");	
		
		
		
		$("#searchForm").submit();
		
	})
	$("a.move").click(function(e){
		e.preventDefault();
		
		//	/board/list?pageNum=5&amount=20
		//actionForm 안의 pageNum값과 amount 값 변경하기
		
		actionForm.attr("action", "/admin/customer_notice/read/"+$(this).attr("href"));
		actionForm.submit();
	})
	
	
	
	
})

</script>
</body>
</html>