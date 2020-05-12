<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap css link -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/font.css" />
<link rel="stylesheet" href="/resources/css/intro_2018_content.css" />
<!-- <link rel="stylesheet" href="/resources/css/intro_2018.css" />     -->
<!-- 웹폰트 -->
<link href = "https://fonts.googleapis.com/css2?family=Do Hyeon&display=swap"rel = "stylesheet">
<!-- bootstrap js,jQuery link -->
<style>
.asideHeader a:visited {color:#fff; text-decoration:none;}
a:hover {color:black; text-decoration:none;}

/*
.tag_var a:visited {color:#fff; text-decoration:none;}
a:link {color:black; text-decoration:none;} 
*/
a:visited {color:black; text-decoration:none;}

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
    min-width:240px;
    width: 20%;
    color: #ffff;
    /* padding: 10px; */
    /* margin: 10px; */
    /* margin-top:50px; */
    /* padding-bottom: 650px; */
    box-sizing: border-box;
    border: 7px solid;
    position: absolute;
    font-size: 35px;
    text-align:center;
    background-color: #336633;
   	visited {color:#9e9e9e; text-decoration:none;}
   }
.asideHeader{
	margin-top: 40px;
}
.aside_content{
	margin-top:30px;
	margin-left: 50px;
	font-size: 22px;
	font: bolder;
}
.panel-body a {
	color: black;
}
.aside_content a {
    color: #fff;
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
a.activated{
	color:#FFFFFF;
}
</style>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
let hn = "${_csrf.headerName}";
let tk = "${_csrf.token}"
</script>

</head>
<body>

	<!-- Header function var -->
		<div id="header">
		<!-- style="background-color: #fbebba;" -->
			<nav class="navbar navbar-expand-lg navbar navbar-light" >
			<div id="Logo">  
			  <a class="navbar-brand" src="/resources/SB_files/SamBank Image Logo.png" href="/"><img src="/resources/SB_files/SamBank Image Logo.png" alt="로고 이미지" ></a>
			</div>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarNavDropdown">
			  <!-- nav bar 오른쪽 정렬 -->
		      	<ul class="navbar-nav ml-auto">
				     <li class="nav-item dropdown">
				        <sec:authorize access="isAuthenticated()">
			  		
			  		<li class="nav-item dropdown active">
			  		
			  		
			        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          <c:out value="${name } 님"></c:out>
			        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="/member/customer/modify">개인정보수정</a>
				          <a class="dropdown-item" href="/member/customer/delete">회원탈퇴</a>
				          <form:form action="${pageContext.request.contextPath}/member/logout" method="POST" class="logout-form">
		      				
		      				<a class="dropdown-item logout" href="#">로그아웃</a>
		      			  </form:form>
				        </div>
					</li>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<li class="nav-item active">
					  <a class="nav-link" href="/register/agree">회원가입</a>
					</li>
					<li class="nav-item active">
					  <a class="nav-link" href="/member/login">로그인</a>
					</li>
				</sec:authorize>
				      </li>
				      <li class="nav-item active">
				        <a class="nav-link" href="#">개인 <span class="sr-only">(current)</span></a>
				      </li>
				      <li class="nav-item active">
				        <a class="nav-link" href="#">기업</a>
				      </li>
				      <li class="nav-item active">
				        <a class="nav-link" href="#">금융 상품</a>
				      </li>
				      <li class="nav-item active">
				        <a class="nav-link" href="#">은행 소개</a>
				      </li>
				      <li class="nav-item active">
				        <a class="nav-link" href="/member/inquiry">고객 센터</a>
				      </li>
			  	</ul>
			  </div>
			</nav>
		</div>
		<!-- 헤더 끝내기 -->
		
		
		<!-- 뱅크 이미지 -->
	<div id="title_imageo" style="margin-left: 3%">  
	  <strong><img src="/resources/SB_files/title logo.png" alt="로고 이미지"></strong>
	  <a class="navbar-brand" src="/resources/SB_files/title logo.png" href="#"></a>
	</div>
		<!-- 뱅크 이미지 끝 -->
		
		
		<!-- 태그바 시작 -->
	<div class="tag_var">
	    <!--  -->
	      <nav class="navbar navbar-expand-lg navbar-light"style="background-color: #666633;">
	        <div class="collapse navbar-collapse" id="navbarnav">
	      		<!-- Example split danger button -->
					<div class="btn-group">
					<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/A" style="color: #fff">공지사항</a></button>
					<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/" style="color: #fff">보안센터</a></button>
					<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/F" style="color: #fff">자료실</a></button>
					<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/N" style="color: #fff">새소식</a></button>
					<button type="button" class="btn btn" role="button" style="margin-left: 15px;" ><a href="/E" style="color: #fff">이벤트</a></button>
					  <!-- 2 -->
					  <div class="btn-group" style="margin-left: 25px;">
						  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    문의 사항
						  </button>
						  <div class="dropdown-menu">
						    <a class="dropdown-item" href="/member/inquiry/register">문의사항 작성</a>
						    <div class="dropdown-divider"></div>
						    <a class="dropdown-item" href="/member/inquiry">1:1 비공개 문의사항</a>
						  </div>
						</div>
					  <!-- 3 -->
					  <div class="btn-group" style="margin-left: 25px;">
						  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    카드 관련
						  </button>
						  <div class="dropdown-menu">
						    <a class="dropdown-item" href="/member/card/request">카드 신청</a>
						    <div class="dropdown-divider"></div>
						  </div>
						</div>


				</div>
     	 </div>
      
      
      
      

      </nav>
      <!--nav영역 종료-->
     </div>
     <!-- 태그바 끝내기 -->
		
		
	<!-- 어사이드 바 -->
     <aside>
     	<div class="asideHeader"style="font-family: 'Do Hyeon', sans-serif; margin-bottom: 500px;">
     	
     	<a href="">빠른이동</a>
     	<div class="aside_content">
			<a href="/A" data-title="공지사항"><c:out value="공지사항"></c:out> </a>
			<div class="dropdown-divider"></div>
			<a href="/N" data-title="새소식"><c:out value="새소식"></c:out> </a>
			<div class="dropdown-divider"></div>
			<a href="/E" data-title="이벤트"><c:out value="이벤트"></c:out> </a>
			<div class="dropdown-divider"></div>
			<a href="/F" data-title="자료실"><c:out value="자료실"></c:out> </a>
			<div class="dropdown-divider"></div>
	     	<sec:authorize access="isAuthenticated()">
	     		<a href="/member/inquiry" data-title="1:1 문의">1:1 비공개 문의</a>
	     		<div class="dropdown-divider"></div>
	     	</sec:authorize>
	     	
	     	
     	</div>
     	
     	
     	</div> 
<!--   		<img src="/resources/SB_files/aside2.png" style="margin-left: 57px; padding-top: 200px;"/> -->
     </aside>
	
		
<script>
$(function(){
	let title = "${title}";
	$("a[data-title='${title}']").addClass("activated");
	
	$(".logout").click(function(e){
		e.preventDefault();
		$(".logout-form").submit();
	})
	
})

</script>		
</body>
