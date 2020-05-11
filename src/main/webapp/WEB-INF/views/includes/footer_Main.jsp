<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <style>
footer{
	margin-top: 100px;
	font-size: 12px;
	/* margin-left: 15%; */
}
.footer {
  background: #fff;
  color: #black;
}
.info{
  font-family:'HY견고딕, 'Malgun Gothic','돋움',Dotum,AppleGothic,Tahoma,Helvetica,sans-serif;
}
.footer-inner.set-pc {
    text-align: center;
}
div[id^='idCard']{
	z-index:2147483647;
	position:fixed;
	right:-1000px;
	bottom:50px;
	max-width:450px;
	width:450px;
	height:220px;
}
/* html, body, div, span, object, iframe,h1, h2, h3, h4, h5, h6, p, blockquote, pre,a, abbr, acronym, address, big, cite, code,del, dfn, em, img, strong, sub, sup, var,
h1, h2, h3, h4, h5, h6 {font-family:'맑은 고딕', 'Malgun Gothic','돋움',Dotum,AppleGothic,Tahoma,Helvetica,sans-serif;} */
    </style>
   </head>
	<footer>
	<!-- 조원소개 카드 -->
	<div class="toast d-inline-flex justify-content-start idCard" role="alert" aria-live="assertive" aria-atomic="true" data-animation="true" data-autohide="false" data-delay="15000" id="idCard">
	  <div class="toast-header d-flex flex-column justify-content-around" >
	    <div style="margin:0" >
	    	<img src='/resources/img/kimdom.jpg' alt='profile_image' style='width:130px;height:130px;padding-right:10px;padding-left:5px' id="card_img">
	    </div>
	    <div style="margin:0;padding:0" id="card_name"></div>
	    
	  </div>
	  <div class="toast-body" id="card_work" style="width:360px">
	    	  
	  </div>
	  <div style="height:100%">
		  <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
		      <span aria-hidden="true">&times;</span>
		  </button>
	  </div>
	</div>
	<div class="line" style="text-align: center;">
			  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4" >
			    <div class="col"></div>
			    <!-- style="text-align: right;" -->
			    <div class="col" ><p style="margin-top: 15px;" >대표 1588-9955 | 금융서비스 | LANGUAGE </p></div>
			    <div class="col" style= "text-align: left;">
			 	<img src="/resources/SB_files/fotter1.png" alt="로고 이미지">
				<img src="/resources/SB_files/fotter2.png" alt="로고 이미지">
			    </div>
			  </div>
	</div>
	<br />
      <div class="footer">
         <div class="footer-inner set-pc" >
             <div class="info">
                 <p class="phone">SB카드 상담센터 1588-9955, 1599-9955 (해외지역 82-2-6958-9000)&nbsp;&nbsp;|&nbsp;금융서비스
                     1577-9000&nbsp;&nbsp;|&nbsp;카드 간편신청 1599-0200</p>
                     <p class="quick">
                         <a href="3">프로젝트 소개</a>&nbsp;&nbsp;|&nbsp;
                         <a href="" title="새창열림" onclick="jsOpenWindow(&quot;Dream?withyou=FXCNT0005&quot;,&quot;branch&quot;,894,710,1,1);return false">영업점안내</a>&nbsp;&nbsp;|
                         <a href="">이용약관</a>&nbsp;&nbsp;|&nbsp;
                         <a href=""><span class="font-bold inline">개인정보처리방침</span></a>&nbsp;&nbsp;|&nbsp;
                         <a href=""><span class="font-bold inline">개인신용정보관리보호</span></a>&nbsp;&nbsp;|&nbsp;
                         <a href="">ARS안내</a>&nbsp;&nbsp;|&nbsp;
                         <a href="">분실신고</a>&nbsp;&nbsp;|&nbsp;
                         <a href="">웹접근성안내</a>&nbsp;&nbsp;|&nbsp;
                         <a href="">사이트맵</a>
                     </p>
                     <p class="copyright">본사 위치 : 서울특별시 노원구 동일로 1082 KT대우직업능력개발원 (주)SB은행</p>
                     <a href="" >담당자 이메일 : admin@sambank.net</a>
                     <select id="select_idCard">
                         <option value="0">**조 원 소 개**</option>
                         <option value="Y">조장 유 인 호</option>
                         <option value="K">조원 김 동 혁</option>
                         <option value="L">조원 이 다 형</option>
                         <option value="P">조원 박&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;훈 </option>
                     </select>
                 </div> <!-- info END -->
                 <br/>
                     <!-- onchange="if(this.value) location.href=(this.value);" -->
                  <!-- <div class="select_team" style="float:right; background-color: #acaeb9;" > -->
                     
                  <!-- </div> --> 
              </div>
         </div> <!-- footer END -->
         
 	</footer>
<script>
$(function(){
	$("#select_idCard").change(function(){
		let id = $(this).val();
		if(id==="0"){
			$("#idCard").toast('hide');
			return false;
		}else{
			$("#idCard").toast('hide');
			let img = "";
			let name = "";
			let work = "";
			if(id==="K"){
				img = "/resources/img/kimdom.jpg";
				name = "<small>조원</small> <strong style='font-size:1.2em'>김 동 혁</strong>"
				work = "<strong>담당업무</strong><br><br>관리자 페이지 <br>고객 페이지(게시판 및 문의)<br>보안(SpringSecurity, 로그인 및 가입 등)<br> AWS 웹서버 구현<br>"
			}else if(id==="Y"){
				img = "/resources/img/umb.gif";
				name = "<small>조장</small> <strong style='font-size:1.2em'>유 인 호</strong>"
				work = "<strong>담당업무</strong><br><br>유인호-담당업무"
			}else if(id==="P"){
				img = "/resources/img/umb.gif";
				name = "<small>조원</small> <strong style='font-size:1.2em'>박   훈</strong>"
				work = "<strong>담당업무</strong><br><br>박 훈-담당업무"
			}else if(id==="L"){
				img = "/resources/img/umb.gif";
				name = "<small>조원</small> <strong style='font-size:1.2em'>이 다 형</strong>"
				work = "<strong>담당업무</strong><br><br>이다형-담당업무"
			}
			
			
			
			
			
			$("#card_img").attr("src", img);
			$("#card_name").html(name);
			$("#card_work").html(work);
			$("#idCard").css("right", "50px")
			$("#idCard").toast('show');
			console.log("ggggg");
		}
		
		
	})
	$(".close").click(function(){
		$("#idCard").toast('hide');
		$("#idCard").css("right", "-1000px");
	})
})
</script>