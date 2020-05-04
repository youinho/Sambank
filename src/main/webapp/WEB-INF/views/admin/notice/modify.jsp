<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header_admin.jsp" %>
<style>
	#content{
		height:500px;
	}
</style>
<script>
$(function(){
	$("#inner-notice").addClass("active");
	$('input').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
	});
	
	$("#cancel").click(function(e){
		e.preventDefault();
		$("#modForm").attr("method", "get");
		$("#modForm").attr("action","/admin/notice/read/"+"${vo.admin_bno}");
		$("#modForm").find("input[name='content']").remove();
		$("#modForm").find("input[name='title']").remove();
		$("#modForm").find("input[name='_csrf']").remove();
		$("#modForm").submit();
	})
	
	
})
</script>
<div class="col-md-10">
	<h3 class="page-header title">공지 수정</h3>
</div>

<div class="col-md-10">     
	<form action="/admin/notice/modify" method="post" id="modForm">   
		<div class="input-group">
		  <div class="input-group-prepend">
		    <span class="input-group-text">제목</span>
		  </div>
		  <input type="text" aria-label="제목" class="form-control" name="title" value="${vo.title }">
		<div class="input-group-append" id="button-addon4">
			<button class="btn btn-outline-primary" type="submit" id="modifyBtn">수정</button>
		</div>
		<div class="input-group-append" style="width:2px">
		</div>
		<div class="input-group-append" id="button-addon5">
			<button class="btn btn-outline-warning" type="button" id="cancel">취소</button>
		</div>
		</div>
		<div class="form-group">
			<textarea class="form-control" id="content" name="content" rows="3"><c:out value="${vo.content }"></c:out> </textarea>
		</div>
		<div class="input-group">
			<div class="custom-file">
				<input type="file" class="custom-file-input" id="uploadFile" name="uploadFile" multiple>
				<label class="custom-file-label" for="inputGroupFile04">파일 업로드</label>
			</div>
		</div>
		<input type="hidden" name="admin_bno" value="${vo.admin_bno }" />
		
		<input type="hidden" name="pageNum" value="${cri.pageNum }"/>
		<input type="hidden" name="amount" value="${cri.amount }"/>
		<input type="hidden" name="type" value="${cri.type }" />
		<input type="hidden" name="keyword" value="${cri.keyword }" />
		<sec:csrfInput/>	
	</form>
	<div class="uploadResult">
		<ul>
			
		</ul>
	</div>
	
	
	
	
	
	
	
</div>
<script>
$(function(){
	let admin_bno = "${vo.admin_bno }";
	
	$.ajax({
		url : '/admin/notice/get_attachList',
		beforeSend : function(xhr)
        {   
            xhr.setRequestHeader(hn, tk);
        },
		data : {
			admin_bno:admin_bno
		},
		type : 'post',
		dataType : 'text',
		success : function(result){
			
			data = JSON.parse(result);
			
			let str = "";
			let uploadResult = $(".uploadResult ul");
			let icon = "<svg class='bi bi-file-earmark-text' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M4 1h5v1H4a1 1 0 00-1 1v10a1 1 0 001 1h8a1 1 0 001-1V6h1v7a2 2 0 01-2 2H4a2 2 0 01-2-2V3a2 2 0 012-2z'/><path d='M9 4.5V1l5 5h-3.5A1.5 1.5 0 019 4.5z'/><path fill-rule='evenodd' d='M5 11.5a.5.5 0 01.5-.5h2a.5.5 0 010 1h-2a.5.5 0 01-.5-.5zm0-2a.5.5 0 01.5-.5h5a.5.5 0 010 1h-5a.5.5 0 01-.5-.5zm0-2a.5.5 0 01.5-.5h5a.5.5 0 010 1h-5a.5.5 0 01-.5-.5z' clip-rule='evenodd'/></svg>"
			$(data).each(function(i,obj){
				
				let fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'>";
				str += "<div>"+icon+" "+obj.fileName+"";
				str += "&nbsp&nbsp<button type='button' class='btn btn-outline-secondary btn-circle btn-sm' data-file='"+fileCallPath+"' data-type='file' style='padding:0'>"
				str += "<span style='padding:0;margin:0;font-size:10px'>제거</span>"
				str += "</button></div><br>";			
				str += "</li>";
				
			})
			uploadResult.append(str);
		}
	})
	
	
	$("input[type='file']").change(function(){
		
		
		
		//form 안의 데이터들을 key/value 형태로 만들 때 사용
		let formData = new FormData();
		
		//사용자가 첨부한 파일 목록 가져오기
		let inputFiles = $("input[name='uploadFile']");
		
		let files = inputFiles[0].files;
		
		//가져온 첨부파일 목록을 formData 객체 안에 추가하기
		for(var i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile",files[i]);
		}
		
		$.ajax({
			url : '/admin/notice/upload',
			processData : false,
			contentType : false,
			beforeSend : function(xhr)
            {   
                xhr.setRequestHeader(hn, tk);
            },
			data : formData,
			type : 'post',
			dataType : 'json',
			success : function(result){
				
				showAttachList(result);
				$("input[name='uploadFile']").val("");
			}
		})
		
		
		
		
		
	})
	
	
	//첨부파일의 크기와 종류 제한하기
	function checkExtension(fileName, fileSize){
		let regex = new RegExp("(.*?)\.(exe|sh|zip|alz|js)$");
		let maxSize = 2000000;
		
		if(fileSize > maxSize){
			alert("파일 사이즈 초과")
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	function showAttachList(uploadResultArr){
		let str = "";
		let uploadResult = $(".uploadResult ul");
		let icon = "<svg class='bi bi-file-earmark-text' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M4 1h5v1H4a1 1 0 00-1 1v10a1 1 0 001 1h8a1 1 0 001-1V6h1v7a2 2 0 01-2 2H4a2 2 0 01-2-2V3a2 2 0 012-2z'/><path d='M9 4.5V1l5 5h-3.5A1.5 1.5 0 019 4.5z'/><path fill-rule='evenodd' d='M5 11.5a.5.5 0 01.5-.5h2a.5.5 0 010 1h-2a.5.5 0 01-.5-.5zm0-2a.5.5 0 01.5-.5h5a.5.5 0 010 1h-5a.5.5 0 01-.5-.5zm0-2a.5.5 0 01.5-.5h5a.5.5 0 010 1h-5a.5.5 0 01-.5-.5z' clip-rule='evenodd'/></svg>"
		$(uploadResultArr).each(function(i,obj){
			
			let fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'>";
			str += "<div>"+icon+" "+obj.fileName+"";
			str += "&nbsp&nbsp<button type='button' class='btn btn-outline-secondary btn-circle btn-sm' data-file='"+fileCallPath+"' data-type='file' style='padding:0'>"
			str += "<span style='padding:0;margin:0;font-size:10px'>제거</span>"
			str += "</button></div><br>";			
			str += "</li>";
			
			
		})
		uploadResult.append(str);
		
	}
	
	// x 를 누르면 목록에서 삭제하기
	$(".uploadResult").on("click","button", function(){
		
		let targetFile = $(this).data("file");
		let type = $(this).data("type");
		
		let targetLi = $(this).closest("li");
		$.ajax({
			url : '/admin/notice/deleteFile',
			dataType : 'text',
			beforeSend : function(xhr)
            {   
                xhr.setRequestHeader(hn, tk);
            },
			data :{
				fileName : targetFile
			},
			type : 'post',
			success : function(result){
				targetLi.remove();
			}
		
		})
	})
	
	
	
	let formObj = $("#modForm");
	$("#modifyBtn").click(function(e){
		//submit 막기
		e.preventDefault();
		if($("input[name='title']").val()===""){
			$("input[name='title']").focus();
			alert("제목을 입력해 주세요.")
			return false;
		}
		if($("#content").val()==="" || $("#content").val()== null){
			
			alert("글 내용을 입력해 주세요.")
			return false;
		}
		//첨부파일 정보 수집하기
		let str = "";
		
		$(".uploadResult ul li").each(function(i, ele){
			
			let job = $(ele);
			
			str+="<input type='hidden' name='attachList["+i+"].uuid' value='"+job.data("uuid")+"'>";
			str+="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+job.data("path")+"'>";
			str+="<input type='hidden' name='attachList["+i+"].fileName' value='"+job.data("filename")+"'>";
			str+="<input type='hidden' name='attachList["+i+"].fileType' value='"+job.data("type")+"'>";
			
		})
		
		formObj.append(str);
			
			
			
		formObj.submit();
		
		
	})
	
	
	
	
	
	
	
	
	
	
	
})





</script>