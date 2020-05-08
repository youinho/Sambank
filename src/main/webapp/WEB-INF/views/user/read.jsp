<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="../includes/header_Main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>SamBank </title>
</head>
<body>

<main>
<div class="container">
	<!-- 컨텐츠 타이틀 -->
	<h3 class="tit_content title"><a id="title_a"><c:out value="${title }"></c:out></a></h3>
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
						<th scope="row">분류</th>
						<td>${vo.notice_type }</td>
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
								<button class="btn btn-outline-primary btn-sm" type="button" id="go-list">목록</button>
							</div>
</div>								
</div>
<form action="/" id="myForm">
	<input type="hidden" name="bno" value="${vo.notice_bno }"/>
	<input type="hidden" name="id" value="${vo.id }" />
	<!-- 페이지 나누기 후 추가 -->
	<input type="hidden" name="pageNum" value="${cri.pageNum }"/>
	<input type="hidden" name="amount" value="${cri.amount }"/>
	<input type="hidden" name="type" value="${cri.type }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />
	<input type="hidden" name="notice_types" value="${cri.notice_types }" />
	<%-- <sec:csrfInput/> --%>	
</form>



<%@include file="../includes/footer_Main.jsp" %>
</main>


		
		
<script>

$(function(){
	// 게시글 내용 줄바꿈 적용;
	$("#contentDiv").html($("#contentDiv").html().replace(/\n/gi, "<br>"));
	
	let notice_types="${cri.notice_types}";

	$("#go-list").click(function(){
		//location.href="/board/list";
		
		$("#myForm").attr("action","/"+notice_types);
		$("#myForm").find("input[name='bno']").remove();
		$("#myForm").submit();
		
		
	})
	
	

	$.ajax({
		url : '/customer_notice/get_attachList',
		data : {
			notice_bno:"${vo.notice_bno}"
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
		self.location="/customer_notice/downloadFile?fileName="+fileName+"&uuid="+li.data("uuid");
	})
	
	$("#title_a").click(function(e){
		e.preventDefault();
		$("#go-list").click();
	})
	
	
})




</script>

</body>
</html>
