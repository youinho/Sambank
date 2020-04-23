<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header_admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
$(function(){
	$("#viACC").addClass("active");
	
})
</script>
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