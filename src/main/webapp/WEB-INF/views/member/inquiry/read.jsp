<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="../../includes/header_Main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SamBank '<'관련항목 적기'>' </title>
</head>
<body>

     <main>
	<!-- 여기다가 작성하면됨 -->
    <div class="container">
	<!-- 컨텐츠 타이틀 -->
	<h3 class="tit_content title">문의 내역</h3>
	<!-- //컨텐츠 타이틀 -->

	<!-- 컨텐츠 내용 -->
	<div>
		<div class="tbl_type2 leftPd">
			<table summary="" class="table table-sm table-bordered" style="text-align:center;max-width:1300px" id="inquiry_table">
				
				<colgroup>
					<col width="12%">
					<col width="*">
					<col width="12%">
					<col width="20%">
					<col width="12%">
					<col width="20%">
				</colgroup>
				<tbody>
					<tr class="ori">
						<th scope="row">제목</th>
						<td colspan="5" style="font-size:1.3em;"><b><c:out value="${vo.title }"></c:out></b></td>
					</tr>
					<tr class="ori">
						<th scope="row">글 번호</th>
						<td><c:out value="${vo.inquiry_no }"></c:out> </td>
						<th scope="row">등록일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regDate }"/></td>
						<th scope="row">최종수정일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.updateDate }"/> </td>
					</tr>
					<tr class="ori">
						<th scope="row">고객 성함</th>
						<td><c:out value="${vo.customer_name }"></c:out></td>
						<th scope="row">담당자 정보</th>
						<td><c:out value="${vo.answer_branch } ${vo.answer_rank }"></c:out></td>
						<th scope="row">담당자 이름</th>
						<td><c:out value="${vo.answer_name }"></c:out></td>
					</tr>
					

					<tr class="ori">
						<td colspan="6">
							<div style="padding:20px;margin:20px;text-align:left" id="contentDiv">
								<c:out value="${vo.content }"></c:out>
							</div>
						</td>
					</tr>
					<tr class="ori" >
						<td colspan="6" style="border-left-color:#ffffff;border-right-color:#ffffff">
							<div style="height:20px">
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
		
     
     
     
     </main>


		
		
<script>
$(function(){
	$("#contentDiv").html($("#contentDiv").html().replace(/\n/gi, "<br>"));
	
	show_reply();

	$("#go-list").click(function(e){
		e.preventDefault();
		location.href="/member/inquiry";
	})
})
function show_reply(){
	$.ajax({
		url : "/member/inquiry/inquiry_get_reply",
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
			replyList = JSON.parse(result);
			
			
			if(replyList.length <= 0){
				return false;
			}
			$("tr[class!='ori']").remove();
			str="";
			
			for(var i=0; i < replyList.length; i++){
				
				var date = new Date(replyList[i].regDate);
				
				str += "<tr><td colspan='6' style='text-align:left'><div class='media text-muted pt-3'><img src='/member/inquiry/get_profile_image?id="+replyList[i].answer_id+"' alt='로고 이미지' style='width=36px;height:36px;padding-right:10px;padding-left:5px'><p class='media-body pb-3 mb-0 small lh-125 border-bottom border-gray'>";
			    str += "<strong class='d-block text-gray-dark' style='font-size:16px'>"+replyList[i].answer_branch+" "+replyList[i].answer_rank+" "+replyList[i].answer_name+"&nbsp&nbsp&nbsp<small>"+date.toISOString().slice(0, 10)+"  "+date.toTimeString().slice(0, 8)+"</small></strong>";
			    str += ""+replyList[i].content.replace(/\n/gi, "<br>");    
			    str += "</p></div></td></tr>";
		
		
				
			}
			
			$("#inquiry_table").append(str);			
			
			
		}
	})
}
</script>        

</body>
</html>
<%@include file="../../includes/footer_Main.jsp" %>