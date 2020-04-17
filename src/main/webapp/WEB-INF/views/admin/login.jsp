<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
	<div id="background">
		<div id="login" class="col-xs-12">
	        <form action="/admin/login" method="POST" class="post-form">
	            <fieldset>
	                <legend style="text-align: center">Sambank Admin Login Page</legend><br>
	                <div class="form-group">
	                  <label for="id"><strong>ID</strong></label>
	                  <input type="text" class="form-control" name="id" placeholder="아이디" required>
	                </div>
	                <div class="form-group">
	                  <label for="password"><strong>PASSWORD</strong></label>
	                  <input type="password" class="form-control" name="password" placeholder="비밀번호" required>
	                </div>
	                <input type="submit" class="btn btn-primary btn-block" value="로그인" />
	            </fieldset>
	        </form>
	    </div>
	</div>
	
	
	
	
</body>
</html>