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
<title>테스트 로그인 Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
      #background {
      	width: 700px;
      	margin: 0 auto;
      	padding-top: 200px;
		padding-left: 60px;
      }

      #login {
      	width: 560px;
      	height: 357px;
      	margin: 0 auto;
      	padding: 40px;
      }
</style>
<script>
let hn = "${_csrf.headerName}";		//토큰헤더입니다.@@
let tk = "${_csrf.token}"			//토큰입니다.@@
</script>
</head>

<body>
	로그인 성공했습니다.
	F12를 눌러서 토큰을 확인
	
	<form:form action="${pageContext.request.contextPath}/customer/logout" method="POST">
		<input type="submit" class="btn btn-primary btn-block" value="로그아웃" />
	</form:form>
	
</body>
</html>