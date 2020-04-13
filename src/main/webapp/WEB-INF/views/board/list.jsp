<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board List</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board List Page
                            <button id='regBtn' type='button' class='btn btn-xs pull-right btn-success' onclick="location.href='/board/register'">Register New Board</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>번 호</th>
                                        <th>제 목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>									
                                </thead>
								<!-- 게시판 리스트 반복문 -->
								<tbody>
									<c:forEach var="vo" items="${list}">
									  <tr>
										<td>${vo.bno}</td>
										<%-- 페이지 나누기 전 
											<td><a href="/board/read?bno=${vo.bno}">${vo.title}</a></td> 
										--%>
										<td><a href="${vo.bno}" class="move">${vo.title}</a><strong>[${vo.replycnt}]</strong></td>
										<td>${vo.writer}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.updatedate}"/></td>
									  </tr>
									</c:forEach>
								</tbody>
                            </table>
							<div class="row"> <!-- start search -->
                            	<div class="col-md-12">
                            	  <div class="col-md-8"><!--search Form-->
                            		<form id="searchForm">
                            			<select name="type">
                            				<option value="">------</option>
                            				<option value="T" <c:out value="${cri.type eq 'T'?'selected':''}"/>>제목</option>
                            				<option value="C" <c:out value="${cri.type eq 'C'?'selected':''}"/>>내용</option>
                            				<option value="W" <c:out value="${cri.type eq 'W'?'selected':''}"/>>작성자</option>
                            				<option value="TC" <c:out value="${cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
                            				<option value="TW" <c:out value="${cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
                            				<option value="TCW" <c:out value="${cri.type eq 'TCW'?'selected':''}"/>>제목 or 내용 or 작성자</option>
                            			</select>
                            			<input type="text" name="keyword" value="${cri.keyword}"/>
                            			<input type="hidden" name="pageNum" value="${cri.pageNum}" />
										<input type="hidden" name="amount" value="${cri.amount}" />
                            			<button class="btn btn-default">Search</button>
                            		</form>
                            	   </div>
                            	   <div class="col-md-2 col-md-offset-2">
                            	   	<!--페이지 목록 갯수 지정하는 폼-->
                            	   	<select class="form-control" id="amount">
                            	   		<option value="10" <c:out value="${cri.amount==10?'selected':''}"/>>10</option>
                            	   		<option value="20" <c:out value="${cri.amount==20?'selected':''}"/>>20</option>
                            	   		<option value="30" <c:out value="${cri.amount==30?'selected':''}"/>>30</option>
                            	   		<option value="40" <c:out value="${cri.amount==40?'selected':''}"/>>40</option>
                            	   	</select>
								  </div>
                             	 </div>                             	 
                      		 </div><!-- end search -->
                            <!-- start Pagination -->
                            <div class="text-center">
                            	<ul class="pagination">
                            		<c:if test="${pageVO.prev}">
                            			<li class="paginate_button previous"><a href="${pageVO.startPage-1}">Previous</a>
                            		</c:if>
                            		<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
                            			<li class="paginate_button ${cri.pageNum==idx?'active':''}"><a href="${idx}">${idx}</a></li>
                            		</c:forEach>
                            		<c:if test="${pageVO.next}">
                            			<li class="paginate_button next"><a href="${pageVO.endPage+1}">Next</a>
                            		</c:if>
                            	</ul>
                            </div>
                            <!-- end Pagination -->   
                            </div>
                            <!-- end panel-body -->
                        </div>
                        <!-- end panel -->
                    </div>                   
                </div>               
            <!-- /.row -->
<!-- 모달 추가 -->
<div class="modal" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">게시글 등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>처리가 완료되었습니다.</p>
      </div>
      <div class="modal-footer">       
        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<%@include file="../includes/footer.jsp" %> 
<!-- 페이지 나누기 정보를 가지고 있는 폼 -->
<form action="/board/list" id="actionForm">
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name=type value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>
<!-- 페이지 이동 스크립트 -->
<script>
	//페이지 번호가 클릭이 되는 경우
	//해당 영역을 가져와 이벤트를 중지시키기
	let actionForm=$("#actionForm");
	$(".paginate_button a").click(function(e){
		e.preventDefault();
		
		//     /board/list?pageNum=5&amount=20
		//actionForm안의 pageNum값과 amount 값 변경하기
		actionForm.find("input[name='pageNum']")
		          .val($(this).attr("href"));
		actionForm.submit();		
	})
	//사용자가 게시물 수를 클릭하면
	//actionForm의 amount의 정보를 변경하여 보내기
	$(".form-control").change(function() {
		//사용자가 선택한 게시물 수 가져오기
		let amount=$(this).val();
		
		actionForm.find("input[name='amount']")
                  .val(amount);
		actionForm.submit();
	})
	//글제목을 클릭시 동작하는 스크립트
	$(".move").click(function(e){
		e.preventDefault();
		
		//bno를 포함해서
		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr('href')+"'>");
		actionForm.attr("action","/board/read");
		//actionForm 보내기
		actionForm.submit();		
	})
	
	//검색 폼과 관련된 스크립트
	$(".btn-default").click(function(){
		//검색폼 가져오기
		let searchForm = $("#searchForm");
		//type과 keyword 하나라도 입력이 안된 경우
		//사용자에게 메세지 띄워주기
		if(!searchForm.find("option:selected").val()){
			alert("검색 기준을 선택해 주세요");			
			return false;
		}
		if(!searchForm.find("input[name='keyword']").val()){
			alert("검색어를 입력해 주세요");
			searchForm.find("input[name='keyword']").focus();
			return false;
		}
		//버튼을 눌렀을 때 무조건 페이지번호는 1로 세팅
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.submit();
	})
	
	
	
</script>
<!-- 모달 스크립트 -->
<script>
	let result='${result}';
	checkModal(result);
	
	history.replaceState({}, null, null);	
	
	function checkModal(result){
		if(result===''||history.state){			
			return;
		}
		if(parseInt(result)>0){
			$(".modal-body").html("게시글 "+
						parseInt(result)+" 번이 등록되었습니다.");
		}else{
			$(".modal-body").html(result);
		}
		
		$("#myModal").modal("show");
	}	
</script>










      