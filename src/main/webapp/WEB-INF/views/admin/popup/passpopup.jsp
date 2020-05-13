<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input Password</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
#background {
      	width: 350px;
      	margin: 0 auto;
      	padding-top: 0;
		padding-left: 0;
      }

      #login {
      	width: 350px;
      	height: 200px;
      	margin: 0 auto;
      	padding: 0;
      }
</style>
</head>
<body>
<div id="background">
		<div id="login" class="col-xs-12">
	        
	            <fieldset>
	                <legend style="text-align: center">Input Password</legend><br>
	                <div class="form-group">
	                  <label for="password"><strong>PASSWORD</strong></label>
	                  <input type="password" class="form-control" name="password" id="password">
	                </div>
	                <input type="button" class="btn btn-primary btn-block" value="확인"/>
	            </fieldset>
	        
	    </div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("input[type='button']").click(function(e){
		let password = $("#password").val();
		let wInput = "${wInput}";
		e.preventDefault();
		opener.input_password(password, wInput);
		window.close();
	})
	
	$("#password").focus();
	
})
</script>
</body>
</html>