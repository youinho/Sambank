<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header_Main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.tag_var{
		WIDTH: 85%;
		margin-left: 100px;
		/* background-color: #d5d5d5 ; */
		
	}
	[class^="sm"]{
		border: 1px solid white;
	}
	aside {
        width: 25%;
        color: #ffff;
        padding: 10px;
        margin: 10px;
        margin-top:50px;
        box-sizing: border-box;
        border: 1px dashed;
      	position: absolute;
		font-size: 35px;
      }
      
    main{
		width : 70%;
		position: relative;
		margin-left: 300px;
		margin-top: 50px;
		font: bolder;
	}
	.aside_content{
	margin-top:30px;
	margin-left: 50px;
	font-size: 22px;
	font: bolder;
	}
      
</style>
<title>SamBank 문의사항</title>
</head>
<body>
	<div id="title_imageo">  
	  <strong><img src="/resources/SB_files/visual_section16_tit01.png" alt="로고 이미지"></strong>
	  <a class="navbar-brand" src="/resources/SB_files/visual_section16_tit01.png" href="#"></a>
	</div>
	
	<br />
	
	
	
    <div class="tag_var">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="collapse navbar-collapse" id="navbarnav">
      		<!-- Example split danger button -->
				<div class="btn-group">
				  <!-- 1 -->
				  <button type="button" class="btn btn-success">Action</button>
				  <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    <span class="sr-only">Toggle Dropdown</span>
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="#">Action</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Another action</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Something else here</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Separated link</a>
				  </div>
				  <!-- 2 -->
				  <button type="button" class="btn btn-success" style="margin-left: 35px;" >Action</button>
				  <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    <span class="sr-only">Toggle Dropdown</span>
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="#">Action</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Another action</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Something else here</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Separated link</a>
				  </div>
				  <!-- 3 -->
				  <button type="button" class="btn btn-success" style="margin-left: 35px;" >Action</button>
				  <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    <span class="sr-only">Toggle Dropdown</span>
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="#">Action</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Another action</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Something else here</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Separated link</a>
				  </div>
				  <!-- 4 -->
				  <button type="button" class="btn btn-success"  style="margin-left: 35px;" >Action</button>
				  <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    <span class="sr-only">Toggle Dropdown</span>
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="#">Action</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Another action</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Something else here</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Separated link</a>
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
     	</li>
     	<div class="aside_content">
     	 	<li>     	
	     	<a href="">문의사항 작성</a>
	     	</li>
	     	<li>     	
	     	<a href="">문의사항 취소</a>
	     	</li>
	     	<li>     	
	     	<a href="">1:1 비공개 문의사항</a>
	     	</li>
     	</div>
     	</ul>
     	</div>
  	
     </aside>
     
     
     
     
     
     <main>
	<!-- 여기다가 작성하면됨 -->
     
     <!-- (게시글 작성 버튼) -->
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"style="margin-left: 1020px;" >
		  	작성
		</button>

     
     </main>


		
		
        

</body>
</html>