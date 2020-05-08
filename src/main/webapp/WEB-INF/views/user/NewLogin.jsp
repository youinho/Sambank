<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!--Custom styles-->
<link rel="stylesheet" type="text/css" href="styles.css">
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
</style>

</head>
<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>로그인</h3>
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
					<form name="f" action="${loginUrl}" method="POST">
						
						<c:if test="${param.logout != null}"> 
			            	<p><small style="color:blue">로그아웃 하였습니다.</small></p> 
			            </c:if>
			            <c:if test="${id == 'not_found'}"> 
			            	<p><small style="color:red">아이디를 찾을 수 없습니다.</small></p> 
			            </c:if>
			            <c:if test="${param.error == 'failed' && enabled!='false' && id != 'not_found'}"> 
			            	<p><small style="color:red">로그인에 실패했습니다. 5회 연속 실패할 경우 계정이 비활성화 됩니다. 현재 : <strong><c:out value="${failed_login_count } 회"></c:out></strong></small></p> 
			            </c:if> 
			            <c:if test="${enabled == 'false'}"> 
			            	<p><small style="color:red"><c:out value="계정이 비활성화 상태입니다. 관리자에게 문의해주세요."></c:out></small></p> 
			            </c:if> 
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
						<div class="row align-items-center remember">
							<input type="checkbox">로그인 기록
						</div>
						<div class="form-group">
							<input type="submit" value="로그인" class="btn float-right">
						</div>
					</form>
				</sec:authorize>
			</div>
			<div class="card-footer" style=" color: #fff">
				<sec:authorize access="isAnonymous()">
					<div class="d-flex justify-content-center links">
						<a href="#">회원가입</a>
					</div>
					<div class="d-flex justify-content-center links">
						<a href="#">아이디 찾기</a>
					</div>
					<div class="d-flex justify-content-center">
						<a href="#">비밀번호 찾기</a>
					</div>
				</sec:authorize>
		        <sec:authorize access="isAuthenticated()">
		        	<div class="d-flex justify-content-center">
			        <form:form action="${pageContext.request.contextPath}/member/logout" method="POST" id="logoutForm">
			        	<a href="#" id="logoutBtn"><c:out value="로그아웃"></c:out> </a>
		      		</form:form>
		      		</div>
	      			<input type="hidden" name="" id=go_home />
	      		</sec:authorize>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	$("#logoutBtn").click(function(e){
		e.preventDefault();
		$("#logoutForm").submit();
		
	})
})

</script>
</body>
</html>