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
/* 	position: fixed; */
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
form > div{
	padding : 0;
}
small{
	color : red;	
}	
form > div > div> button{
	background-color : #c0c0c0;
	margin-left : 10px;
}
.label{
	margin-bottom: 3px;
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
     	<a href="">고객관리</a>
     	<div class="dropdown-divider"></div>
     	<div class="aside_content">
	     	<a href="">개인정보수정</a>
	     	<div class="dropdown-divider"></div>
	     	<a href="">회원 탈퇴</a>
	     	<div class="dropdown-divider"></div>
     	</div>
     	</ul>
     	</div>
  	
     </aside>
     
     
     
     
     
	<main>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/member/customer/member_modifyCustomer_validate.js"></script>
<script>
function alert_mod(){
	let updated = "${updated}";
	if(updated ==='' || history.state){
		return;
	}
	
	if(updated === "success"){
		alert("${name}"+" 고객님의 정보 수정이 완료되었습니다.");
	}else if(updated === "failed"){
		alert("수정에 실패했습니다.");
	}
	
	
}





</script>

	<div class="col-md-12 order-md-1">
	
      <h4 class="mb-3 title">고객 정보 수정</h4>
      <div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text text-center" style="width:100%"><strong>고객 정보</strong></p>
			  </div>
			  <input type="text"  class="form-control" id="id" name="id" placeholder="아이디" value="${vo.id }" readonly>
			  <input type="text"  class="form-control" id="name" name="name" placeholder="성함" value="${vo.name }" readonly>
			  
			</div>
      
      <form class="needs-validation" novalidate="" method="post" id="register_customer">        
		<div class="mb-3">
		<div class="label">
          <label for="birth">생년월일 </label>
          <small name="birth">
            
          </small>
          </div>
          <div class="input-group">
	          <input type="text" class="form-control" name="birth" id="birth" placeholder="예) 19930928" value="${vo.birth }" readonly>
	          <button class="btn btn-outline-secondary" type="button" id="birth_lock">
					    	<svg class="bi bi-lock-fill" width="1.25em" height="1.25em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <rect width="11" height="9" x="2.5" y="7" rx="2"/>
							  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd"/>
							</svg>
					    </button>
		    </div>
        </div>
		
		
        
        <div class="mb-3">
         <div class="label">
          <label for="address">주소 </label><button class="btn btn-outline-primary btn-sm" id="search_juso" >주소 검색</button>
          <small name="address">
            
          </small>
         </div>
         <div class="input-group">
         <input type="text" class="form-control" name="address" id="address" placeholder="예) 서울시 노원구 공릉동 444-2" value="${vo.address }" readonly>
         <button class="btn btn-outline-secondary" type="button" id="address_lock">
					    	<svg class="bi bi-lock-fill" width="1.25em" height="1.25em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <rect width="11" height="9" x="2.5" y="7" rx="2"/>
							  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd"/>
							</svg>
					    </button>
		    </div>
        </div>
        <div class="mb-3">
        <div class="label">
          <label for="mobile">전화번호 </label>
          <small name="mobile">
            
          </small>
          </div>
          <div class="input-group">
          <input type="text" class="form-control" name="mobile" id="mobile" placeholder="예) 01012345678" value="${vo.mobile }" readonly>
          <button class="btn btn-outline-secondary" type="button" id="mobile_lock">
					    	<svg class="bi bi-lock-fill" width="1.25em" height="1.25em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <rect width="11" height="9" x="2.5" y="7" rx="2"/>
							  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd"/>
							</svg>
					    </button>
		    </div>
        </div>
        <div class="mb-3">
        <div class="label">
          <label for="email">이메일 </label>
          <small name="email">
            
          </small>
          </div>
          <div class="input-group">
          <input type="text" class="form-control" name="email" id="email" placeholder="예) abc123@naver.com" value="${vo.email }" readonly>
          <button class="btn btn-outline-secondary" type="button" id="email_lock">
					    	<svg class="bi bi-lock-fill" width="1.25em" height="1.25em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <rect width="11" height="9" x="2.5" y="7" rx="2"/>
							  <path fill-rule="evenodd" d="M4.5 4a3.5 3.5 0 117 0v3h-1V4a2.5 2.5 0 00-5 0v3h-1V4z" clip-rule="evenodd"/>
							</svg>
					    </button>
		    </div>
        </div>
       	
        
        
        <hr class="mb-4">
        
        <button type="submit" style="display:none" id="submitBtn"></button>
        <sec:csrfInput/>
      </form>

      <div class="input-group">
		  <div class="input-group-prepend" style="width:15%">
		    <span class="input-group-text" style="width:100%"><strong>비밀번호</strong> </span>
		  </div>
		  <input type="password"  class="form-control" name="password" id="password">
		    
		  <input type="password"  class="form-control" name="confirm_password" id="confirm_password">
		  
		    <button class="btn btn-outline-primary" type="button" id="changePwdBtn">
		    	비밀번호 변경
		    </button>
		  <div class="input-group-append">
		  </div>
		</div>
            <button class="btn btn-primary btn-lg btn-block" type="button" id="button" style="margin-top:20px">고객 정보 수정</button>
    </div>
    <div class="bottom">
    </div>
<script src="/resources/js/member/customer/member_modifyCustomer.js"></script>
     
     </main>


		
		
        

</body>
</html>
<%@include file="../../includes/footer_Main.jsp" %>