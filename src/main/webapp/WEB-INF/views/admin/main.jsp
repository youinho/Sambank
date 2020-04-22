<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	let go_check = true;
	$("#inner-notice").addClass("active");
	/* $("input[type='checkbox']").hover(function(e) {
		go_check = false;
	}, function(e) {
		go_check = true;
	}) */
	
	
	
	$(".checker").click(function(e){
		e.preventDefault();
		console.log(go_check)
		if(!go_check){
			return;
		}
		console.log("go")
		if($("input[value='"+$(this).data("check")+"']").prop("checked")){
			$("input[value='"+$(this).data("check")+"']").prop("checked", false);
		}else{
			$("input[value='"+$(this).data("check")+"']").prop("checked", true);
		}
	})
	
	
	
	
})
</script>
</head>
<body>
	
	<div class="col-md-10 order-md-1">
      <h4 class="mb-3 title">사내 공지</h4>
      <div class="row">
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        
                        
                        <div class="input-group">
                          
						  <div class="input-group-prepend">
						    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">검색조건</button>
						    <div class="dropdown-menu">
						    	<div class="dropdown-item">
						      		<input class="form-check-input" type="checkbox" value="T" id="defaultCheck1">
							    	<div class="checker" data-check="T" style="display:flex;width:100%">
										<label class="form-check-label" for="defaultCheck1">
									    	제목
										</label>
							    	</div>
						    	</div>
						    	<div class="dropdown-item">
						      		<input class="form-check-input" type="checkbox" value="C" id="defaultCheck2">
							    	<div class="checker" data-check="C">
										<label class="form-check-label" for="defaultCheck2">
									    	내용
										</label>
							    	</div>
						    	</div>
						    	<div class="dropdown-item">
						      		<input class="form-check-input" type="checkbox" value="W" id="defaultCheck3">
							    	<div class="checker" data-check=W>
										<label class="form-check-label" for="defaultCheck3">
									    	작성자
										</label>
							    	</div>
						    	</div>
						    </div>
						  </div>
						
                          
						  <input type="text" class="form-control" placeholder="검색어 또는 글작성제목" aria-label="검색어 또는 글작성제목" aria-describedby="button-addon4">
						  <div class="input-group-append" id="button-addon4">
						    <button class="btn btn-outline-secondary" type="button">검색</button>
						    <button class="btn btn-outline-secondary" type="button">글 등록</button>
						  </div>
						  
						</div>
						
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover table-sm">
                                <thead>
                                    <tr>
                                        <th>번 호</th>
                                        <th>제 목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>									
                                </thead>
								
                            </table>
							
                            <!-- start Pagination -->
                            <%-- <div class="text-center">
                            	<ul class="pagination">
                            		<c:if test="${pageVO.prev}">
                            			<li class="paginate_button previous"><a href="${pageVO.startPage-1 }">Previous</a></li>
                            		</c:if>
                            		
                            		<c:forEach  begin="${pageVO.startPage }" end="${pageVO.endPage }" var="idx">
                            			
                            			<li class="paginate_button ${cri.pageNum==idx?'active':'' }"><a href="${idx}">${idx}</a></li>
                            			
                            		</c:forEach>
                            		
                            		<c:if test="${pageVO.next }">
                            			<li class="paginate_button next"><a href="${pageVO.endPage+1 }">Next</a></li>
                            		</c:if>
                            		
                            	</ul>
                            </div> --%>
                            <!-- end Pagination -->   
                            </div>
                            <!-- end panel-body -->
                        </div>
                        <!-- end panel -->
                    </div>                   
                </div>     
    </div>
</body>
</html>