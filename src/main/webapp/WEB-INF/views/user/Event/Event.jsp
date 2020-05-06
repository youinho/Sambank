<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	position: fixed;
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

</style>
<title>SamBank < 이벤트 > </title>
</head>
<body>
	<div id="title_imageo" style="margin-left: 3%">
	  <a class="navbar-brand" src="/resources/SB_files/title logo.png" href="/"><img src="/resources/SB_files/title logo.png" alt="로고 이미지"></a>
	</div>
	
	<br />
	
	
	
    <div class="tag_var">
    <!--  -->
      <nav class="navbar navbar-expand-lg navbar-light"style="background-color: #666633;">
        <div class="collapse navbar-collapse" id="navbarnav">
      		<!-- Example split danger button -->
				<div class="btn-group">
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/no">공지사항</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="">보안센터</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="">자료실</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/N">새소식</a></button>
				<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/E">이벤트</a></button>
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
     	<a href="">이벤트</a>
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
     
     </main>


		
		
        

</body>
</html>
<%@include file="../../includes/footer_Main.jsp" %>