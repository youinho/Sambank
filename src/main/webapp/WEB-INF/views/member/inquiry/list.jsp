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
<title>SamBank < 문의사항 > </title>
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
					  <div class="dropdown-menu" style="color:black;" >
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
				  <div class="btn-group" style="margin-left: 25px; color:black; ">
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
     	<a href="/member/inquiry">문의사항</a>
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
     <div class="col-md-10 order-md-1">
      <h4 class="mb-3 title"><a href="/admin/inquiry" style="color:black;">1:1 문의</a> </h4>
      <div class="row">
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover table-sm">
                                <thead>
                                    <tr>
                                        <th style="width:10%">no</th>
                                        <th>제 목</th>
                                        <th style="width:15%">수정일</th>
                                        <th style="width:15%">담당자</th>
                                    </tr>									
                                </thead>
								<tbody>
								<c:forEach items="${list }" var="vo">
									<tr>
                                        <td class="inquiry_no align-middle"><c:out value="${vo.inquiry_no }"></c:out></td>
                                        <td class="align-middle"><a href="${vo.inquiry_no}" class="move"><c:out value="${vo.title }" ></c:out> </a></td>
                                        <td class="align-middle"><fmt:formatDate pattern="MM-dd HH:mm" value="${vo.updateDate }"/> </td>
                                        <td class="align-middle">
                                        	<c:choose>
                                        		<c:when test="${vo.answer_name==null }">
                                        			<c:out value="담당 대기중"></c:out>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<c:out value="${vo.answer_name }"></c:out>
                                        		</c:otherwise>
                                        	</c:choose>
                                        	
                                        
                                        </td>
                                    </tr>		
								</c:forEach>
									
									
									
								</tbody>
                            </table>
                            <!-- end Pagination -->   
                            </div>
                            <!-- end panel-body -->
                        </div>
                        <!-- end panel -->
                    </div>                   
                </div>     
    </div>
     
     
     
     </main>


		
		
<script>
$(function(){
	$("a.move").click(function(e){
		e.preventDefault();
		let move_no = $(this).attr("href");
		
		location.href = "/member/inquiry/"+move_no;
			
	})
	
})
</script>        

</body>
</html>
<%@include file="../../includes/footer_Main.jsp" %>