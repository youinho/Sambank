<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<%-- <%@include file="includes/header_Main.jsp" %> --%>
<!-- bootstrap css link -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">-->
<link rel="stylesheet" href="/resources/bootstrap/bootstrap.css" />
<!-- bootstrap에서 min.css다운받은이후 resource파일안에집어넣은후 min.css 파일에서 리부트 부분 수정  -->
<link rel="stylesheet" href="/resources/css/font.css" />
<link rel="stylesheet" href="/resources/css/intro_2018_content.css" />
<link rel="stylesheet" href="/resources/css/intro_2018.css" />    
<!-- bootstrap js,jQuery link -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<!-- 링크 스위퍼 CSS -->
<link rel="stylesheet" href="/resources/css/swiper.min.css">


<!-- 슬라이더 styles -->
<style>
  .Swiper {
    position: relative;
    height: 400px;
    font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
    font-size: 14px;
    margin: 0;
    padding: 0;
  }
  .swiper-container {
    width: 100%;
    height: 100%;
  }
  .swiper-slide {
    text-align: center;
    font-size: 18px;

    /* Center slide text vertically */
    display: -webkit-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    align-items: center;
  }
/* 슬라이드컨텐츠 : section11 : 오픈뱅킹 */
.wrap-visual.active1 {background:#fbebba;}
.wrap-visual.active1 .area-control .ui-btn.before:after {border-right-color:#fbebba;}
.wrap-visual.active1 .area-control .ui-btn.next:after {border-left-color:#fbebba;}

/* 슬라이드컨텐츠 : section25 LiivM*/
.wrap-visual.active2 {background:#d0eefa;}
.wrap-visual.active2 .area-control .ui-btn.before:after {border-right-color:#d0eefa;}
.wrap-visual.active2 .area-control .ui-btn.next:after {border-left-color:#d0eefa;}

/* 슬라이드컨텐츠 : section10 : 외환 */
.wrap-visual.active3 {background:#cfe1f6;}
.wrap-visual.active3 .area-control .ui-btn.before:after {border-right-color:#cfe1f6;}
.wrap-visual.active3 .area-control .ui-btn.next:after {border-left-color:#cfe1f6;}

/* 슬라이드컨텐츠 : section5 : KB모바일인증서 */
.wrap-visual.active4 {background:#dbe8f9;}
.wrap-visual.active4 .area-control .ui-btn.before:after {border-right-color:#dbe8f9;}
.wrap-visual.active4 .area-control .ui-btn.next:after {border-left-color:#dbe8f9;}

/* 슬라이드컨텐츠 : section6 : 봄시즌 */
.wrap-visual.active5 {background:#d6de9e;}
.wrap-visual.active5 .area-control .ui-btn.before:after {border-right-color:#d6de9e;}
.wrap-visual.active5 .area-control .ui-btn.next:after {border-left-color:#d6de9e;}

</style>


</head>
	<!-- Main Image 시작 -->
	


	
	
	
	<!-- style="margin-top: 69px" -->
	<div id="Main">
	
	
		<div id="header" class="headerWrap" >
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<!-- Header function var -->
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
			<!-- style="background-color: #fbebba;" -->
			<nav class="navbar navbar-expand-lg navbar navbar-light">
			
			<div id="Logo">  
			  <strong><img src="/resources/KB_files/SamBank Image Logo.png" alt="로고 이미지"></strong>
			  <a class="navbar-brand" src="/resources/KB_files/SamBank Image Logo.png" href="#"></a>
			</div>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarNavDropdown">
			  <!-- nav bar 오른쪽 정렬 -->
		      	<ul class="navbar-nav ml-auto">
				     <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          로그인 관련창
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" hlocalref="#">프로필 관리</a>
				          <a class="dropdown-item" href="#">개인정보수정</a>
				          <a class="dropdown-item" href="#">로그아웃</a>
				        </div>
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
				        <a class="nav-link" href="#">고객 센터</a>
				      </li>
			  	</ul>
			  </div>
			</nav>
		</div>
		
	
	
	<!-- 스위퍼 시작부분 -->
		<div class="Swiper">
			<!-- Swiper -->
			  <div class="swiper-container">
			    	<!-- 이곳에다가 객체의 변수값에 컬러값을 담아서 회전될때마다 순차적으로 불러내는방식으로 페이지 컬러 변경 
			    	style="background-color: #fbebba;" -->
			    <div class="swiper-wrapper" >
							<div class="swiper-slide"  >
							<!--  컨텐츠 - 1 -->
							<li >
								<div>
									<strong><img src="/resources/SB_files/visual_section16_tit01.png" alt="SB오픈뱅크 서비스"></strong><br />
									<span><img src="/resources/SB_files/visual_section16_tit02.png" alt="나의 모든 금융생활을 SB뱅크 한 곳에서!"></span><br/>
									<a href="" class="link">바로가기</a>
								</div>
							</li>
							</div>
							<div class="swiper-slide">
							<!-- 컨텐츠 - 2 -->
									<li class="wrap-visual.active2">
									<div>
										<strong><img src="/resources/SB_files/visual_section25_tit01.png" alt="통신비 계획이 다 있구나! 반값이라니!"></strong><br />
										<span><img src="/resources/SB_files/visual_section25_tit02.png" alt="Liiv M LTE 무제한(11GB+) 22,000원!"></span><br />
										<a href="" class="link">바로가기</a>
									</div>
									</li>
							</div>
							<div class="swiper-slide">	
							<!-- 컨텐츠 - 3 -->
									<li class="wrap-visual.active3">
									<div>
										<strong><img src="/resources/SB_files/visual_section10_tit01.png" alt="언제 어디서나 빠르고 쉽게 외환도 역시 SB!"></strong>
										<span><img src="/resources/SB_files/visual_section10_tit02.png" alt="외화 환전 최대 90% 환율우대 (별도 통보시까지)"></span>
										<a href="" class="link">바로가기</a>
									</div>
									</li>
							</div>
							<div class="swiper-slide">
							<!-- 컨텐츠 - 4 -->
									<li class="wrap-visual.active4">
									<div>
										<strong><img src="/resources/SB_files/visual_section5_tit01.png" alt="SB모바일인증서"></strong>
										<span><img src="/resources/SB_files/visual_section5_tit02.png" alt="모든 금융거래의 시작&lt;br/&gt;이제는 평생, 쉽게, 안전하게 사용하세요!"></span>
										<a href="" class="link">바로가기</a>
									</div>
									</li>
							</div>
							<div class="swiper-slide">
							<!-- 컨텐츠 - 5 -->
									<li class="wrap-visual.active5">
									<div>
										<strong><img src="/resources/SB_files/visual_section18_tit01.png" alt="늘 곁에, 더 가까이 SB은행"></strong>
										<span><img src="/resources/SB_files/visual_section18_tit021.png" alt="일상의 쉼표가 필요한 순간, SB은행과 함께 하세요."></span>
									</div>
							</div>
			    </div>
			    <!-- Add Pagination -->
			    <div class="swiper-pagination"></div>
			    <!-- Add Arrows -->
			    <div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
			  </div>
			
			<!-- Swiper JS -->
			<script src="/resources/js/swiper.min.js"></script>
			
			  <!-- Initialize Swiper -->
			  <script>
			    var swiper = new Swiper('.swiper-container', {
			      spaceBetween: 30,
			      
			      centeredSlides: true,
			      autoplay: {
			        delay: 2500,
			        disableOnInteraction: false,
			      },
			      pagination: {
			        el: '.swiper-pagination',
			        clickable: true,
			      },
			      navigation: {
			        nextEl: '.swiper-button-next',
			        prevEl: '.swiper-button-prev',
			      },
			    });
			  </script>
		<!-- 스위퍼 끝 -->
		
	
	
	

<!-- Main Image 끝 -->
	
<!--  link var 시작 -->
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<!-- 빠른메뉴 -->
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<div class="main-section main-con1">
			<ul class="menu1">
				<li><a href="https://obank.kbstar.com/quics?page=C019088&amp;QSL=F" class="q1">전체계좌조회</a></li>
				<li><a href="https://obank.kbstar.com/quics?page=C018393&amp;QSL=F" class="q2">계좌이체</a></li>
				<li><a href="https://www.kbstar.com/#" onclick="openPopup(&#39;https://obank.kbstar.com/quics?page=C025255&amp;cc=b028364:b028702&amp;QSL=F&#39;,&#39;빠른조회&#39;,&#39;720&#39;,&#39;650&#39;); return false;" title="새창 열기">빠른조회</a></li>
			</ul>
			<ul class="menu2">
				<li><a href="https://obank.kbstar.com/quics?page=osecure&amp;QSL=F">빠른조회</a></li>
				<li><a href="https://otalk.kbstar.com/quics?page=omember&amp;QSL=F">보안센터</a></li>
				<li><a href="https://obank.kbstar.com/quics?page=C036336&amp;QSL=F">자료실</a></li>
				<li><a href="https://obank.kbstar.com/quics?page=C029656&amp;QSL=F">문의사항</a></li>
				<li><a href="https://obank.kbstar.com/quics?page=C022180&amp;QSL=F">로그인</a></li>
				<li><a href="https://obank.kbstar.com/quics?page=C022180&amp;QSL=F">추가예정</a></li>
			</ul>
		</div>
</div>	
<!--  link var 끝 -->
<!-- Main View 시작 -->
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<!-- 새소식, 이벤트 -->
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<div class="main-section main-con2">
			<!-- ################################## -->
			<!-- 새소식 -->
			<!-- ################################## -->
			<div class="section">
				<h2>새소식</h2>
				<ul class="list-board">
					<!-- 컨텐츠하나 ---------------------- // -->
					<li>
						<a href="https://otalk.kbstar.com/quics?page=C019391&amp;bbsMode=view&amp;articleId=19013&amp;QSL=F">
							<span>코로나19 관련 해킹 등 피해예방 수칙 안내</span>
							<!-- <em class="icon-new">[NEW]</em>-->
							<span>03.10</span>
						</a>
					</li>		
					<!-- 컨텐츠하나 ---------------------- // -->
					<li>
						<a href="https://otalk.kbstar.com/quics?page=C019391&amp;bbsMode=view&amp;articleId=18991&amp;QSL=F">
							<span>은행업무 이제 집에서 편하게 보세요! </span>
							<!-- <em class="icon-new">[NEW]</em>-->
							<span>03.05</span>
						</a>
					</li>		
					<!-- 컨텐츠하나 ---------------------- // -->
					<li>
						<a href="https://otalk.kbstar.com/quics?page=C019391&amp;bbsMode=view&amp;articleId=18963&amp;QSL=F">
							<span>대구·경북지역 영업점 영업시간 변경 안내</span>
							<!-- <em class="icon-new">[NEW]</em>-->
							<span>03.02</span>
						</a>
					</li>	
					<!-- ---------------------------------- // -->
				</ul>
				<a href="https://otalk.kbstar.com/quics?page=C019391&amp;QSL=F" class="sub" title="새소식 바로가기">바로가기</a>
			</div>

			<!-- ################################## -->
			<!-- 이벤트 -->
			<!-- ################################## -->
			<div class="section">
				<h2>이벤트</h2>
				<ul class="list-board">
						<!-- 컨텐츠하나 ---------------------- // -->
                    <li>
						<a href="https://omoney.kbstar.com/quics?page=C016559&amp;cc=b033091:b032977&amp;%EC%9D%B4%EB%B2%A4%ED%8A%B8%EC%9D%BC%EB%A0%A8%EB%B2%88%ED%98%B8=312264&amp;QSL=F">
							<span>「Happy Home, Happy Money」 편하게 집에서 주택청약종합저축 신규가입하고 해피머니 받자!!</span>
                            <em class="icon-new">[NEW]</em>
							<span>04.06 ~ 04.30</span>
						</a>
					</li>
					
					<!-- 컨텐츠하나 ---------------------- // -->
                    <li>
						<a href="https://omoney.kbstar.com/quics?page=C016559&amp;cc=b033091:b032977&amp;%EC%9D%B4%EB%B2%A4%ED%8A%B8%EC%9D%BC%EB%A0%A8%EB%B2%88%ED%98%B8=312154&amp;QSL=F">
							<span>앵콜! 내 경품 내가 고르는! KB오픈뱅킹 신규 가입 이벤트</span>
                            <em class="icon-new">[NEW]</em>
							<span>04.01 ~ 05.15</span>
						</a>
					</li>

					<!-- 컨텐츠하나 ---------------------- // -->
					<li>
						<a href="https://omoney.kbstar.com/quics?page=C016559&amp;cc=b033091:b032977&amp;%EC%9D%B4%EB%B2%A4%ED%8A%B8%EC%9D%BC%EB%A0%A8%EB%B2%88%ED%98%B8=311855&amp;QSL=F">
							<span>KB 대기시간 ‘제로(0)’ 프로젝트 “KB의 디지털서비스로 나의 시간을 혁신하다”</span>
                            <!--<em class="icon-new">[NEW]</em>-->
							<span>03.27 ~ 06.30</span>
						</a>
					</li>
					
				
					<!-- ---------------------------------- // -->
				</ul>
				<a href="https://omoney.kbstar.com/quics?page=oevent&amp;QSL=F" class="sub" title="이벤트 바로가기">바로가기</a>
			</div>
			<!-- ################################## -->
		</div>



		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<!-- 공지사항, 추가예정 -->
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<div class="main-section main-con3">
			<!-- ################################## -->
			<!-- 새소식 -->
			<!-- ################################## -->
			<div class="section">
				<h2>공지사항</h2>
				<ul class="list-board">
					<!-- 컨텐츠하나 ---------------------- // -->
					<li>
						<a href="https://otalk.kbstar.com/quics?page=C019391&amp;bbsMode=view&amp;articleId=19013&amp;QSL=F">
							<span>코로나19 관련 해킹 등 피해예방 수칙 안내</span>
							<!-- <em class="icon-new">[NEW]</em>-->
							<span>03.10</span>
						</a>
					</li>		
					<!-- 컨텐츠하나 ---------------------- // -->
					<li>
						<a href="https://otalk.kbstar.com/quics?page=C019391&amp;bbsMode=view&amp;articleId=18991&amp;QSL=F">
							<span>은행업무 이제 집에서 편하게 보세요! </span>
							<!-- <em class="icon-new">[NEW]</em>-->
							<span>03.05</span>
						</a>
					</li>		
					<!-- 컨텐츠하나 ---------------------- // -->
					<li>
						<a href="https://otalk.kbstar.com/quics?page=C019391&amp;bbsMode=view&amp;articleId=18963&amp;QSL=F">
							<span>대구·경북지역 영업점 영업시간 변경 안내</span>
							<!-- <em class="icon-new">[NEW]</em>-->
							<span>03.02</span>
						</a>
					</li>	
					<!-- ---------------------------------- // -->
				</ul>
				<a href="https://otalk.kbstar.com/quics?page=C019391&amp;QSL=F" class="sub" title="새소식 바로가기">바로가기</a>
			</div>

			<!-- ################################## -->
			<!-- 이벤트 -->
			<!-- ################################## -->
			<div class="section">
				<h2>추가예정</h2>
				<ul class="list-board">
						<!-- 컨텐츠하나 ---------------------- // -->
                    <li>
						<a href="https://omoney.kbstar.com/quics?page=C016559&amp;cc=b033091:b032977&amp;%EC%9D%B4%EB%B2%A4%ED%8A%B8%EC%9D%BC%EB%A0%A8%EB%B2%88%ED%98%B8=312264&amp;QSL=F">
							<span>「Happy Home, Happy Money」 편하게 집에서 주택청약종합저축 신규가입하고 해피머니 받자!!</span>
                            <em class="icon-new">[NEW]</em>
							<span>04.06 ~ 04.30</span>
						</a>
					</li>
					
					<!-- 컨텐츠하나 ---------------------- // -->
                    <li>
						<a href="https://omoney.kbstar.com/quics?page=C016559&amp;cc=b033091:b032977&amp;%EC%9D%B4%EB%B2%A4%ED%8A%B8%EC%9D%BC%EB%A0%A8%EB%B2%88%ED%98%B8=312154&amp;QSL=F">
							<span>앵콜! 내 경품 내가 고르는! KB오픈뱅킹 신규 가입 이벤트</span>
                            <em class="icon-new">[NEW]</em>
							<span>04.01 ~ 05.15</span>
						</a>
					</li>

					<!-- 컨텐츠하나 ---------------------- // -->
					<li>
						<a href="https://omoney.kbstar.com/quics?page=C016559&amp;cc=b033091:b032977&amp;%EC%9D%B4%EB%B2%A4%ED%8A%B8%EC%9D%BC%EB%A0%A8%EB%B2%88%ED%98%B8=311855&amp;QSL=F">
							<span>KB 대기시간 ‘제로(0)’ 프로젝트 “KB의 디지털서비스로 나의 시간을 혁신하다”</span>
                            <!--<em class="icon-new">[NEW]</em>-->
							<span>03.27 ~ 06.30</span>
						</a>
					</li>
					
				
					<!-- ---------------------------------- // -->
				</ul>
				<a href="https://omoney.kbstar.com/quics?page=oevent&amp;QSL=F" class="sub" title="이벤트 바로가기">바로가기</a>
			</div>
			<!-- ################################## -->
		</div>
<!-- Main View 끝 -->

</body>
</html>