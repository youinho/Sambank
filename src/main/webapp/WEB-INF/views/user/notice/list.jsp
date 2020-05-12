<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header_Main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SamBank < MessagePage > </title>
<style>
main{
	/* <img src="/resources/SB_files/pull-1.png" style="position: fixed;bottom: 10px; right:10px"/> */
	background-image: url("/resources/SB_files/pull-1.png");
	background-repeat: no-repeat; /* repeat(기본값),no-repeat,repeat-x,repeat-y */
	background-position: right; /* 수평 : left,center,right  수직 : top, center, bottom */
}
.bno_td{
text-overflow:ellipsis;
white-space:nowrap;
word-wrap:normal;
overflow:hidden;
width:20px;

}
.type_td{
text-overflow:ellipsis;
white-space:nowrap;
word-wrap:normal;
overflow:hidden;
width:60px;

}
.content_td{
text-overflow:ellipsis;
white-space:nowrap;
word-wrap:normal;
overflow:hidden;
width:420px
}
.writer_td{
text-overflow:ellipsis;
white-space:nowrap;
word-wrap:normal;
overflow:hidden;
width:80px;

}
.date_td{
text-overflow:ellipsis;
white-space:nowrap;
word-wrap:normal;
overflow:hidden;
width:120px;

}
</style>

</head>
     
     
     
     
     <main>
	<div class="col-md-10 order-md-1">
      <h4 class="mb-3 title"><a href="/${cri.notice_types }" style="color:#000000"><c:out value="${title }"></c:out> </a></h4>
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
							  <input type="hidden" name="notice_types" value="${cri.notice_types }" />
							  
							  
						  
                          
							  <input type="text" class="form-control" placeholder="검색어" aria-label="검색어 또는 글작성제목" aria-describedby="button-addon4" id="keyword" name="keyword">
							  <div class="input-group-append" id="button-addon4"  >
							    <button class="btn btn-outline-secondary" type="button" id="searchBtn">검색</button>
							    
							  </div>
							  
							</div>
							<%-- <sec:csrfInput/> --%>
							
						</form>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover table-sm">
                                <thead>
                                    <tr>
                                        <th style="width:20px">no</th>
                                        <th style="width:60px">분류</th>
                                        <th >제 목</th>
                                        <th style="width:80px">작성자</th>
                                        <th style="width:120px">수정일</th>
                                    </tr>									
                                </thead>
								<tbody>
								<c:forEach items="${list }" var="vo">
									<tr>
                                        <td class="bno"><div class="bno_td"><c:out value="${vo.notice_bno }"></c:out></div></td>
                                        <td class="type notice_type_td"><div class="type_td"><a href="${vo.notice_type=='공지사항'?'A':'' }${vo.notice_type=='새소식'?'N':'' }${vo.notice_type=='이벤트'?'E':'' }${vo.notice_type=='자료실'?'F':'' }"><c:out value="${vo.notice_type}"></c:out></a></div></td>
                                        <td><div class="content_td"><a href="${vo.notice_bno}" class="move"><c:out value="${vo.title }" ></c:out> </a></div></td>
                                        
                                        <td><div class="writer_td"><c:out value="${vo.writer }"></c:out></div></td>
                                        <td><div class="date_td"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.updatedate }"/></div> </td>
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
<form action="/N" id="actionForm">
	<input type="hidden" name="pageNum" value="${cri.pageNum }" />
	<input type="hidden" name="amount" value="${cri.amount }" />
	<input type="hidden" name="type" value="${cri.type }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />
	<input type="hidden" name="notice_types" value="${cri.notice_types }" />
	<%-- <sec:csrfInput/> --%>
</form>









<%@include file="../../includes/footer_Main.jsp" %>

     </main>
		
		
		
<script>

$(function(){
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
	
	
	let keywordType = "${cri.type}";
	typeL = keywordType.split("");
	
	for(let i=0; i < typeL.length; i++){
		$("input[value='"+typeL[i]+"']").prop("checked", true);
	}
	
	$("#keyword").val("${cri.keyword}")
	
	
	
	
	let actionForm = $("#actionForm");
	$(".page-link").click(function(e){
		e.preventDefault();
		//	/board/list?pageNum=5&amount=20
		//actionForm 안의 pageNum값과 amount 값 변경하기
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		actionForm.submit();
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
		
		actionForm.attr("action", "/customer_notice/read/"+$(this).attr("href"));
		actionForm.submit();
	})
	
	$(".notice_type_td > a").click(function(e){
		e.preventDefault();
		//actionForm.find("input[name='notice_types']").val($(this).attr("href"));
		//console.log(actionForm.find("input[name='notice_types']").val());
		actionForm.attr("action", "/"+$(this).attr("href"))
		actionForm.submit();
	})
	
	
	
})




</script>
        

</body>
</html>
