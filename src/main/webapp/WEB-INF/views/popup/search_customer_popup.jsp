<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 검색</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<div class="panel-body">

<table class="table table-striped table-bordered table-hover">
	<div>
		<label for="name">성함</label>
		<input type="text" name="name" />	
	</div>
	<div>
		<label for="name">생년월일</label>
		<input type="text" name="birth" />	
	</div>
	<div>
		<label for="name">전화번호</label>
		<input type="text" name="mobile" />	
	</div>
	<button id="search">고객 검색</button>
    <thead>
        <tr>
            <th>cno</th>
            <th>성함</th>
            <th>생년월일</th>
            <th>전화번호</th>
            <th>선택</th>
        </tr>									
    </thead>
    <tbody id="resultList">
    	
    </tbody>

</table>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("#search").click(function(){
		$("#resultList").html("");
		$.ajax({
			url : "/admin/search",
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
					str += "<td>"+list[i].mobile+"</td>";
					str += "<td><button data-cno="+list[i].cno+">입력</button></td>";
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
})

</script>

</body>
</html>