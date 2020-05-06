<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header_admin.jsp" %>

<script>
$(function(){
	
	$("#inquiry_list").addClass("active");
	
	
	
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
      <h4 class="mb-3 title"><a href="/admin/inquiry" style="color:black;">고객 문의</a>&nbsp&nbsp&nbsp<a class='btn btn-outline-success btn-sm' href="/admin/inquiry?search=true" style="font-size:12px">담당 문의 보기</a> </h4>
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
                                        <th style="width:10%">문의 번호</th>
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
                                        			<button data-no="${vo.inquiry_no }" class='btn btn-outline-secondary btn-sm inquiryBtn' style="width:100%;height:100%">담당하기</button>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<c:out value="${vo.answer_name }"></c:out>
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
	
	
	let actionForm = $("#actionForm");
	$(".page-link").click(function(e){
		e.preventDefault();
		//	/board/list?pageNum=5&amount=20
		//actionForm 안의 pageNum값과 amount 값 변경하기
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		actionForm.submit();
	})
	
	
	
	$("a.move").click(function(e){
		e.preventDefault();
		let move_no = $(this).attr("href");
		$.ajax({
			url : "/admin/check_inquiry",
			type : "post",
			beforeSend : function(xhr)
	           {   
	               xhr.setRequestHeader(hn, tk);
	           },
			data :{
				inquiry_no:$(this).attr("href")
			},
			dataType : "text",
			success : function(result){
				if(result === "true"){
					location.href = "/admin/inquiry/"+move_no;
				}else if(result === "false"){
					alert("담당자만 읽을 수 있습니다.");
				}
			}
		})
	})
	
	$(".inquiryBtn").click(function(e){
		e.preventDefault();
		let res = false;
		let name = "";
		$.ajax({
			url : "/admin/charge_inquiry",
			type : "post",
			beforeSend : function(xhr)
	           {   
	               xhr.setRequestHeader(hn, tk);
	           },
	        async : false,
			data :{
				inquiry_no:$(this).data("no")
			},
			dataType : "text",
			success : function(result){
				res=true;
				name=result;
			}
		})
		if(res){
			$(this).closest("td").html(name);
			$(this).remove();
			
		}
		
		
		
	})
	
	
	
})

</script>