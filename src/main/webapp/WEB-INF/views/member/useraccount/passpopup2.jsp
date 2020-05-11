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
      
      #num_button {
      	width: 350px;
    
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
	                  <input type="password" class="form-control" name="password" id="password" readonly>
	                </div>
	              	
	              	  <table id="num_button">
	                	<tr>
	           			 	<td colspan="1" style="width: 16%"><input type="button" class="form-control" id="num0" name="num0" ></td>
	           			 	<td colspan="1" style="width: 16%"><input type="button" class="form-control" id="num1" name="num1" ></td>
	           			 	<td colspan="1" style="width: 16%"><input type="button" class="form-control" id="num2" name="num2" ></td>
							<td colspan="1" style="width: 16%"><input type="button" class="form-control" id="num3" name="num3" ></td>
							<td colspan="1" style="width: 16%"><input type="button" class="form-control" id="num4" name="num4" ></td>
							<td colspan="1" style="width: 16%"><input type="button" class="form-control" id="num5" name="num5" ></td>
						</tr>
						<tr>
							<td colspan="1" style="width: 16%"><input type="button" class="form-control" id="num6" name="num6" ></td>
							<td colspan="1" style="width: 16%"><input type="button" class="form-control" id="num7" name="num7" ></td>
							<td colspan="1" style="width: 16%"><input type="button" class="form-control" id="num8" name="num8" ></td>
							<td colspan="1" style="width: 16%"><input type="button" class="form-control" id="num9" name="num9" ></td>
							<td colspan="1" style="width: 16%"><input type="button" class="form-control" id="num10" name="num10" ></td>
							<td colspan="1" style="width: 16%"><input type="button" class="form-control" id="num11" name="num11" ></td>
	               		</tr>
	               		</table>
	      	         
	               		 <input type="button" class="btn btn-primary btn-block" id="login_button" value="로그인"/>
	            	
	            </fieldset>
	        
	    </div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("input[id='login_button']").click(function(e){
		let password = $("#password").val();
		let wInput = "${wInput}";
		e.preventDefault();
		opener.input_password(password, wInput);
		window.close();
	})
	
	$("#password").focus();
	
	
})

</script>
<script type="text/javascript">
var arrNum=new Array();
for (var i=0;i<12;i++){
	ranNum=Math.floor(Math.random()*12);
	if(!sameNum(ranNum,i)){
		arrNum[i]=ranNum;
	}else{
		i--;
	}	
}

for(var i=0;i<12;i++){
	if(arrNum[i]>=10){
		arrNum[i]="";
	}
	$("#num"+i).val(arrNum[i]);
}

function sameNum(ranNum,i){
	for(var j=0;j<i;j++){
		if(arrNum[j]==ranNum)
			return true;
	}
	return false;
}


//	$("#num"+i).click(function(e){
//		console.log(arrNum[i]);
//		$("input[name='password']").val("input[name='password']"+arrNum[i]);
//	})


	//test alert alert(number) });


	 for(var i=0; i < 12; i++ ) {
		 
		 function print_log(i){
		 $("#num"+i).on('click',function() {
//			 var pass=$("input[name='password']").val();
//			 console.log(arrNum[i]);
			 $("input[name='password']").val($("input[name='password']").val()+arrNum[i]);
//			 console.log($("input[name='password']").val());
	        });
	    }
		 print_log(i);	
	 }






</script>
</body>
</html>