<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header_admin.jsp" %>


<div class="container">
	<!-- 컨텐츠 타이틀 -->
	<h3 class="tit_content title">공지사항</h3>
	<!-- //컨텐츠 타이틀 -->

	<!-- 컨텐츠 내용 -->
	<div>
		<div class="tbl_type2 leftPd">
			<table summary="" class="table table-sm table-bordered" style="text-align:center">
				
				<colgroup>
					<col width="12%">
					<col width="*">
					<col width="12%">
					<col width="20%">
					<col width="12%">
					<col width="20%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td colspan="5" style="font-size:1.3em;"><b><c:out value="${vo.title }"></c:out></b></td>
					</tr>
					<tr>
						<th scope="row">글 번호</th>
						<td>${vo.admin_bno }</td>
						<th scope="row">등록일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate }"/></td>
						<th scope="row">최종수정일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.updatedate }"/> </td>
					</tr>

					<tr>
						<th scope="row">첨부파일</th>
						<td colspan="5">

							<a href="javascript:fileDown('bbs/Q001/Q001_2194542', '4~5월 국가기술자격 상시검정 시행 조치 계획.hwp', '2194542')" class="btn3_icon download">4~5월 국가기술자격 상시검정 시행 조치 계획.hwp<span class="blind">다운로드</span></a>

							<a href="javascript:fileDown('bbs/Q001/Q001_2194543', '4~5월 국가기술자격 상시검정 시행 조치 계획.pdf', '2194543')" class="btn3_icon download">4~5월 국가기술자격 상시검정 시행 조치 계획.pdf<span class="blind">다운로드</span></a>

						</td>
					</tr>

					<tr>
						<td colspan="6">
							<div style="padding:20px;margin:20px;text-align:left">
								<c:out value="${vo.content }"></c:out>
							</div>
							<textarea id="contents_text" style="width:100%;display:none;" rows="10">
							
							
							</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
<div class="d-flex justify-content-end">
							<div class="btn-group outline-dark" role="group" aria-label="Basic example">
								<button class="btn btn-outline-primary btn-sm" type="button" id="go-modify">수정</button>
								<button class="btn btn-outline-primary btn-sm" type="button" id="go-delete">삭제</button>
								<button class="btn btn-outline-primary btn-sm" type="button" id="go-list">목록</button>
							</div>
</div>								
</div>
<form action="/admin/modify" id="myForm">
	<input type="hidden" name="bno" value="${vo.admin_bno }"/>
	
	<!-- 페이지 나누기 후 추가 -->
	<input type="hidden" name="pageNum" value="${cri.pageNum }"/>
	<input type="hidden" name="amount" value="${cri.amount }"/>
	<input type="hidden" name="type" value="${cri.type }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />
	<%-- <sec:csrfInput/> --%>	
</form>
<script>
//list버튼이 클릭하면 list페이지 보여주기
$(function(){
	$("#go-list").click(function(){
		//location.href="/board/list";
		$("#myForm").attr("action","/admin/notice");
		$("#myForm").find("input[name='bno']").remove();
		$("#myForm").submit();
		
		
	})
	
	$("#go-delete").click(function(){
		$("#myForm").attr("action", "/admin/notice/delete");
		$("#myForm").attr("method", "post");
		$("#myForm").append("<input type='hidden' name='_csrf' value='${_csrf.token}'>")
		$("#myForm").submit();
	})
	
	$("#go-modify").click(function(){
		$("#myForm").attr("action", "/admin/notice/modify");
		$("#myForm").attr("method", "get");
		$("#myForm").submit();
	})
	
})
</script>
									