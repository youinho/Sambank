<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           Board Read Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" role="form">
                				<div class="form-group">
                					<label>Bno</label>
                					<input class="form-control" name="bno" readonly="readonly" value="${vo.bno}">                				
                				</div> 
                				<div class="form-group">
                					<label>Title</label>
                					<input class="form-control" name="title" readonly="readonly" value="${vo.title}">                				
                				</div>  
                				<div class="form-group">
                					<label>Content</label>
                					<textarea class="form-control" rows="3" name="content" readonly="readonly">${vo.content}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Writer</label>
                					<input class="form-control" name="writer" readonly="readonly" value="${vo.writer}">                				
                				</div>  
                				<button type="button" class="btn btn-default">Modify</button>     			
                				<button type="reset" class="btn btn-info">List</button>          			
                			</form>
                		</div>
                	</div>
                </div>
            </div>    
<!-- 댓글 폼 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>
				Reply
				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
			</div>
			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix" data-rno="12">
						<div>
							<div class="header">
								<strong class="primary-font">user</strong>
								<small class="pull-right text-muted">2020-04-09 09:17</small>
							</div>
							<p>Good Job!!!!!!!!!</p>
						</div>
					</li>					
				</ul>
			</div><%-- panel-body end --%>
			<div class="panel-footer"><%--댓글 페이지 나누기 영역 --%>
				
			</div>
		</div>
	</div>
</div>            
            
<form id="myForm" action="/board/modify">
	<input type="hidden" name="bno" value="${vo.bno}" />
	<%-- 페이지 나누기 후 추가 --%>
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<%-- 댓글작업을 위한 모달 --%>
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">      	
        <button type="button" class="close" data-dismiss="modal">
          <span aria-hidden="true">&times;</span>
        </button>
        <h5 class="modal-title">Reply Modal</h5>
      </div>
      <div class="modal-body">
        <div class="form-group">
        	<label for="">Reply</label>
        	<input type="text" class="form-control" name="reply"/>
        </div>
        <div class="form-group">
        	<label for="">Replyer</label>
        	<input type="text" class="form-control" name="replyer"/>
        </div>
        <div class="form-group">
        	<label for="">ReplyDate</label>
        	<input type="text" class="form-control" name="replydate"/>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" id="modalModBtn">수정</button>
        <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
        <button type="button" class="btn btn-primary" id="modalRegisterBtn">등록</button>
        <button type="button" class="btn btn-success" id="modalCloseBtn">닫기</button>        
      </div>
    </div>
  </div>
</div>






<script src="/resources/js/reply.js"></script>
<script>
$(function(){
	//댓글 작성과 관련된 스크립트
	
	//현재 글 번호 가져오기
	let bno = ${vo.bno};
	
	//댓글 리스트 영역 가져오기
	let replyList = $(".chat");
	showList(1);	
	
	//댓글 페이지 나누기 부분
	
	//댓글 페이지 영역 가져오기
	let replyPageFooter=$(".panel-footer");
	//기본 페이지 번호 지정
	let pageNum=1;
	
	function showReplyPage(total){
		let endPage = Math.ceil(pageNum/10.0)*10;
		let startPage = endPage - 9;
		let prev = startPage - 1;
		let next = false;
		
		
		if(endPage * 10 >= total){
			endPage=Math.ceil(total/10.0);
		}
		if(endPage*10 < total){
			next = true;
		}
		
		let str="<ul class='pagination pull-right'>";
		if(prev){
			str+="<li class='page-item'><a class='page-link'";
			str+=" href='"+(startPage-1)+"'>이전</a></li>"
		}
		
		for(let i=startPage;i<=endPage;i++){
			let active = pageNum == i?"active":"";
			str+="<li class='page-item "+active+"'>";
			str+="<a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next){
			str+="<li class='page-item'><a class='page-link'";
			str+=" href='"+(endPage+1)+"'>다음</a></li>"
		}
		
		str+="</ul></div>";
		replyPageFooter.html(str);
	}//페이지 나누기 종료
	
	
	//댓글의 페이지 번호 클릭시 이동하는 스크립트
	replyPageFooter.on("click","li a",function(e){
		e.preventDefault();
		
		pageNum = $(this).attr("href");
		showList(pageNum);
	})
	
	
	
	function showList(page){ //가져온 댓글 목록 보여주기
		//댓글 전체 가져오기	
		replyService.getList({bno:bno,page:page||1},function(replyCnt,data){
			console.log(bno + " : "+replyCnt);
			console.log(data);
			
			if(page == -1){
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}	
			
			
			
			if(data==null || data.length==0){
				replyList.html("");
				return;
			}
			
			let str="";
			for(let i=0,len=data.length||0;i<len;i++){
				str+='<li class="left clearfix" data-rno="'+data[i].rno+'">';
				str+='<div><div class="header"><strong class="primary-font">'+data[i].replyer+'</strong>';
				str+='<small class="pull-right text-muted">'+replyService.displayTime(data[i].replydate)+'</small></div>';
				str+='<p>'+data[i].reply+'</p></div></li>';				
			}
			replyList.html(str);
			showReplyPage(replyCnt);
		});
	}
	
	let modal=$(".modal");
	
	//모달창이 가지고 있는 input 가져오기
	let modalReply = modal.find("input[name=reply]");
	let modalReplyer = modal.find("input[name=replyer]");
	let modalReplyDate = modal.find("input[name=replydate]");
	
	//모달 버튼 가져오기
	let modalModBtn = $("#modalModBtn");
	let modalRemoveBtn = $("#modalRemoveBtn");
	let modalRegisterBtn = $("#modalRegisterBtn");
		
	$("#modalCloseBtn").click(function(){
		modal.modal('hide');
	})
	//댓글 작성
	$("#addReplyBtn").click(function(){
				
		//작성날짜 부분은 숨기기
		modalReplyDate.closest("div").hide();	
		//등록버튼과 close버튼만 보여주기
		modal.find("button[id!=modalCloseBtn]").hide();
		modalRegisterBtn.show();
		
		// 기존 댓글 내용 지우기
		modal.find("input").val("");
		
		
		modal.modal("show");
	})	
	
	$(modalRegisterBtn).click(function(){
		replyService.add({"bno":bno,
						"reply":modalReply.val(),
						"replyer":modalReplyer.val()},
				function(data){
					if(data){
						//alert("댓글 성공");
						modal.modal('hide');
						showList(-1);
					}	
		});		
	})
	
	//댓글 수정
	$(modalModBtn).click(function(){
		
		let reply={
				rno : modal.data("rno"),
				reply : modalReply.val()
		};		
		
		replyService.update(reply,function(data){
							if(data){
								alert("수정 성공");
								modal.modal("hide");
								showList(pageNum);
							}
		})
	})
	
	
		
	//댓글 하나 가져오기
	$(replyList).on("click","li",function(){
		
		let rno = $(this).data("rno");		
		
		replyService.get(rno,function(data){
			console.log(data);
			//가져온 데이터 모달 창에 보여주기
			modalReply.val(data.reply);
			modalReplyer.val(data.replyer);
			modalReplyDate.val(replyService.displayTime(data.replydate));
			modalReplyDate.attr("readonly","readonly");
			modal.data("rno",data.rno); //삭제&수정을 위해 필요
			
			modal.find("button[id!='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			modal.modal("show");
			});
		})

		//댓글 삭제
		$(modalRemoveBtn).click(function(){			
			
			replyService.remove(modal.data("rno"),function(data){
				if(data){
					modal.modal('hide');
					alert("댓글 삭제 성공");
					showList(pageNum);
				}
			});			
		})//삭제 종료

})
</script>



<script>
$(function(){
	
	let form = $("#myForm");
	//modify버튼이 클릭하면 myForm 전송하기
	$(".btn-default").click(function(){
		form.submit();
	})
	$(".btn-info").click(function(){
		//location.href="/board/list";
		
		//페이지 나누기와 관련된 정보(pageNum,amount) 보내기
		//bno는 삭제하고, myform 보내기
		form.find("input[name='bno']").remove();
		form.attr("action","/board/list");
		form.submit();
		
	})
	//list버튼이 클릭하면 list페이지 보여주기
})	
</script>       
<%@include file="../includes/footer.jsp" %>  








     