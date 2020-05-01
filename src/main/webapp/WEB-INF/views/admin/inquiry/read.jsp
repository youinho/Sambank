<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_admin.jsp" %>

<script>

//list버튼이 클릭하면 list페이지 보여주기
$(function(){
	$("#inquiry_list").addClass("active");
	$.ajax({
		url : "/admin/check_inquiry",
		type : "post",
		beforeSend : function(xhr)
           {   
               xhr.setRequestHeader(hn, tk);
           },
		data :{
			inquiry_no:"${vo.inquiry_no}"
		},
		dataType : "text",
		success : function(result){
			if(result === "false"){
				alert("담당자만 읽을 수 있습니다.");
				location.href = "/admin/inquiry";
			}
		}
	})
	
	
	
	$("#go-reply").click(function(e){
		e.preventDefault();
		if($("#content").val()==="" || $("#content").val()===null){
			return false;
		}
	})
	
	$("#go-list").click(function(e){
		e.preventDefault();
		location.href="/admin/inquiry";
	})
	
})
</script>
<div class="container">
	<!-- 컨텐츠 타이틀 -->
	<h3 class="tit_content title">문의 내역</h3>
	<!-- //컨텐츠 타이틀 -->

	<!-- 컨텐츠 내용 -->
	<div>
		<div class="tbl_type2 leftPd">
			<table summary="" class="table table-sm table-bordered" style="text-align:center;max-width:1300px">
				
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
						<td><c:out value="${vo.inquiry_no }"></c:out> </td>
						<th scope="row">등록일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regDate }"/></td>
						<th scope="row">최종수정일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.updateDate }"/> </td>
					</tr>
					<tr>
						<th scope="row">고객 성함</th>
						<td><c:out value="${vo.customer_name }"></c:out></td>
						<th scope="row">담당자 정보</th>
						<td><c:out value="${vo.answer_branch } ${vo.answer_rank }"></c:out></td>
						<th scope="row">담당자 이름</th>
						<td><c:out value="${vo.answer_name }"></c:out></td>
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
<form action="" method="post">
	<div class="form-group">
			<textarea class="form-control" id="content" name="content" rows="3">내용을 입력해 주세요.</textarea>
	</div>
	
	<div class="d-flex justify-content-end">
		<div class="btn-group outline-dark" role="group" aria-label="Basic example">
			<button class="btn btn-outline-primary btn-sm" type="button" id="go-reply">답변 등록</button>
			<button class="btn btn-outline-primary btn-sm" type="button" id="go-list">목록</button>
		</div>
	</div>	
	<input type="hidden" name="inquiry_no" value="${vo.inquiry_no }" />
				
</form>				
</div>

									