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
/* .tag_var a:visited {color:#fff; text-decoration:none;} */
a:hover {color:#5a5a5a; text-decoration:none;}
a:link {color:#fff; text-decoration:none;}
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
.move{
	color:#000000;
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
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/no">공지사항</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/">보안센터</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/F">자료실</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/N">새소식</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/E">이벤트</a></button>
				  <!-- 2 -->
				  <div class="btn-group" style="margin-left: 25px;">
					  <button type="button" class="btn btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    문의 사항
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="/member/inquiry">문의사항</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="/member/inquiry/register">문의사항 작성</a>
					    <div class="dropdown-divider"></div>
<!-- 					    <a class="dropdown-item" href="#">문의사항 취소</a>
					    <div class="dropdown-divider"></div> -->
					    <a class="dropdown-item" href="/member/inquiry">1:1 비공개 문의사항</a>
					  </div>
					</div>
				  <!-- 3 -->
				  <div class="btn-group" style="margin-left: 25px;">
					  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    카드 관련
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="/">카드 신청</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="/">카드 취소</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item" href="/">카드 결과 확인</a>
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
     	<a href="">새소식</a>
     	<div class="dropdown-divider"></div>
     	<div class="aside_content">
<!-- 	     	<a href="">문의사항 작성</a>
	     	<div class="dropdown-divider"></div>
	     	<a href="">문의사항 취소</a>
	     	<div class="dropdown-divider"></div>
	     	<a href="">1:1 비공개 문의사항</a> 
	     	<div class="dropdown-divider"></div> -->
     	</div>
     	</ul>
     	</div>
  	
     </aside>
     
     
     
     
     
<main>
<!-- 여기다가 작성하면됨 -->
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
                                        <th style="width:8%">no</th>
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
                                        <td class="type notice_type_td"><a href="${vo.notice_type=='공지사항'?'A':'' }${vo.notice_type=='새소식'?'N':'' }${vo.notice_type=='이벤트'?'E':'' }${vo.notice_type=='자료실'?'F':'' }"><c:out value="${vo.notice_type}"></c:out></a></td>
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
<form action="/N" id="actionForm">
	<input type="hidden" name="pageNum" value="${cri.pageNum }" />
	<input type="hidden" name="amount" value="${cri.amount }" />
	<input type="hidden" name="type" value="${cri.type }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />
	<input type="hidden" name="notice_types" value="${cri.notice_types }" />
	<%-- <sec:csrfInput/> --%>
</form>











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
		actionForm.find("input[name='notice_types']").val($(this).attr("href"));
		actionForm.submit();
	})
	
	
	
})






</script>

</body>
</html>
<%@include file="../../includes/footer_Main.jsp" %>