<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header_Main.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sambank main page</title>
</head>
<body>

<div id="tip">
	<h2>Main Image Page 이나 고려중</h2>
</div>


<div id="MainImage">

<h2>Main Image Page</h2>
	<!-- Main Image  -->
		<div id="content" class="contentWrap">
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<!-- 상단 비주얼영역 -->
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<div class="wrap-visual active1">
			<!-- ################################## -->
			<!-- 슬라이더 : 컨텐츠 -->
			<!-- ################################## -->
			<div class="area-con">
				<ul>
					<!-- 컨텐츠하나 오픈뱅킹 ---------------------- // -->
					<li class="section section11 on">
						<div>
							<strong><img src="../KB_files/visual_section16_tit01.png" alt="KB오픈뱅킹 서비스"></strong>
							<span><img src="./KB_files/visual_section16_tit02.png" alt="나의 모든 금융생활을 KB스타뱅킹 한 곳에서!"></span>
							<a href="https://obank.kbstar.com/quics?page=C066016" class="link">바로가기</a>
						</div>
					</li>
					
					<!-- 컨텐츠하나 LiivM  4/1 오픈 ---------------------- // -->
					<li class="section section12">
						<div>
							<strong><img src="./KB_files/visual_section25_tit01.png" alt="통신비 계획이 다 있구나! 반값이라니!"></strong>
							<span><img src="./KB_files/visual_section25_tit02.png" alt="Liiv M LTE 무제한(11GB+) 22,000원!"></span>
							<a href="https://omoney.kbstar.com/quics?page=C016559&amp;cc=b033091:b032977&amp;%EC%9D%B4%EB%B2%A4%ED%8A%B8%EC%9D%BC%EB%A0%A8%EB%B2%88%ED%98%B8=311956&amp;QSL=F" class="link">바로가기</a>
						</div>
					</li>

					<!-- 컨텐츠하나 환전  ---------------------- // -->
					<li class="section section10">
						<div>
							<strong><img src="./KB_files/visual_section10_tit01.png" alt="언제 어디서나 빠르고 쉽게 외환도 역시 KB!"></strong>
							<span><img src="./KB_files/visual_section10_tit02.png" alt="외화 환전 최대 90% 환율우대 (별도 통보시까지)"></span>
							<a href="https://okbfex.kbstar.com/quics?page=C015719" class="link">바로가기</a>
						</div>
					</li>
					
					<!-- 컨텐츠하나 KB모바일인증서 ---------------------- // -->
					<li class="section section5">
						<div>
							<strong><img src="../KB_files/visual_section5_tit01.png" alt="KB모바일인증서"></strong>
							<span><img src="../KB_files/visual_section5_tit02.png" alt="모든 금융거래의 시작&lt;br/&gt;이제는 평생, 쉽게, 안전하게 사용하세요!"></span>
							<a href="https://otalk.kbstar.com/quics?page=C063974&amp;QSL=F" class="link">바로가기</a>
						</div>
					</li>
					
					<!-- 컨텐츠하나 2020 봄 ---------------------- // -->
					<li class="section section6">
						<div>
							<strong><img src="../KB_files/visual_section18_tit01.png" alt="늘 곁에, 더 가까이 KB국민은행"></strong>
							<span><img src="../KB_files/visual_section18_tit021.png" alt="일상의 쉼표가 필요한 순간, KB국민은행과 함께 하세요."></span>
						</div>
					</li>
					<!-- ------------------------------------// -->

				</ul>
			</div>
			<!-- ################################## -->
			<!-- 슬라이더 : 컨트롤 -->
			<!-- ################################## -->
			<div class="area-control">
				<button class="ui-btn before btn-off">이전</button>
				<ul>
					<li class="on"><a href="https://www.kbstar.com/#" class="on" title="선택됨">KB국민은행 오픈뱅킹</a></li>
					<li><a href="https://www.kbstar.com/#" title="" class="">LTE무제한요금제 1년동안 월 22,000원</a></li>
					<li><a href="https://www.kbstar.com/#" title="" class="">언제 어디서나 빠르고 쉽게 외환도 역시 KB!</a></li>
					<li><a href="https://www.kbstar.com/#" title="" class="">KB모바일인증서</a></li>
					<li><a href="https://www.kbstar.com/#" title="" class="">늘 곁에, 더 가까이 KB국민은행</a></li>
				</ul>
				<button class="ui-btn play off">자동재생시작</button>
				<button class="ui-btn stop">자동재생멈춤</button>
				<button class="ui-btn next">다음</button>
			</div>
			<!-- ################################## -->
			<!-- 브랜드스토리보기 -->
			<!-- ################################## -->
			<div class="area-aside">
				<a href="https://www.kbstar.com/#" class="ui-btn-brand" id="uiBtnBrand">KB브랜드 스토리 보기</a>
			</div>
			<!-- ################################## -->
		</div>

		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<!-- 빠른메뉴 -->
		<!-- //////////////////////////////////////////////////////////////////////////////////// -->
		<div class="main-section main-con1">
			<h2 class="blind">빠른메뉴</h2>
			<ul class="menu1">
				<li><a href="https://obank.kbstar.com/quics?page=C019088&amp;QSL=F" class="q1">전체계좌조회</a></li>
				<li><a href="https://obank.kbstar.com/quics?page=C018393&amp;QSL=F" class="q2">계좌이체</a></li>
				<li><a href="https://www.kbstar.com/#" onclick="openPopup(&#39;https://obank.kbstar.com/quics?page=C025255&amp;cc=b028364:b028702&amp;QSL=F&#39;,&#39;빠른조회&#39;,&#39;720&#39;,&#39;650&#39;); return false;" title="새창 열기">빠른조회</a></li>
			</ul>
			<ul class="menu2">
				<li><a href="https://obank.kbstar.com/quics?page=osecure&amp;QSL=F">보안센터</a></li>
				<li><a href="https://otalk.kbstar.com/quics?page=omember&amp;QSL=F">고객우대제도</a></li>
				<li><a href="https://obank.kbstar.com/quics?page=C036336&amp;QSL=F">소비자정보포털</a></li>
				<li><a href="https://obank.kbstar.com/quics?page=C029656&amp;QSL=F">상담/예약</a></li>
				<li><a href="https://obank.kbstar.com/quics?page=C022180&amp;QSL=F">상품공시실</a></li>
			</ul>
		</div>
</div>	





<div id="linkbar">
	<ul id="linkbar">
		<div>
			<h3>link bar</h3>
				<h4><a href="/board/list">전체 계좌 조회</a></h4>
				<h4><a href="/board/list">계좌 이체</a></h4>
				<h4><a href="/board/list">빠른 조회</a></h4>
				<h4><a href="/board/list">보안 센터</a></h4>
				<h4><a href="/board/list">자료실</a></h4>
				<h4><a href="/board/list">문의사항</a></h4>
		</div>
	</ul>
</div>


<div id="mainMessageview">
	<ul id="mainMessageview">
		<h3>Main Message View</h3>
		<div name="New" id="New">
			<h4><a href="/board/list">New</a></h4>
		</div>
		<div name="Notice" id="Notice">
			<h4><a href="/board/list">Notice</a></h4>
		</div>
		<div name="event" id="event">
			<h4><a href="/board/list">event</a></h4>
		</div>
		<div name="Installment savings" id="Installmentsavings">
			<h4><a href="/board/list">Installment savings</a></h4>
		</div>
	</ul>
</div>

</body>
</html>