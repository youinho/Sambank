<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header_Main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Test page</h1>
<p>Hello!</p>
 
<script type="text/javascript">
    var dummyscript = document.createElement('script');
 
    // Register error function where the file does not exist.
    dummyscript.onerror = function() {
        if (dummyscript.onerror)
            alert("The file does not exist.");
    }
 
    // Append some random data to the file name so that the browser cache doesn't serve an old result.
    dummyscript.src = "file:///C:/Temp/1.txt" + new Date().getTime() + Math.floor(Math.random() * 1000000);
 
    // Load dummy script
    document.body.appendChild(dummyscript);
</script>
 
</body>
<%@include file="../../includes/footer_Main.jsp" %>
</html>


