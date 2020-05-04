<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_admin.jsp" %>


<div class="container">
	<!-- 컨텐츠 타이틀 -->
	<h3 class="tit_content title">공지사항</h3>
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
						<th scope="row">작성자</th>
						<td><c:out value="${vo.branch } ${vo.rank } ${vo.writer }"></c:out></td>
						<th scope="row">등록일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate }"/></td>
						<th scope="row">최종수정일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.updatedate }"/> </td>
					</tr>

					<tr id="file_tr">
						<th scope="row" class="align-middle">첨부파일</th>
						<td colspan="5" >
							<div class="d-flex align-content-start flex-wrap" id="fileBlock" >
							
							</div>

						</td>
					</tr>

					<tr>
						<td colspan="6">
							<div style="padding:20px;margin:20px;text-align:left" id="contentDiv">
								<c:out value="${vo.content }"></c:out>
							</div>
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
	<input type="hidden" name="id" value="${vo.id }" />
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
	$("#inner-notice").addClass("active");
	
	$("#contentDiv").html($("#contentDiv").html().replace(/\n/gi, "<br>"));
	
	
	
	let boardId = 0;
	let myId = 0;
	$.ajax({
		url : "/admin/get_groupId_by_id",
		type : "post",
		beforeSend : function(xhr)
           {   
               xhr.setRequestHeader(hn, tk);
           },
		data :{
			id : "${vo.id}"
		},
		dataType : "text",
		success : function(result){
			boardId = parseInt(result);
		}
	})
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
			myId = parseInt(result);
		}
	})
	
	
	
	$("#go-list").click(function(){
		//location.href="/board/list";
		$("#myForm").attr("action","/admin/notice");
		$("#myForm").find("input[name='bno']").remove();
		$("#myForm").submit();
		
		
	})
	
	
	
	$("#go-delete").click(function(){
		
		if(myId < boardId){
			alert("글을 삭제할 권한이 없습니다.");
			return false;
		}
		$("#myForm").attr("action", "/admin/notice/delete");
		$("#myForm").attr("method", "post");
		$("#myForm").append("<input type='hidden' name='_csrf' value='${_csrf.token}'>")
		$("#myForm").submit();
	})
	
	$("#go-modify").click(function(){
		console.log("myid : "+myId);
		if(myId < boardId){
			alert("글을 수정할 권한이 없습니다.");
			return false;
		}
		$("#myForm").attr("action", "/admin/notice/modify");
		$("#myForm").attr("method", "get");
		$("#myForm").submit();
	})
	
	
	
	
	
	$.ajax({
		url : '/admin/notice/get_attachList',
		beforeSend : function(xhr)
        {   
            xhr.setRequestHeader(hn, tk);
        },
		data : {
			admin_bno:"${vo.admin_bno}"
		},
		type : 'post',
		dataType : 'text',
		success : function(result){
			
			data = JSON.parse(result);
			if(data.length===0){
				$("#file_tr").remove();
			}
			let str = "";
			let uploadResult = $("#fileBlock");
			let icon = "<svg class='bi bi-file-earmark-text' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M4 1h5v1H4a1 1 0 00-1 1v10a1 1 0 001 1h8a1 1 0 001-1V6h1v7a2 2 0 01-2 2H4a2 2 0 01-2-2V3a2 2 0 012-2z'/><path d='M9 4.5V1l5 5h-3.5A1.5 1.5 0 019 4.5z'/><path fill-rule='evenodd' d='M5 11.5a.5.5 0 01.5-.5h2a.5.5 0 010 1h-2a.5.5 0 01-.5-.5zm0-2a.5.5 0 01.5-.5h5a.5.5 0 010 1h-5a.5.5 0 01-.5-.5zm0-2a.5.5 0 01.5-.5h5a.5.5 0 010 1h-5a.5.5 0 01-.5-.5z' clip-rule='evenodd'/></svg>"
			$(data).each(function(i,obj){
				
				let fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				str += "<div data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'>";
				str += "<a href='#' class='btn btn-outline-secondary'>"+icon+" "+obj.fileName+"</a><br>";			
				str += "</div>";
				
			})
			uploadResult.append(str);
		}
		
		
		
		
		
	})
	
	$("#fileBlock").on("click", "div", function(e){
			e.preventDefault();
			let li = $(this);
			
			let fileName = encodeURIComponent(li.data("filename"));
			
			
			self.location="/admin/notice/downloadFile?fileName="+fileName+"&uuid="+li.data("uuid");
				
			
			
		})
	
	
	$(window).resize(function(){
		$(".container").css("max-width", $(window).width()+"px");
	})
	
})
</script>
									