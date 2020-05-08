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
/* html, body, div, span, object, iframe,h1, h2, h3, h4, h5, h6, p, blockquote, pre,a, abbr, acronym, address, big, cite, code,del, dfn, em, img, strong, sub, sup, var,
h1, h2, h3, h4, h5, h6 {font-family:'맑은 고딕', 'Malgun Gothic','돋움',Dotum,AppleGothic,Tahoma,Helvetica,sans-serif;} */
    </style>
   </head>
	<footer> 
	<div class="toast d-inline-flex justify-content-start" role="alert" aria-live="assertive" aria-atomic="true" data-animation="true" data-autohide="true" data-delay="15000" id="idCard_Y" style="z-index:2147483647;position:fixed;right:50px;bottom:50px;width:400px;height:220px">         
		  <div class="toast-header">
		    <!-- <img src="" class="rounded mr-2" alt="..."> -->
		    
		    <img src='/member/inquiry/get_profile_image?id=kdh9752' alt='profile_image' style='width:100px;height:100px;padding-right:10px;padding-left:5px'>
		    
		  </div>
		  <div class="toast-body">
		    Hello, world! This is a toast message.
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
                     <p class="copyright">본사 위치 : 서울특별시 노원구 동일로 1082 KT대우직업능력개발원 (주)SB카드</p>
                     <a href="" >담당자 이메일 : youinho@github.com</a>
                 </div> <!-- info END -->
                 <br/>
                     <!-- onchange="if(this.value) location.href=(this.value);" -->
                  <!-- <div class="select_team" style="float:right; background-color: #acaeb9;" > -->
                     <select id="select_idCard">
                         <option value="0">조 원 소 개</option>
                         <option value="Y">유 인 호 </option>
                         <option value="K">김 동 혁</option>
                         <option value="L">이 다 형</option>
                         <option value="P">박&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;훈 </option>
                     </select>
                  <!-- </div> --> 
              </div>
         </div> <!-- footer END -->
         
 	</footer>
<script>
$(function(){
	$("#select_idCard").change(function(){
		if($(this).val()==="0"){
			$("#idCard").toast('hide');
			return false;
		}else{
			$("#idCard_Y").toast('show');
			console.log("ggggg");
		}
		
		
	})
})
</script>