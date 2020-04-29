<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Sam Bank</title>
<link rel="stylesheet" href="/resources/bootstrap/bootstrap.css" />
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
    background-color: #b5fdba;
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
  .swiper-slide.swiper-slide-active {
    background-color: #b5fdba;
  }
</style>


</head>
<body>
	<div id="Main">
		<div id="header" class="headerWrap" >
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<!-- Header function var -->
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
			<nav class="navbar navbar-expand-lg navbar navbar-light " style="background-color: #b5fdba;" >
			
				<div id="Logo">  
				  <strong><img src="/resources/SB_files/SamBank Image Logo.png" alt="로고 이미지"></strong>
				  <a class="navbar-brand" src="/resources/SB_files/SamBank Image Logo.png" href="#"></a>
				</div>
				<!-- Logo 끝내는 부분 -->
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  	</button>
			  <div class="collapse navbar-collapse" id="navbarNavDropdown">
			 <!--  nav bar 오른쪽 정렬 -->
			  <h2>${info.id }</h2>
			<c:choose>
  			<c:when test="${empty info }">
		      	<ul class="navbar-nav ml-auto" style="font-family:'견고딕';" >
			  		<li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          로그인 관련창
			        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="#">로그인후 보여주기</a>
				          <a class="dropdown-item" href="#">프로필 관리</a>
				          <a class="dropdown-item" href="#">개인정보수정</a>
				          <a class="dropdown-item" href="#">로그아웃</a>
				        </div>
					</li>
			</c:when>
			<c:otherwise>
					<li class="nav-item active">
					  <a class="nav-link" href="#">회원가입</a>
					</li>
					<li class="nav-item active">
					  <a class="nav-link" href="#">로그인</a>
					</li>
			</c:otherwise>	
			</c:choose>
					<li class="nav-item active">
					  <a class="nav-link" href="#">개인</a>
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
					<li class="nav-item active">
					  <a class="nav-link" href="#">추가 예정</a>
					</li>
			  	</ul>
			  </div>
			</nav>
			<!-- navbar 끝내는 부분 -->
		</div> 

		<!-- header,headerWrap 끝나는부분 -->	
		
		
		
		<!-- 스위퍼 시작부분 -->
		<div class="Swiper">
			<!-- Swiper -->
			  <div class="swiper-container">
			    <div class="swiper-wrapper" >
							<div class="swiper-slide"  >
							<!--  컨텐츠 - 1 -->
							<li >
								<div>
									<strong><img src="/resources/SB_files/visual_section16_tit01.png" alt="SB오픈뱅크 서비스"></strong><br/><br/>
									<span>
									<img src="/resources/SB_files/visual_section16_tit02.png" alt="나의 모든 금융생활을 SB뱅크 한 곳에서!" style="margin-top:20px;">
									</span><br/>
									<a href="" class="link" style="margin-left: 700px;">바로가기</a>
								</div>
							</li>
							</div>
							<div class="swiper-slide">
							<!-- 컨텐츠 - 2 -->
									<li class="wrap-visual.active2">
									<div>
										<strong><img src="/resources/SB_files/visual_section25_tit01.png" alt="통신비 계획이 다 있구나! 반값이라니!"></strong><br />
										<span><img src="/resources/SB_files/visual_section25_tit02.png" alt="Liiv M LTE 무제한(11GB+) 22,000원!"
										style="margin-top: 25px;margin-bottom: 25px;">
										</span><br />
										<a href="" class="link"style="margin-left: 600px;">바로가기</a>
									</div>
									</li>
							</div>
							<div class="swiper-slide">	
							<!-- 컨텐츠 - 3 -->
									<li class="wrap-visual.active3">
									<div>
										<strong><img src="/resources/SB_files/visual_section10_tit01.png" alt="언제 어디서나 빠르고 쉽게 외환도 역시 SB!"></strong>
										<span><img src="/resources/SB_files/visual_section10_tit02.png" alt="외화 환전 최대 90% 환율우대 (별도 통보시까지)"></span><br />
										<a href="" class="link"style="margin-left: 500px;">바로가기</a>
									</div>
									</li>
							</div>
							<div class="swiper-slide">
							<!-- 컨텐츠 - 4 -->
									<li class="wrap-visual.active4">
									<div>
										<strong><img src="/resources/SB_files/visual_section5_tit01.png" alt="SB모바일인증서" 
										style="margin-right: 200px;">
										</strong><br />
										<span><img src="/resources/SB_files/visual_section5_tit02.png"
										style="margin-left: 500px;maring-bottom: 25px"
										alt="모든 금융거래의 시작&lt;br/&gt;이제는 평생, 쉽게, 안전하게 사용하세요!"
										>
										</span><br/><br />
										<a href="" class="link" style="margin-left: 400px;" >바로가기</a>
									</div>
									</li>
							</div>
							<div class="swiper-slide">
							<!-- 컨텐츠 - 5 -->
									<li class="wrap-visual.active5">
									<div>
										<strong><img src="/resources/SB_files/visual_section18_tit01.png" alt="늘 곁에, 더 가까이 SB은행"></strong>
										<span><img src="/resources/SB_files/visual_section18_tit021.png" alt="일상의 쉼표가 필요한 순간, SB은행과 함께 하세요."
										style="margin-left: 100px;">
										</span>
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
		
		
	</div>
	<!-- Main 끝나는부분 -->
	
	
	
	
	 <!-- link var 시작 -->
	<div class="main-section main-con1">
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<!-- 빠른메뉴 -->
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->	
			<ul class="menu1">
				<li><a href="account" class="q1">전체계좌조회</a></li>
				<li><a href="" class="q2">계좌이체</a></li>
				<li><a href="" onclick="" title="새창 열기">빠른조회</a></li>
			</ul>
			<ul class="menu2">
				<li><a href="">카드</a></li>
				<li><a href="">보안센터</a></li>
				<li><a href="">자료실</a></li>
				<li><a href="">문의사항</a></li>
				<li><a href="/login">로그인</a></li>
				<li><a href="">추가예정</a></li>
			</ul>
	</div>
	 <!-- link var 끝 -->
	
	
	
	
	<!-- 뉴스 페이지 시작 -->
	<div class="main-section main-con2">
	<!-- //////////////////////////////////////////////////////////////////////////////////// -->
	<!-- 새소식, 이벤트 -->
	<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<div class="section">
		<!-- 새소식 시작하는 부분 -->
		<h2>새소식</h2>
				<ul class="list-board">
					<!-- 새소식 컨텐츠 - 1 -->
					<li>
						<a href="">
							<span>코로나19 관련 해킹 등 피해예방 수칙 안내</span>
                             <em> New </em>
							<span>05.10</span>
						</a>
					</li>		
					<!-- 새소식 컨텐츠 - 2 -->
					<li>
						<a href="">
							<span>은행업무 이제 집에서 편하게 보세요! </span>
                             <em> New </em>
							<span>05.05</span>
						</a>
					</li>		
					<!-- 새소식 컨텐츠 - 3 -->
					<li>
						<a href="">
							<span>대구·경북지역 영업점 영업시간 변경 안내</span>
                             <em>New </em>
							<span>05.02</span>
						</a>
					</li>	
					<!-- 새소식 컨텐츠 끝 -->
				</ul>
				<a href="" class="sub" title="새소식 바로가기">바로가기</a>
			</div>
			<!-- 새 소식 끝나는 부분 -->



	<!-- ################################## -->
	<!-- 이벤트 -->
	<!-- ################################## -->
		<div class="section">
		<!-- 이벤트 시작하는 부분 -->
		<h2>이벤트</h2>
			<ul class="list-board">
				<!-- 이벤트 컨텐츠 - 1 -->
                <li>
					<a href="">
						<span>「Happy Home, Happy Money」 편하게 집에서 주택청약종합저축 신규가입하고 해피머니 받자!!</span>
                             <em> New </em>
						<span>05.06 ~ 05.30</span>
					</a>
				</li>
				<!-- 이벤트 컨텐츠 - 2 -->
                <li>
					<a href="">
						<span>앵콜! 내 경품 내가 고르는! KB오픈뱅킹 신규 가입 이벤트</span>
                             <em> New </em>
						<span>06.01 ~ 06.15</span>
					</a>
				</li>
				<!-- 이벤트 컨텐츠 - 3 -->
                <li>
					<a href="">
						<span>SB 대기시간 ‘제로(0)’ 프로젝트 “SB의 디지털서비스로 나의 시간을 혁신하다”</span>
                             <em> New </em>
						<span>05.27 ~ 06.30</span>
					</a>
				</li>
			</ul>
			<!-- 이벤트 컨텐츠 끝 -->
			<a href="" class="sub" title="이벤트 바로가기">바로가기</a>
		</div>
		<!-- 이벤트 끝나는 부분 -->
			
	</div>
	<!-- 새소식,이벤트 페이지 끝 -->
	
	
	
	
	<div class="main-section main-con122">
		<div class="section">
		<!-- ################################## -->
		<!-- 공지사항 -->
		<!-- ################################## -->		
			<h2>공지사항</h2>
			<ul class="list-board">
				<!-- 공지사항 컨텐츠 - 1 -->
					<li>
						<a href="">
							<span>공지사항 관련 내용</span>
							<!-- <em class="icon-new">[NEW]</em>-->
							<span>날짜 부분</span>
						</a>
					</li>
				<!-- 공지사항 컨텐츠 - 2 -->
					<li>
						<a href="">
							<span>공지사항 관련 내용</span>
							<!-- <em class="icon-new">[NEW]</em>-->
							<span>날짜 부분</span>
						</a>
					</li>		
				<!-- 공지사항 컨텐츠 - 3 -->
					<li>
						<a href="">
							<span>공지사항 관련 내용</span>
							<!-- <em class="icon-new">[NEW]</em>-->
							<span>날짜 부분</span>
						</a>
					</li>				
			</ul>
			<!-- 공지사항 컨텐츠 끝 -->
			<a href="" class="sub" title="공지사항 바로가기">바로가기</a>
		</div>
		<!-- 공지사항 끝 부분 -->
		
		
		
		<div class="section">
		<!-- ################################## -->
		<!-- 추가사항 -->
		<!-- ################################## -->		
			<h2>추가사항</h2>
			<ul class="list-board">
				<!-- 추가사항 컨텐츠 - 1 -->
					<li>
						<a href="">
							<span>추가사항 관련 내용</span>
							<!-- <em class="icon-new">[NEW]</em>-->
							<span>날짜 부분</span>
						</a>
					</li>
				<!-- 추가사항 컨텐츠 - 2 -->
					<li>
						<a href="">
							<span>추가사항 관련 내용</span>
							<!-- <em class="icon-new">[NEW]</em>-->
							<span>날짜 부분</span>
						</a>
					</li>		
				<!-- 추가사항 컨텐츠 - 2 -->
					<li>
						<a href="">
							<span>추가사항 관련 내용</span>
							<!-- <em class="icon-new">[NEW]</em>-->
							<span>날짜 부분</span>
						</a>
					</li>	
			</ul>
			<a href="" class="sub" title="추가사항 바로가기">바로가기</a>
			<!-- 추가사항 컨텐츠 끝 -->
		</div>
		<!-- 추가사항 끝 부분 -->
		
		
		
	</div>
	<!-- 공지사항,추가사항 페이지 끝 -->


	
		
</body>	





</html>