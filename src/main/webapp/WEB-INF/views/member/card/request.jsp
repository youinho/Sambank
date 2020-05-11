<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header_Main.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
$("aside").remove();

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/admin/account/admin_modifyAccount_validate.js"></script>

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
		<h3 class="page-header title">신규 카드 신청</h3>
	</div>
	<form action="" method="post" id="registerForm">
		<table class="table" style="margin:0;padding:0;">
		
		<tr>
			<td class="align-middle">
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <p class="input-group-text text-center" style="width:100%"><strong>고객 정보</strong></p>
			  </div>
			  <input type="text"  class="form-control" id="name" name="name" placeholder="성함" readonly>
			  <div class="input-group-append" style="width:110px">
			    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="total_card" name="total" style="width:100%">보유 카드</button>
			    <div class="dropdown-menu" id="card-list">
			    	<div role="separator" class="dropdown-divider"></div>
			    </div>
			  </div>
			  <div class="input-group-append" style="width:110px">
			    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="total" name="total" style="width:100%">보유 계좌</button>
			    <div class="dropdown-menu" id="ano-list">
			    	<div role="separator" class="dropdown-divider"></div>
			    </div>
			  </div>
			</div>
			</td>
		</tr>
		
		
		
		<tr>
			<td>
				<div class="input-group">
				  <div class="input-group-prepend" style="width:15%">
				    <span class="input-group-text" style="width:100%"><strong>상품/ 계좌</strong></span>
				  </div>
				  <input type="text" aria-label="p_name" class="form-control" name="p_name" readonly>
				  <input type="text" aria-label="ano" class="form-control" name="ano" readonly>
				  
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="input-group">
				  <div class="input-group-prepend" style="width:15%">
				    <p class="input-group-text" style="width:100%"><strong>카드 상품</strong></p>
				  </div>
				  <select class="custom-select" id="product" name="c_type">
				    <option value="0" selected>-- 상품 선택 --</option>
				    <c:forEach items="${list }" var="vo">
				    	<option value="${vo.product }"><c:out value="${vo.p_name }"></c:out> </option>
				    </c:forEach>
				  </select>
				</div>
			</td>
		</tr>
		<tr>
			<td>
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <span class="input-group-text" style="width:100%"><strong>한도</strong></span>
			  </div>
			  <input type="text"  class="form-control" name="limit_month" placeholder="월 한도" required>
			  <input type="text"  class="form-control" name="limit" placeholder="1회 한도" required>
			</div>
			</td>
		</tr>
		
		<tr>
			<td>
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <span class="input-group-text" style="width:100%"><strong>받으실 지점</strong></span>
			  </div>
			  <input type="text"  class="form-control" name="branch" placeholder="지점" required>
			</div>
			</td>
		</tr>
		
		
		
		
		<tr>
			<td>
			<div class="input-group">
			  <div class="input-group-prepend" style="width:15%">
			    <span class="input-group-text" style="width:100%"><strong>비밀번호</strong> </span>
			  </div>
			  <input type="password"  class="form-control" name="password" id="password" placeholder="비밀번호 입력" required>
			  <input type="password"  class="form-control" name="confirm_password" id="confirm_password" placeholder="비밀번호 재입력" required>			  
			  <div class="input-group-append">
			  </div>
			</div>
			</td>
		</tr>
		
		
		<tr>
			<td>
				<div class="d-flex justify-content-end">
					<div class="btn-group outline-primary" role="group">
						<button class="btn btn-outline-primary" style="border-radius:0.25em;" type="submit" id="submitBtn">카드 신청</button>
					</div>
				</div>
			</td>
		</tr>
		
		
		
		
		
		</table>
		<sec:csrfInput/>
	</form>
</div>
</div>
		
	


<script>
$(function(){
	
	//팝업
	
	
	
	$.ajax({
		url : "/member/card/getAccInfo",
		type : "post",
		beforeSend : function(xhr)
        {   
			xhr.setRequestHeader(hn, tk);
        },
		dataType : "text",
		success : function(result){
			
			let list = JSON.parse(result); 
			if(list.length == 0){
				return;
			}
			let total = 0;
			let name = list[0].name;
			str = ""
			for(let i = 0; i < list.length; i++){
				if(list[i].ano!=null && list[i].ano!=""){
					str += "<a class='dropdown-item account-item' href='#'>"+list[i].ano+"</a>";
					total += 1;
				}
			}
			str = "<a class='dropdown-item' href='#'>보유 계좌 : "+total+" 개</a>"+"<div class='dropdown-divider'></div>"+ str;
			$("#ano-list").html(str);
			$("#name").val(name);
			
		}
		
		
		
	
		
	})
	
	$("#ano-list").on("click",".account-item" ,function(e){
		e.preventDefault();
		
		
		var ano = $(this).text();
		
		$.ajax({
			url:"/member/card/get_depositInfo",
			type : "post",
			beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(hn, tk);
            },
			data : {
				ano : ano
			},
			dataType : "text",
			success : function(result){
				var vo = JSON.parse(result);
				$("input[name='p_name']").val(vo.p_name);
				$("input[name='ano']").val(vo.ano);
			}
		})
		
		
		$.ajax({
			url:"/member/card/get_cardList",
			type : "post",
			beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(hn, tk);
            },
			data : {
				ano : ano
			},
			dataType : "text",
			success : function(result){
				
				let list = JSON.parse(result); 
				let total = 0;
				
				str = ""
				for(let i = 0; i < list.length; i++){
					str += "<a class='dropdown-item card-item' href='#'>"+list[i].card_no+"</a>";
					total += 1;
				}
				str = "<a class='dropdown-item' href='#'>계좌의 카드 : "+total+" 개</a>"+"<div class='dropdown-divider'></div>"+ str;
				$("#card-list").html(str);
				
			}
			
			
			
		})
		
		
	})
	var regPwd=/^[0-9]{4}$/;
	$("#submitBtn").click(function(e){
		e.preventDefault();
		if($("input[name='ano']").val()===""){
			$("input[name='ano']").focus();
			return false;
		}
		if($("input[name='limit']").val()===""){
			$("input[name='limit']").focus();
			return false;
		}
		if($("input[name='limit_month']").val()===""){
			$("input[name='limit_month']").focus();
			return false;
		}
		if($("input[name='branch']").val()===""){
			$("input[name='branch']").focus();
			return false;
		}
		if($("input[name='password']").val()!==$("input[name='confirm_password']").val() || !regPwd.test($("input[name='password']").val())){
			$("input[name='password']").focus();
			alert("비밀번호를 다시 입력해 주세요")
			return false;
		}
		$.ajax({
			url:"/member/card/request",
			type : "post",
			beforeSend : function(xhr)
            {   
				xhr.setRequestHeader(hn, tk);
            },
			data : {
				ano : $("input[name='ano']").val(),
				c_type : $("select[name='c_type']").val(),
				limit_month : $("input[name='limit_month']").val(),
				limit : $("input[name='limit']").val(),
				branch : $("input[name='branch']").val(),
				password : $("input[name='password']").val(),
				confirm_password : $("input[name='confirm_password']").val()
				
				
			},
			dataType : "text",
			success : function(result){
				if(result === "true"){
					alert($("input[name='ano']").val()+"계좌의 카드 신청이 완료되었습니다.");
					$("#registerForm")[0].reset();
					location.href="/member/card/request";
				}else{
					alert("카드 신청에 실패했습니다.");
				}
			}
		})
		
	})
	
	
	
	
})

</script>
<%@include file="../../includes/footer_Main.jsp" %>