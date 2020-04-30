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
	  <input type="text" class="form-control" placeholder="지점" aria-label="지점" aria-describedby="button-addon2" name="branch">
	  <input type="text" class="form-control" placeholder="이름" aria-label="이름" aria-describedby="button-addon2" name="name">
	  <input type="text" class="form-control" placeholder="아이디" aria-label="아이디" aria-describedby="button-addon2" name="id">
	  <div class="input-group-append">
	    <button class="btn btn-outline-secondary" type="button" id="search">관리자 검색</button>
	  </div>
	</div>
	
	<hr class="mb-4">
	<div class="col-md-12">
		<table class="table table-striped table-bordered table-hover table-sm">
		    <thead>
		        <tr>
		            <th scope="col">지점</th>
		            <th scope="col">직위</th>
		            <th scope="col">id</th>
		            <th scope="col">이름</th>
		            <th scope="col">전화번호</th>
		            <th scope="col">선택</th>
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
			url : "/admin/searchAD",
			type : "post",
			beforeSend : function(xhr)
            {   
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			data : {
				name : $("input[name='name']").val(),
				branch : $("input[name='branch']").val(),
				id : $("input[name='id']").val()
			},
			dataType : "text",
			success : function(result){
				
				let list = JSON.parse(result);
				
				if(list.length == 0){
					return;
				}
				
				let str = "";
				for(let i = 0; i < list.length; i++){
					if(i>100){
						break;
					}
					
					str += "<tr>";
					str += "<td>"+list[i].branch+"</td>";
					str += "<td>"+list[i].rank+"</td>";
					str += "<td>"+list[i].id+"</td>";
					str += "<td>"+list[i].name+"</td>";
					str += "<td>"+list[i].mobile+"</td>";
					str += "<td><button data-id="+list[i].id+" class='btn btn-outline-secondary cno-input'>선택</button></td>";
					str += "</tr>";
					
				}
				$("#resultList").html(str);
				
				
				
			}
			
		
		
		})
	})
	
	$("#resultList").on("click", "button", function(){
		//$("input[name='cno']").val($(this).data("cno"));
		opener.searchAD_callback($(this).data("id"));
		window.close();
	})
	
	$("input[name='name']").focus();
})

</script>

</body>
</html>