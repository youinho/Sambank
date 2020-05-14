<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_admin.jsp" %>

<script>
$(function(){
	
	$("#reqCard").addClass("active");
	
	
	
})
</script>
<style>
	table{
		text-align:center;
	}
	a{
		color:black;
		
	}
	th, tr{
		font-size:14px;
		font-weight:normal;
	}
	.bno{
		font-size:12px;
	}
	.panel-body{
		margin-top:2px;
	}
	
</style>
</head>
<body>
	
	<div class="col-md-10 order-md-1">
      <h4 class="mb-3 title"><a href="/admin/card/requested" style="color:black;">카드 신청 현황</a></h4>
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
                                        <th style="width:5%">카드번호</th>
                                        <th style="width:5%">계좌번호</th>
                                        <th style="width:15%">신청 일</th>
                                        <th style="width:8%">지점</th>
                                        <th style="width:15%">처리</th>
                                    </tr>									
                                </thead>
								<tbody>
								<c:forEach items="${list }" var="vo">
									<tr>
                                        <td class="inquiry_no align-middle"><c:out value="${vo.card_no }"></c:out></td>
                                        <td class="align-middle"><c:out value="${vo.ano }"></c:out> </td>
                                        <td class="align-middle"><fmt:formatDate pattern="MM-dd" value="${vo.createdate }"/> </td>
                                        <td class="align-middle"><c:out value="${vo.branch}"></c:out> </td>
                                        <td class="align-middle">
                                        	<button data-no="${vo.card_no }" class='btn btn-outline-secondary btn-sm requestedBtn' style="width:100%;height:100%">완료 처리</button>	
                                        
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
<form action="/admin/notice" id="actionForm">
	<input type="hidden" name="pageNum" value="${cri.pageNum }" />
	<input type="hidden" name="amount" value="${cri.amount }" />
	<input type="hidden" name="type" value="${cri.type }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />
	<%-- <sec:csrfInput/> --%>
</form>
<script>
$(function(){
	
	
	
	
	let groupId = 0;
	$.ajax({
		url : "/admin/get_groupId",
		type : "post",
		beforeSend : function(xhr)
           {   
               xhr.setRequestHeader(hn, tk);
           },
		data :{
		},
		dataType : "text",
		success : function(result){
			groupId = parseInt(result);
		}
	})
	
	
	let request_result = ""; 
	$(".requestedBtn").click(function(){
		let card_no = $(this).data("no");
		$.ajax({
			url : "/admin/card/set_request",
			type : "post",
			beforeSend : function(xhr)
	           {   
	               xhr.setRequestHeader(hn, tk);
	           },
			data :{
				card_no : card_no
			},
			dataType : "text",
			async : false,
			success : function(result){
				
				request_result = result;
				
				
			}
		})
		if(request_result==="success"){
			$(this).closest("td").html("<strong>완료되었습니다.</strong>");
			$(this).remove();
			alert("처리되었습니다.");
		}
	})
	
	
	
})

</script>