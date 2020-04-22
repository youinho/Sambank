<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>
<!doctype html>
<ul class="loginTab">
	<!-- [T] 공인인증서 -->
	<li class="active" id="certtab"> <!-- @ 활성화 class="active" -->
		<a href="#certtabCont" class="atit"><span class="readonly">현재 선택 메뉴</span>공인인증서</a>
		<div class="tabCon" id="certtabCont">
			<div class="area1">
				<button type="button" class="btn" onclick="KB_CertLogin('PC');" title="새창">공인인증서 로그인</button>
				<button type="button" class="btn" id="useHtml5" onclick="KB_CertLogin('G4');" title="새창">브라우저인증서 로그인</button>
			</div>
			<div class="area2">
				<a href="javascript:goPage(1);" class="btn ic1">공인인증센터</a>
				<a href="javascript:goPage(12);" class="btn ic2" title="새창">브라우저인증서 안내</a>
			</div>
			<div class="area3">
				<a href="javascript:goPage(2);" class="btn">인증서발급/재발급</a>
				<a href="javascript:goPage(3);" class="btn">타행/타기관인증서등록</a>
				<button type="button" class="btn" onclick="Delfino.manageCertificate();" title="새창">인증서관리</button>
			</div>
		</div>
	</li>

	<!-- [T] 휴대폰연동로그인 -->

	<li id="Etctab" class="">
		<a href="#EtctabCont" class="atit">스마트폰 인증</a>
		<div class="tabCon" id="EtctabCont">
			<ul class="info_n">
		<li>
			<a href="#" class="ic1" onclick="KB_CertLogin('18');return false;">
               <p>KB모바일인증서</p>
               공인인증서, 보안카드/OTP없이<br> KB모바일인증서로 어느 PC에서나 인증 OK!
			</a>
		</li>
		<li>
			<a href="#" class="ic2" onclick="KB_CertLogin('17');return false;">
               <p>공인인증서<br><small>(KB스타뱅킹 연동인증)</small></p>
			내 휴대폰에 있는 공인인증서로<br>어느 PC에서나 인증 OK!

			</a>
		</li>
		<li>
			<a href="#" class="ic3" onclick="KB_CertLogin('12_PC');return false;">
               <p>KB든든간편인증</p>
			공인인증서, 보안카드/OTP없이<br>휴대폰으로 간편하게 로그인!
			</a>
		</li>
		<li>
			<a href="#" class="ic4" onclick="KB_CertLogin('15');return false;">
               <p>뱅크사인</p>
			블록체인기술 기반 서비스로<br>더욱 안전하고 편리하게 인증! 
			</a>
		</li>
	</ul>
	<div class="area4" style="text-align:right;">
	  
		<a href="javascript:goPage(13);">스마트폰을 이용한 인증 안내</a>
	</div>	
		</div>
	</li>

	<!-- [T] 아이디로그인 -->
	<li id="idtab">
		<a href="#idtabCont" class="atit">아이디</a>
		<div class="tabCon" id="idtabCont">
			<!-- ### 입력폼 ### -->
			<fieldset class="form">
				<legend>개인고객을 위한 아이디 로그인</legend>
				<!-- # 아이디 # -->
				<label for="txtWWWBnkgLginID">아이디</label>
				<input type="text" class="input" id="txtWWWBnkgLginID" name="txtWWWBnkgLginID" value="" title="영문,숫자,영문/숫자 조합(6~12자)" placeholder="아이디" maxlength="12" onblur="this.value=this.value.toUpperCase();" style="ime-mode:inactive">

				<!-- # 사용자암호 # -->
				<label for="LoginPassword">사용자암호</label>
				<input type="password" class="input nppfs-npv" id="LoginPassword" name="LoginPassword" value="" title="숫자(6~8자),영문,영문/숫자조합(6~12자)" placeholder="사용자암호" maxlength="12" style="ime-mode:disabled" npkencrypt="on" data-keypad-useyn-type="checkbox" data-keypad-useyn-input="nProtectUseYn1" data-keypad-theme="default" data-keypad-type="alpha" data-keypad-toggle-active="true" data-keypad-input-range="upper" readonly="" nppfs-keypad-uuid="nppfs-keypad-LoginPassword">

				<!-- # 주민등록번호 # -->
				<div id="userNumber" style="display:none;">
					<p class="caution">입력예시:1981년 2월 1일인 경우 810201</p>
					<label for="주민등록번호1">생년월일</label>
					<input type="text" class="input" id="주민등록번호1" name="주민등록번호1" title="주민등록번호 앞 6자리 입력" placeholder="생년월일" maxlength="6" style="ime-mode:inactive;" onkeyup="caq.util.formInputControl('주민등록번호1', 1);">
				</div>

				<!-- # 마우스영역 # -->
				<div class="mouse">
					<!-- @마우스입력기 접근성 수정대응 -->
					<dl class="vn">
						<dt>마우스입력기 안내</dt>
						<dd>마우스입력기는 다음에 이어지는 마우스입력 체크박스에 관한 안내 사항입니다.</dd>
						<dd>마우스입력기능은 금감원의 감독규제 제34호 제2항에 따라 적용된 보안 기술로 키보드로의 접근성을 지원하지 않습니다.</dd>
					</dl>
					<!-- // -->

					<input type="checkbox" class="nProtectUseYn" id="nProtectUseYn1" name="nProtectUseYn1" value="Y" data-keypad-focus-field="LoginPassword" checked="checked">
					<label for="nProtectUseYn1">마우스로 입력</label>
				</div>

               <!-- # 자동입력방지 영역 # -->
				<div class="con" id="img_captcha" style="display:none">
					<div class="img"><img src="" id="wc_image" alt="자동입력방지를 위한 숫자"></div>
					<div class="area5">
						<button type="button" class="ic1" onclick="wc_image_load()">새로고침</button>
						<button type="button" class="ic2" onclick="wc_audio_load()">음성듣기</button>
					</div>
					<label for="autonum">자동입력방지를 위해 이미지의 숫자를 입력해주세요.</label>
					<input type="tel" class="input" id="autonum" value="" placeholder="자동입력방지를 위해 이미지의 숫자를 입력해주세요." onkeyup="caq.util.formInputControl('autonum', 1);" name="autonum">
				</div>
				<!--audio id="wc_audio" src="/quics?asfilecode=825155&amp;t=s&amp;LANG_TYPE=ENG" type="audio/wav"/-->
				<audio id="wc_audio" src="/quics?asfilecode=825155&amp;t=s" type="audio/wav"></audio>
				<!-- # 자동입력방지 영역 # -->  
				
				<!-- # 로그인버튼 # -->
				<button type="button" class="login" id="idLoginBtn" onclick="onCheckLogin();">로그인</button>
			</fieldset>

			<!-- ### 버튼영역 ### -->
			<div class="area3">
				<a href="javascript:goPage(4);" class="btn">아이디 조회</a>
				<a href="/quics?page=C055674" class="btn">사용자암호변경/재등록</a>
				<a href="/quics?page=C019875" class="btn">회원가입</a>
			</div>
		</div>
	</li>
</ul>