<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header_admin.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>

$(function(){
	$("#manage").addClass("active");
	
	

	
	
})

function alert_updated(){
	let updated = "${updated}";
	
	if(updated ==='' || history.state){
		return;
	}
	
	
	if(updated != "" && updated != null){
		if(updated=="true"){
			alert("관리자 ${name}"+" 의 정보수정이 완료되었습니다.");
		}else if(updated=="false"){
			alert("정보 수정에 실패했습니다.");
		}
	}
}

function alert_reg(){
	let registered = "${registered}";
	
	if(registered ==='' || history.state){
		return;
	}
	
	if(registered === "true"){
		alert("관리자 ${name}"+" 의 등록이 완료되었습니다.");
	}else if(registered === "false"){
		alert("등록에 실패했습니다.");
	}
	
	
}


</script>

<style>
	.btn{
		border-radius : 0;
	}
	.input-group-text{
		border-radius : 0;
	}
	span{
		text-align : center;
	}
	.table td{
		border-top : 0;
	}
	.input-group-prepend{
		background-color : blue;
		
	}
</style>


<div class="container">
<div class="col-md-12">
	<div class="col-md-12">
		<h3 class="page-header title">관리자 관리</h3>
	</div>
	<form action="" method="post" id="manageForm">
		<table class="table" style="margin:0;padding:0;">
		
		<tr>
			<td class="align-middle">
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text text-center" style="width:100%"><strong>관리자 정보</strong></p>
			  </div>
			  <input type="text"  class="form-control" id="id" name="id" placeholder="아이디">
			  <input type="text"  class="form-control" id="name" name="name" placeholder="이름">
			  
			  <div class="input-group-append" style="width:20%">
			    <button class="btn btn-outline-secondary" type="button" id="searchAD" style="width:100%">관리자 검색</button>
			  </div>
			</div>
			</td>
		</tr>
		
		
		
		<tr>
			<td>
				<div class="input-group">
				  <div class="input-group-prepend" style="width:15%">
				    <span class="input-group-text" style="width:100%"><strong>지점/직책</strong></span>
				  </div>
				  <input type="text" aria-label="branch" class="form-control" name="branch">
				  <input type="text" aria-label="rank" class="form-control" name="rank">
				  
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="input-group">
				  <div class="input-group-prepend" style="width:15%">
				    <p class="input-group-text" style="width:100%"><strong>권한</strong></p>
				  </div>
				  <select class="custom-select" id="group_id" name="group_id">
				    <option value="-1" selected>-- 그룹 선택 --</option>
				    <c:forEach items="${groups }" var="group">
				    	<option value="${group.id }"><c:out value="${group.group_name}"></c:out> </option>
				    </c:forEach>
				  </select>
				  <select class="custom-select" id="enabled" name="enabled">
				    <option value="-1" selected>-- 접속 허가 상태 --</option>
				    <option value="0">로그인 미승인</option>
				    <option value="1">로그인 승인</option>
				  </select>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="input-group">
				  <div class="input-group-prepend" style="width:15%">
				    <span class="input-group-text" style="width:100%"><strong>전화번호</strong></span>
				  </div>
				  <input type="text" aria-label="mobile" class="form-control" name="mobile">
				  
				  
				</div>
			</td>
		</tr>		
		
		<tr>
			<td>
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <span class="input-group-text" style="width:100%"><strong>비밀번호</strong> </span>
			  </div>
			  <input type="password"  class="form-control" name="password" id="password" readonly>
			    <button class="btn btn-outline-secondary" type="button" id="passwordBtn">
			    	<svg class="bi bi-grid-3x3-gap" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path stroke="#000" d="M1.5 2a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V2zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V7zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5v-2z"/>
					</svg>
			    </button>
			  <input type="password"  class="form-control" name="confirm_password" id="confirm_password" readonly>
			  <button class="btn btn-outline-secondary" type="button" id="confirm_passwordBtn">
			    	<svg class="bi bi-grid-3x3-gap" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path stroke="#000" d="M1.5 2a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V2zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5V7zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5V7zm-10 5a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5H7a.5.5 0 01-.5-.5v-2zm5 0a.5.5 0 01.5-.5h2a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 01-.5-.5v-2z"/>
					</svg>
			    </button>
			    <button class="btn btn-outline-primary" type="button" id="changePwdBtn">
			    	비밀번호 변경
			    </button>
			  <div class="input-group-append">
			  </div>
			</div>
			</td>
		</tr>
		
		
		<tr>
			<td>
				<div class="d-flex justify-content-end">
					<div class="btn-group outline-primary" role="group">
						<button class="btn btn-outline-primary" style="border-radius:0.25em;" type="submit" id="modifyBtn">정보 변경</button>
						<button class="btn btn-outline-primary" style="border-radius:0.25em;" type="submit" id="registerBtn">관리자 등록</button>
					</div>
				</div>
			</td>
		</tr>
		
		
		
		
		
		</table>
		<sec:csrfInput/>
	</form>
	
</div>
</div>
		
	


<script src="/resources/js/admin/admin_manage.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/admin/admin_manage_validate.js"></script>