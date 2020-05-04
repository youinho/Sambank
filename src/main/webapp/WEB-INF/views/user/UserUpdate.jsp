<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_Main.jsp" %>
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
.tag_var{
	WIDTH: 85%;
	margin-left: 100px;
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
    border: 1px dashed;
    position: absolute;
    font-size: 35px;
    background-color: darkseagreen;
   	visited {color:#9e9e9e; text-decoration:none;}
   }

.aside_content{
	margin-top:30px;
	margin-left: 50px;
	font-size: 22px;
	font: bolder;
}
.asideHeader li {
    font-style: italic;
    font-weight: bolder;
    text-align: center;
    margin-top: 25px;
    margin-right: 20px;
}

</style>
<title>SamBank '<'개인정보수정'>' </title>
</head>
<body>
	<div id="title_imageo">  
	  <strong><img src="/resources/SB_files/visual_section16_tit01.png" alt="로고 이미지"></strong>
	  <a class="navbar-brand" src="/resources/SB_files/visual_section16_tit01.png" href="#"></a>
	</div>
	
	<br />
	
	
	
    <div class="tag_var">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="width: 88%;margin-left: 5%;">
        <div class="collapse navbar-collapse" id="navbarnav">
      		<!-- Example split danger button -->
				<div class="btn-group">
				<button type="button" class="btn btn-success" role="button" style="margin-left: 15px;" ><a href="">공지사항</a></button>
				<button type="button" class="btn btn-success" role="button" style="margin-left: 15px;" ><a href="">보안센터</a></button>
				<button type="button" class="btn btn-success" role="button" style="margin-left: 15px;" ><a href="">자료실</a></button>
				<button type="button" class="btn btn-success" role="button" style="margin-left: 15px;" ><a href="">새소식</a></button>
				<button type="button" class="btn btn-success" role="button" style="margin-left: 15px;" ><a href="">이벤트</a></button>
				  <!-- 2 -->
				  <button type="button" class="btn btn-success" style="margin-left: 35px;" >문의사항</button>
				  <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    <span class="sr-only">Toggle Dropdown</span>
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
				  <!-- 3 -->
				  <button type="button" class="btn btn-success" style="margin-left: 35px;" >카드관련</button>
				  <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    <span class="sr-only">Toggle Dropdown</span>
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
      
      
      
      

      </nav>
      <!--nav영역 종료-->
     </div>
     
     
     
     
     
     
     <aside>
     	<div class="asideHeader">
     	<ul>
     	<li>
     	<a href="">문의사항</a>
     	<div class="dropdown-divider"></div>
     	</li>
     	<div class="aside_content">
     	 	<li>     	
	     	<a href="">문의사항 작성</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
	     	<li>     	
	     	<a href="">문의사항 취소</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
	     	<li>     	
	     	<a href="">1:1 비공개 문의사항</a>
	     	<div class="dropdown-divider"></div>
	     	</li>
     	</div>
     	</ul>
     	</div>
  	
     </aside>
     
     
     
     
     
     <main>
	<!-- 여기다가 작성하면됨 -->
     
     </main>


		
		
        

</body>
</html>
<%@include file="../includes/footer_Main.jsp" %>