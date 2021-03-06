<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Sambank Login</title>
<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!--Custom styles-->
<link rel="stylesheet" type="text/css" href="styles.css">
<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<style>
/* Made with love by Mutiullah Samim*/


@import url('https://fonts.googleapis.com/css?family=Numans');
/* login background */
html,body{
background-image: url("/resources/SB_files/LoginBackground3.png");
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

.container{
height: 100%;
align-content: center;
}

.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}
.card-footer a  {
color: #fff;
}
#error_card{
	background-image: none;
	display: inline-block;
    font-weight: 400;
    text-align: center;
    vertical-align: middle;
    user-select: none;
    border: 1px solid yellow;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
}
#sambankBtn{
	color:#ffffff;
	text-decoration: none;
	font-size:0.8em;
}
#sambankBtn:hover{
	color:#ffffff;
}
</style>

</head>
<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>로그인 <a href="/" id="sambankBtn">SamBank </a></h3>
				<!-- <div class="d-flex justify-content-end social_icon"> -->
<!--                소셜네트워크 아이콘
 					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span> -->
				<!-- </div> -->
			</div>
			<div class="card-body">
				<sec:authorize access="isAnonymous()">
					<c:url value="/member/login_process" var="loginUrl" />
					<form:form name="f" action="${loginUrl}" method="POST" id="loginForm">
						
						
						<div class="input-group form-group">
							<!-- <div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div> -->
							<input type="text" class="form-control" placeholder="ID" name="id" id="id">
							
						</div>
						<div class="input-group form-group">
							<!-- <div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div> -->
							<input type="password" class="form-control" placeholder="password" name="password" id="password">
						</div>
						
						<div class="form-group">
							<input type="submit" value="로그인" class="btn float-right login_btn" id="loginBtn">
						</div>
						<c:if test="${verified == 'false'}"> 
							<div class="form-group">
								<input type="button" value="인증메일 재전송" class="btn float-right btn-primary" id="resendBtn">
							</div>
						</c:if>
						
						<input type="hidden" id="Captcha_res" name="Captcha_res" value="${capcha_res }"/>
					</form:form>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
		        	<div class="d-flex justify-content-center">
			        <form:form action="${pageContext.request.contextPath}/member/logout" method="POST" id="logoutForm">
			        	<a href="#" id="logoutBtn" class="btn login_btn"><c:out value="로그아웃"></c:out> </a>
		      		</form:form>
		      		</div>
	      		</sec:authorize>
			</div>
			<div class="card-footer" style=" color: #fff">
				<sec:authorize access="isAnonymous()">
					<div class="d-flex justify-content-center links">
						<a href="/register/agree">회원가입</a>
					</div>
					<div class="d-flex justify-content-center">
						<a href="/findpass">비밀번호 찾기</a>
					</div>
					<div class="d-flex justify-content-center">
						<a href="/admin/login">관리자 페이지 이동(테스트용)</a>
					</div>
				</sec:authorize>
		        
			</div>
		</div>
	</div>
</div>

<div class="toast col-3 btn btn-outline-warning fixed-top" role="alert" aria-live="assertive" aria-atomic="true" data-animation="true" data-autohide="true" data-delay="5000" id="error_card" style="z-index:2147483647;background-color:#ffffff;margin:auto;white-space:normal;display:none">
  <div class="toast-header">
  	<p style="font-size:1.2em;color:#000000"><strong>알림</strong></p>    
  </div>
  <div class="toast-body" style="text-align:left">
	<c:if test="${param.logout != null}"> 
		<p><small style="color:blue">로그아웃 하였습니다.</small></p> 
	</c:if>
	<c:if test="${id == 'not_found'}"> 
		<p><small style="color:red">아이디를 찾을 수 없습니다.</small></p> 
	</c:if>
	<c:if test="${param.error == 'failed' && enabled!='false' && id != 'not_found' && verified != 'false'}"> 
		<p><small style="color:red">로그인에 실패했습니다.<br> 5회 연속 실패할 경우 계정이 비활성화 되며<br> 24시간 이후에 접속할 수 있습니다. 현재 : <strong><c:out value="${failed_login_count } 회"></c:out></strong></small></p> 
	</c:if> 
	<c:if test="${enabled == 'false'}"> 
		<p><small style="color:red">계정이 비활성화 상태입니다.<br>24시간 뒤에 접속해 주세요.</small></p>
	</c:if> 
	<c:if test="${verified == 'false'}"> 
		<p><small style="color:red"><c:out value="${email }"></c:out> 이메일로 인증코드를 보내드렸습니다. 이메일 인증이 완료되면 로그인이 활성화됩니다. </small></p>
	</c:if> 
  </div>
</div>
<c:set var="reCAPTCHA_site_key" value="6LenvvQUAAAAAF-uMCecO_OEpuneIjZavJrRhYb2" />
<script src="https://www.google.com/recaptcha/api.js?render=${reCAPTCHA_site_key}"></script>

<script>
$(function(){
	let param_logout = "${param.logout != null}";
	let param_id = "${id}";
	let param_error = "${param.error}";
	let param_enabled = "${enabled}";
	let param_count = "${failed_login_count }";
	let param_count_total = "${failed_login_count_total }";
	let param_verified = "${verified}";
	let cap_token = "";
	let sended = "";
	let hn = "${_csrf.headerName}";
	let tk = "${_csrf.token}"
	if(param_logout==="true" || param_id==="not_found" || (param_error==="failed"&&param_count!="") || param_enabled==="false" || param_verified==="false"){
		$("#error_card").css("display","inline-block");
		$("#error_card").toast("show");
	}

	
	$("#loginBtn").click(function(e){
		e.preventDefault();
		if($("#id").val()=="" || $("#id").val()==null){
			$(".toast-body").html("<p><small style='color:red'>아이디를 입력해주세요.</small></p>");
			$("#error_card").css("display","inline-block");
			$("#error_card").toast("show");
			return false;
		}
		if($("#password").val()==""||$("#password").val()==null){
			$(".toast-body").html("<p><small style='color:red'>비밀번호를 입력해주세요.</small></p>");
			$("#error_card").css("display","inline-block");
			$("#error_card").toast("show");
			return false;
		}
		if($("#Captcha_res").val()==="false"){
			$(".toast-body").html("<p><small style='color:red'>비 정상적인 요청으로 차단되었습니다.<br>브라우저를 닫고 다시 접속해 주세요.</small></p>");
			$("#error_card").css("display","inline-block");
			$("#error_card").toast("show");
			return false;
		}
		if(cap_token===""){
			alert("오류가 발생했습니다. 나중에 다시 시도해 주세요.")
			return false;
		}
		$.ajax({
			url : '/check_recapcha',
			dataType : 'text',
			data :{
				token : cap_token
			},
			beforeSend : function(xhr)
            {   
                xhr.setRequestHeader(hn, tk);
            },
			async : false,
			type : 'post',
			success : function(result){
				if(result==="false"){
					$("#Captcha_res").val("false");
				}
			}
		
		})
		if($("#Captcha_res").val()==="false"){
			$(".toast-body").html("<p><small style='color:red'>비 정상적인 요청으로 차단되었습니다.<br>브라우저를 닫고 다시 접속해 주세요.</small></p>");
			$("#error_card").css("display","inline-block");
			$("#error_card").toast("show");
			return false;
		}
		$("#loginForm").submit();
	})
	
	
	$("#logoutBtn").click(function(e){
		e.preventDefault();
		
		
		$("#logoutForm").submit();
		
	})
	
	
	$("#resendBtn").click(function(e){
		e.preventDefault();
		if($("#id").val()=="" || $("#id").val()==null){
			$(".toast-body").html("<p><small style='color:red'>아이디를 입력해주세요.</small></p>");
			$("#error_card").css("display","inline-block");
			$("#error_card").toast("show");
			return false;
		}
		if($("#password").val()==""||$("#password").val()==null){
			$(".toast-body").html("<p><small style='color:red'>비밀번호를 입력해주세요.</small></p>");
			$("#error_card").css("display","inline-block");
			$("#error_card").toast("show");
			return false;
		}
		
		if(sended === "true"){
			alert("요청이 이미 완료되었습니다.");
			return false;
		}
		
		$.ajax({
			url : '/resend_verify',
			dataType : 'text',
			data :{
				id : $("#id").val(),
				password : $("#password").val()
			},
			beforeSend : function(xhr)
            {   
                xhr.setRequestHeader(hn, tk);
            },
			async : false,
			type : 'post',
			success : function(result){
				
				if(result === "success"){
					sended = "true";
					alert("${email} 메일로 인증코드를 전송했습니다.");
				}else if(result === "muchsend"){
					alert("너무 많은 요청으로 거절되었습니다. 잠시 후 다시시도하세요.")
				}else if(result === "failed" || result === "not_found"){
					alert("아이디와 비밀번호가 일치하지 않습니다.");
				}else{
					alert("요청이 실패했습니다.");
				}
				
			}
		
		})
		
		
		
		
	})
	
	
	
	
	
	grecaptcha.ready(function() {
	    grecaptcha.execute('${reCAPTCHA_site_key}', {action: 'login'}).then(function(token) {
	  	 cap_token=token;
	    });
	});
})

</script>
</body>
</html>
<%
	session.removeAttribute("id");
	session.removeAttribute("enabled");
	session.removeAttribute("capcha_res");
	session.removeAttribute("verified");
	session.removeAttribute("failed_login_count");
%>