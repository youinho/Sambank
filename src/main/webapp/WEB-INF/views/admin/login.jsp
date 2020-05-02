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
<title>Sambank Admin Login</title>
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
</head>

<body>
	<div id="container">
		<div class="row d-flex justify-content-start">
			<div id="login" class="col-lg-6">
				<c:url value="/admin/login_process" var="loginUrl" />
		        <%-- <form action="/admin/login" method="POST" class="post-form"> --%>
		        
		        <form:form name="f" action="${loginUrl}" method="POST">
		            
		            <c:if test="${param.logout != null}"> 
		            	<p>로그아웃 하였습니다.</p> 
		            </c:if>
		            <fieldset>
		                <legend style="text-align: center">Sambank Admin Login Page</legend><br>
		                <div class="form-group">
		                  <label for="id"><strong>ID</strong></label>
		                  <input type="text" class="form-control" name="id" id="id" placeholder="아이디" required>
		                </div>
		                <div class="form-group">
		                  <label for="password"><strong>PASSWORD</strong></label>
		                  <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" required>
		                </div>
		                <input type="submit" class="btn btn-primary btn-block" value="로그인" />
		            </fieldset>
		        <%-- </form> --%>
		        </form:form>
		        
		        <sec:authorize access="isAuthenticated()">
			        <form:form action="${pageContext.request.contextPath}/admin/logout" method="POST">
		      			<input type="submit" class="btn btn-primary btn-block" value="로그아웃" />
		      		</form:form>
	      		</sec:authorize>
		    </div>
	    </div>
	</div>
	
	
	
	
</body>
</html>