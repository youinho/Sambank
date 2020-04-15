<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>dno</th>
				<th>cno</th>
				<th>ano</th>
				<th>balance</th>
				<th>createdate</th>
				<th>updatedate</th>
			</tr>									
		</thead>
								
		<c:forEach items="${list }" var="vo">
		<tbody>
			<tr>
				<td>${vo.dno }</td>
				<td>${vo.cno }</td>
				<td>${vo.ano }</td>
				<td>${vo.balance }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.createdate }"/> </td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.updatedate }"/> </td>
			</tr>	
		</tbody>	
		</c:forEach>
	</table>
</body>
</html>