<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 검색</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
	#search{
		display:flex;
	}
	label{
		font-weight: bold;
	}
	th{
		padding:0;
	}
	.cno-input{
		padding:0;
		
		width:100%;
		height:100%;
	}
	table{
		
		text-align: center;
		white-space: nowrap;
	}
	thead{
		font-size:14px;
	}
	tbody{
		font-size: 12px;
	}
</style>
</head>
<body>
<div class="panel-body">
	<div class="input-group mb-3">
	  <input type="text" class="form-control" placeholder="성함" aria-label="성함" aria-describedby="button-addon2" name="name">
	  <input type="text" class="form-control" placeholder="생년월일" aria-label="생년월일" aria-describedby="button-addon2" name="birth">
	  <input type="text" class="form-control" placeholder="전화번호" aria-label="전화번호" aria-describedby="button-addon2" name="mobile">
	  <div class="input-group-append">
	    <button class="btn btn-outline-secondary" type="button" id="search">고객 검색</button>
	  </div>
	</div>
	
	<hr class="mb-4">
	<div class="col-md-12">
		<table class="table table-striped table-bordered table-hover table-sm">
		    <thead>
		        <tr>
		            <th scope="col" style='width: 10%'>cno</th>
		            <th scope="col" style='width: 10%'>성함</th>
		            <th scope="col" style='width: 10%'>생년월일</th>
		            <th scope="col" style='width: 47%'>주소</th>
		            <th scope="col" style='width: 15%'>전화번호</th>
		            <th scope="col" style='width: 8%'>선택</th>
		        </tr>									
		    </thead>
		    <tbody id="resultList">
		    	
		    </tbody>
		
		</table>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("#search").click(function(){
		$("#resultList").html("");
		$.ajax({
			url : "/admin/customer/search",
			type : "post",
			data : {
				name : $("input[name='name']").val(),
				birth : $("input[name='birth']").val(),
				mobile : $("input[name='mobile']").val()
			},
			dataType : "text",
			success : function(result){
				
				let list = JSON.parse(result);
				console.log(list);
				if(list.length == 0){
					return;
				}
				console.log("list.length"+list.length);
				let str = "";
				for(let i = 0; i < list.length; i++){
					if(i>100){
						break;
					}
					console.log(i)
					str += "<tr>";
					str += "<td>"+list[i].cno+"</td>";
					str += "<td>"+list[i].name+"</td>";
					str += "<td>"+list[i].birth+"</td>";
					str += "<td>"+list[i].address+"</td>";
					str += "<td>"+list[i].mobile+"</td>";
					str += "<td><button data-cno="+list[i].cno+" class='btn btn-outline-secondary cno-input'>선택</button></td>";
					str += "</tr>";
					
				}
				$("#resultList").html(str);
				
				
				
			}
			
		
		
		})
	})
	
	$("#resultList").on("click", "button", function(){
		//$("input[name='cno']").val($(this).data("cno"));
		opener.searchCS_callback($(this).data("cno"));
		window.close();
	})
	
	$("input[name='name']").focus();
})

</script>

</body>
</html>