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
<style>
a:visited {color:black; text-decoration:none;}
.asideHeader a:visited {color:#fff; text-decoration:none;}
.tag_var a:visited {color:#fff; text-decoration:none;}
a:hover {color:#5a5a5a; text-decoration:none;}
a:link {color:#9e9e9e; text-decoration:none;}
html, body, div, span, object, iframe,h1, h2, h3, h4, h5, h6, p, blockquote, pre,a, abbr, acronym, address, big, cite, code,del, dfn, em, img, strong, sub, sup, var,
h1, h2, h3, h4, h5, h6 {font-family:'맑은 고딕', 'Malgun Gothic','돋움',Dotum,AppleGothic,Tahoma,Helvetica,sans-serif;}
main{
	width : 70%;
	position: relative;
	margin-left: 300px;
	margin-top: 50px;
	font: bolder;
	/* position: fixed; */
    left: 120px;
}
[class^="sm"]{
	border: 1px solid white;
}
aside {
    width: 340px;
    color: #ffff;
    /* padding: 10px; */
    /* margin: 10px; */
    /* margin-top:50px; */
    padding-bottom: 650px;
    box-sizing: border-box;
    border: 7px solid;
    position: absolute;
    font-size: 35px;
    background-color: #336633;
   	visited {color:#9e9e9e; text-decoration:none;}
   }

.aside_content{
	margin-top:30px;
	margin-left: 50px;
	font-size: 22px;
	font: bolder;
}
.tag_var button {
	color: #fff;
}
table{
	text-align:center;
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
<title>SamBank '<'관련항목 적기'>' </title>
</head>
<body>
	<div id="title_imageo" style="margin-left: 3%">  
	  <strong><img src="/resources/SB_files/title logo.png" alt="로고 이미지"></strong>
	  <a class="navbar-brand" src="/resources/SB_files/title logo.png" href="#"></a>
	</div>
	
	<br />
	
	
	
    <div class="tag_var">
    <!--  -->
      <nav class="navbar navbar-expand-lg navbar-light"style="background-color: #666633;">
        <div class="collapse navbar-collapse" id="navbarnav">
      		<!-- Example split danger button -->
				<div class="btn-group">
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="">공지사항</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="">보안센터</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="">자료실</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="">새소식</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="">이벤트</a></button>
				  <!-- 2 -->
				  <div class="btn-group" style="margin-left: 25px;">
					  <button type="button" class="btn btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    문의 사항
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="#">문의사항</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="#">문의사항 작성</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="#">문의사항 취소</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="#">1:1 비공개 문의사항</a>
					  </div>
					</div>
				  <!-- 3 -->
				  <div class="btn-group" style="margin-left: 25px;">
					  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    카드 관련
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="#">카드 신청</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="#">카드 취소</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="#">카드 결과 확인</a>
					  </div>
					</div>


				</div>
     	 </div>
      
      
      
      

      </nav>
      <!--nav영역 종료-->
     </div>
     
     
     
     
     
     
     <aside>
     	<div class="asideHeader">
     	<ul>
     	<a href="">문의사항</a>
     	<div class="dropdown-divider"></div>
     	<div class="aside_content">
	     	<a href="/member/inquiry/register">문의사항 작성</a>
	     	<div class="dropdown-divider"></div>
	     	<a href="/member/inquiry">1:1 비공개 문의사항</a>
	     	<div class="dropdown-divider"></div>
     	</div>
     	</ul>
     	</div>
  	
     </aside>
     
     
     
     
     
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