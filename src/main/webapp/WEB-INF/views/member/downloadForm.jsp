<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="download" enctype="multipart/form-data" method="post">
		
		<button>submit</button>
	</form>
</body>

<script type="text/javascript">


function ReadWeight() {
    var filePath = "file:///C:/Temp";
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET",filePath,false);
    xmlhttp.send(null);
    var fileContent = xmlhttp.responseText; 

    alert(fileContent);
}

ReadWeight();


</script>
</html>










