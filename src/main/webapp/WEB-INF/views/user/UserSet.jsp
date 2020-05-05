<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_Main.jsp" %>
<script src="/resources/js/register.js"></script>
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
    border: 1px solid;
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
<title>SamBank '<'사용자정보 확인'>' </title>
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
				  <div class="btn-group" style="margin-left: 25px;">
					  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
					  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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









<script>
	$(function(){
		let gender = '${vo.gender}';
		if(gender === "남"){
			$("input[value='남']").prop("checked","true");
		}else if(gender === "여"){ 
			$("input[value='여']").prop("checked","true");
		}
		
	})
</script>     
	<!-- 여기다가 작성하면됨 -->
	<main  style="background-color:#F5F5F5;">
		<div class="container" style="margin-top:40px">
		<form id="regist" method="post" action="step3">	
			<div class="form-group row justify-content-center">
				<label for="userid" class="col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-6">			
					<input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력하세요" value="${vo.id }"/>
					 <small id="id" class="text-info"></small>	
				</div>
			</div>
			<div class="form-group row justify-content-center">
				<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
				<div class="col-sm-6">	
					<input type="password" name="password" id = "password" class="form-control" placeholder="비밀번호를 입력하세요"/>
					<small id="password" class="text-info"></small>	
				</div>
			</div>	
			<div class="form-group row justify-content-center">
				<label for="confirm_password" class="col-sm-2 col-form-label">비밀번호 확인 </label>
				<div class="col-sm-6">	
					<input type="password" name="confirm_password" id = "confirm_password" class="form-control" placeholder="비밀번호를 다시 입력하세요"/>
					<small id="confirm_password" class="text-info"></small>
				</div>	
			</div>	
			<div class="form-group row justify-content-center">
				<label for="name" class="col-sm-2 col-form-label">이름 </label>
				<div class="col-sm-6">	
					<input type="text" name="name" id="name" class="form-control" placeholder="이름을 입력하세요" value="${vo.name }"/>
					<small id="name" class="text-info"></small>
				</div>	
			</div>
			<div class="form-group row justify-content-center">
				<label for="eng_name" class="col-sm-2 col-form-label">영문이름 </label>
				<div class="col-sm-6">	
					<input type="text" name="eng_name" id="eng_name" class="form-control" placeholder="영어 이름을 입력하세요" value="${vo.eng_name }"/>
					<small id="eng_name" class="text-info"></small>
				</div>	
			</div>
			<div class="form-group row justify-content-center">
			<label for="gender" class="col-sm-2 col-form-label">성별 </label>
			  <div class="col-sm-6">		
					<div class="form-check form-check-inline">		
						<input type="radio" id="gender" name="gender" value="남" class="form-check-input"/>남 <!--  ${vo.gender=='남'?'checked':""} -->				
				  	</div>	
				  	<div class="form-check form-check-inline">
						<input type="radio"  name="gender" value="여" class="form-check-input" />여	<!-- ${vo.gender=='여'?'checked':""} -->			
					</div>
					<small id="gender" class="text-info"></small>
				</div>
			</div>		
			<div class="form-group row justify-content-center">
				<label for = "phone" class="col-sm-2 col-form-label">휴대폰번호</label>
				<div class="col-sm-6">	
					<input type="mobile" name="mobile" id="mobile" class="form-control" placeholder="010xxxxxxxx" value="${vo.mobile }"/>	
					<small id="mobile" class="text-info"></small>		
				</div>	
			</div>
			<div class="form-group row justify-content-center">
				<label for = "birth" class="col-sm-2 col-form-label">생년월일</label>
				<div class="col-sm-6">	
					<input type="birth" name="birth" id="birth" class="form-control" placeholder="000000" value="${vo.birth}"/>	
					<small id="birth" class="text-info"></small>		
				</div>	
			</div>
			
			<div class="form-group row justify-content-center">
				<label for = "phone" class="col-sm-2 col-form-label">주소</label>
				<div class="col-sm-6">	
					<input type="address" name="address" id="address" class="form-control" placeholder="서울시 xx구 xx동" value="${vo.address }"/>	
					<small id="address" class="text-info"></small>		
				</div>	
			</div>
			<div class="form-group row justify-content-center">
				<label for = "email" class="col-sm-2 col-form-label">이메일</label>
				<div class="col-sm-6">	
					<input type="email" name="email" id="address" class="form-control" placeholder="example@gmail.com" value="${vo.email }"/>	
					<small id="email" class="text-info"></small>		
				</div>	
			</div>
			
			<div class="form-group text-center">		
				<button type="submit" class="btn btn-primary">입력</button>
			    <button type="reset" class="btn btn-secondary">취소</button>		
			</div>		
		</form>
		</div>
	</main>


		
		
		
		
		
		
        

</body>
</html>
<%@include file="../includes/footer_Main.jsp" %>