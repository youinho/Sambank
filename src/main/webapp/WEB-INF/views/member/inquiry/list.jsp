<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="../../includes/header_Main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SamBank < 문의사항 > </title>

<style>
/* footer{
	/* <img src="/resources/SB_files/pull-1.png" style="position: fixed;bottom: 10px; right:10px"/> */
	background-image: url("/resources/SB_files/pull-1.png");
	background-repeat: no-repeat; /* repeat(기본값),no-repeat,repeat-x,repeat-y */
	background-position: bottom right; /* 수평 : left,center,right  수직 : top, center, bottom */
} */
</style>
</head>
<body>

     
     <main>
	<!-- 여기다가 작성하면됨 -->
     <div class="col-md-10 order-md-1">
      <h4 class="mb-3 title"><a href="/member/inquiry" style="color:black;">1:1 비공개 문의내역</a> &nbsp&nbsp&nbsp<a class='btn btn-outline-success btn-sm' href="/member/inquiry/register" style="font-size:12px">문의사항 작성하기</a> </h4>
      <div class="row">
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover table-sm">
                                <thead>
                                    <tr>
                                        <th style="width:10%">no</th>
                                        <th>제 목</th>
                                        <th style="width:15%">수정일</th>
                                        <th style="width:15%">담당자</th>
                                    </tr>									
                                </thead>
								<tbody>
								<c:forEach items="${list }" var="vo">
									<tr>
                                        <td class="inquiry_no align-middle"><c:out value="${vo.inquiry_no }"></c:out></td>
                                        <td class="align-middle"><a href="${vo.inquiry_no}" class="move"><c:out value="${vo.title }" ></c:out> </a></td>
                                        <td class="align-middle"><fmt:formatDate pattern="MM-dd HH:mm" value="${vo.updateDate }"/> </td>
                                        <td class="align-middle">
                                        	<c:choose>
                                        		<c:when test="${vo.answer_name==null }">
                                        			<small><c:out value="담당 대기중"></c:out></small>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<small><c:out value="${vo.answer_branch }  "></c:out></small><strong><c:out value="${vo.answer_name }"></c:out></strong>
                                        		</c:otherwise>
                                        	</c:choose>
                                        	
                                        
                                        </td>
                                    </tr>		
								</c:forEach>
									
									
									
								</tbody>
                            </table>
                            <!-- end Pagination -->   
                            </div>
                            <!-- end panel-body -->
                        </div>
                        <!-- end panel -->
                    </div>                   
                </div>     
    </div>
     
     
     
     </main>


		
		
<script>
$(function(){
	$("a.move").click(function(e){
		e.preventDefault();
		let move_no = $(this).attr("href");
		
		location.href = "/member/inquiry/"+move_no;
			
	})
	
})
</script>        

</body>
</html>
<%@include file="../../includes/footer_Main.jsp" %>