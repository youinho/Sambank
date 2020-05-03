<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
<noscript> 
	<meta http-equiv="Refresh" content="0; URL=/admin/noscript"> 
</noscript>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>SamBank 전산관리</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<style>
	.child{
		font-size:14px;
		padding-left:30px;
	}
	.title{
		padding-top:20px;
	}
	.nav-link:hover{
		background-color: #e0ffff;
	}
	.bottom{
		padding-bottom : 100px;
	}
	a{
		color:black;
	}
	#uploadFile_header{
		display : none;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
let hn = "${_csrf.headerName}";
let tk = "${_csrf.token}"
$(function(){
	$.ajax({
		url : "/admin/get_adminInfo",
		type : "post",
		beforeSend : function(xhr)
	       {   
	           xhr.setRequestHeader(hn, tk);
	       },
	       dataType : "text",
		success : function(result){
			let vo = JSON.parse(result); 
			
			$("#admin_branch").html("<strong>"+vo.branch+"</strong>");
			$("#admin_rank").html("<strong>"+vo.rank+"</strong>");
			$("#admin_name").html("<strong>"+vo.name+"</strong>");
			$("#profile_image").html("<img src='/admin/get_profile_image' alt='로고 이미지' style='width=48px;height:48px'>");
			//$("#profile_image").html("<img src='/resources/img/umb.gif' alt='로고 이미지' style='width=48px;height:48px'>");
			
		}
	})
})
$(function(){
	$("#profile_image").click(function(e){
		e.preventDefault();
		$("#uploadFile_header").click();
	})
	
	
	$("#uploadFile_header").change(function(){
		
		
		
		//form 안의 데이터들을 key/value 형태로 만들 때 사용
		let formData = new FormData();
		
		//사용자가 첨부한 파일 목록 가져오기
		let inputFiles = $("#uploadFile_header");
		
		let files = inputFiles[0].files;
		
		//가져온 첨부파일 목록을 formData 객체 안에 추가하기
		for(var i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile_header",files[i]);
		}
		let change_success = false;
		$.ajax({
			url : '/admin/save_profile_image',
			processData : false,
			contentType : false,
			enctype:"multipart/form-data",
			beforeSend : function(xhr)
            {   
                xhr.setRequestHeader(hn, tk);
            },
            async : false,
			data : formData,
			type : 'post',
			dataType : 'json',
			complete : function(result){
				console.log(result);
				change_success = true; 
				
			}
		})
		if(change_success){
			$("#uploadFile_header").val("");
			$("#profile_image").html("<img src='/admin/get_profile_image' alt='로고 이미지' style='width=48px;height:48px'>");
			
		}
		
		
		
		
	})
	
	
	//첨부파일의 크기와 종류 제한하기
	function checkExtension(fileName, fileSize){
		let regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$");
		let maxSize = 300000;
		
		if(fileSize > maxSize){
			alert("파일 사이즈 초과")
			return false;
		}
		if(!regex.test(fileName)){
			alert("프로필 사진은 이미지 파일만 가능합니다.");
			return false;
		}
		return true;
	}
	
	
	
})


</script>

</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>




    <nav class="navbar navbar-light fixed-top bg-light flex-md-nowrap p-0 shadow" style="height:50px">
  <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/admin/notice">SamBank Admin Page</a>
  <ul class="navbar-nav px-3 mr-auto">
  	<li></li>
  </ul>
  <ul class="navbar-nav px-3">
  	<li class="nav-item text-nowrap">
	  	<a href="#" class="btn btn-outline-success" style="padding:0" id="profile_image">
	  		
	  	</a>
  	</li>
  </ul>
  <ul class="navbar-nav px-3">
  	<li class="nav-item text-nowrap">
	  	<span class="navbar-text" id="admin_branch">
	  	<%-- <strong><c:out value="${admin_branch }"></c:out></strong> --%>
	    </span>
  	</li>
  </ul>
  <ul class="navbar-nav px-3">
  	<li>
  		<span class="navbar-text" id="admin_rank">
  		<%-- <strong><c:out value="${admin_rank }"></c:out></strong> --%>
	    </span>
  	</li>
  </ul>
  <ul class="navbar-nav px-3">
  	<li>
  		<span class="navbar-text" id="admin_name">
  		<%-- <strong><c:out value="${admin_name }"></c:out></strong> --%>
	    </span>
  	</li>
  </ul>
  <ul class="navbar-nav px-3">
  	
    <li class="nav-item text-nowrap">
    <sec:authorize access="isAuthenticated()">
    	
    	<form:form action="${pageContext.request.contextPath}/admin/logout" method="POST">
      		<input class="nav-link btn btn-outline-secondary btn-sm" type="submit" value="로그아웃">
      	</form:form>
    </sec:authorize>
    </li>
  </ul>
  
</nav>

<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column nav-pills">
          <li style="height:50px">
          </li>
          <li >
            <!-- <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
              Orders
            </a> -->
            <!-- 사내공지 -->
            <div>
            <a  href="/admin/notice" class="nav-link" id="inner-notice">
	            <svg width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" d="M14 1H2a1 1 0 00-1 1v8a1 1 0 001 1h2.5a2 2 0 011.6.8L8 14.333 9.9 11.8a2 2 0 011.6-.8H14a1 1 0 001-1V2a1 1 0 00-1-1zM2 0a2 2 0 00-2 2v8a2 2 0 002 2h2.5a1 1 0 01.8.4l1.9 2.533a1 1 0 001.6 0l1.9-2.533a1 1 0 01.8-.4H14a2 2 0 002-2V2a2 2 0 00-2-2H2z" clip-rule="evenodd"/>
					<path d="M5 6a1 1 0 11-2 0 1 1 0 012 0zm4 0a1 1 0 11-2 0 1 1 0 012 0zm4 0a1 1 0 11-2 0 1 1 0 012 0z"/>
				</svg> 
				사내공지
			</a>
			</div>
          </li>
          <li >
           <a href="/admin/customer/register" class="nav-link">
             <svg  width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				<path fill-rule="evenodd" d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 100-6 3 3 0 000 6zm-5.784 6A2.238 2.238 0 015 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 005 9c-4 0-5 3-5 4s1 1 1 1h4.216zM4.5 8a2.5 2.5 0 100-5 2.5 2.5 0 000 5z" clip-rule="evenodd"/>
				</svg> 고객 관리<span class="fa arrow">
							</span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                	
                                    <a href="/admin/customer/register" class="nav-link child" id="regCS">고객 정보 등록</a>
                                </li>
                                <li>
                                    <a href="/admin/customer/modify" class="nav-link child" id="modCS">고객 정보 수정</a>
                                </li>
                                <li>
                                    <a href="/admin/customer/delete" class="nav-link child" id="delCS">고객 정보 삭제</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
          </li>
          <li class="nav-item">
            <a href="/admin/account/create" class="nav-link">
                            <svg class="bi bi-card-text" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 00-.5.5v9a.5.5 0 00.5.5h13a.5.5 0 00.5-.5v-9a.5.5 0 00-.5-.5zm-13-1A1.5 1.5 0 000 3.5v9A1.5 1.5 0 001.5 14h13a1.5 1.5 0 001.5-1.5v-9A1.5 1.5 0 0014.5 2h-13z" clip-rule="evenodd"/>
							  <path fill-rule="evenodd" d="M3 5.5a.5.5 0 01.5-.5h9a.5.5 0 010 1h-9a.5.5 0 01-.5-.5zM3 8a.5.5 0 01.5-.5h9a.5.5 0 010 1h-9A.5.5 0 013 8zm0 2.5a.5.5 0 01.5-.5h6a.5.5 0 010 1h-6a.5.5 0 01-.5-.5z" clip-rule="evenodd"/>
							</svg>
                            
                             계좌 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/admin/account/create" class="nav-link child" id="creACC">신규 계좌 개설</a>
                                </li>
                                <li>
                                    <a href="/admin/account/history" class="nav-link child" id="histACC">거래 내역 조회</a>
                                </li>
                                <li>
                                    <a href="/admin/account/modify" class="nav-link child" id="modACC">계좌 정보 수정</a>
                                </li>
                                <li>
                                    <a href="/admin/account/delete" class="nav-link child" id="delACC">계좌 정보 삭제</a>
                                </li>
                                <li>
                                    <a href="/admin/account/deposit" class="nav-link child" id="deposit">계좌 입금 　　</a>
                                </li>
                                <li>
                                    <a href="/admin/account/withdraw" class="nav-link child" id="withdraw">계좌 출금 　　</a>
                                </li>
                            </ul> 
                            <!-- /.nav-second-level -->
            
            
            
            
          </li>
           <li class="nav-item">
            <a href="/admin/card/register" class="nav-link">
                            <svg class="bi bi-credit-card" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M14 3H2a1 1 0 00-1 1v8a1 1 0 001 1h12a1 1 0 001-1V4a1 1 0 00-1-1zM2 2a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V4a2 2 0 00-2-2H2z" clip-rule="evenodd"/>
							  <rect width="3" height="3" x="2" y="9" rx="1"/>
							  <path d="M1 5h14v2H1z"/>
							</svg>
                            
                             카드 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/admin/card/register" class="nav-link child" id="regCard">카드 발급 　　</a>
                                </li>
                                <li>
                                    <a href="/admin/card/modify" class="nav-link child" id="modCard">카드 정보 수정</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
            
            
            
            
          </li>
          <sec:authorize access="hasAnyRole('ROLE_5,ROLE_7,ROLE_10')">
          <li class="nav-item">
            <a href="/admin/manage" class="nav-link" id="manage">
                            <svg class="bi bi-gear" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 014.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 01-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 011.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 012.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 012.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 011.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 01-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 018.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 001.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 00.52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 00-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 00-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 00-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 00-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 00.52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 001.255-.52l.094-.319z" clip-rule="evenodd"/>
							  <path fill-rule="evenodd" d="M8 5.754a2.246 2.246 0 100 4.492 2.246 2.246 0 000-4.492zM4.754 8a3.246 3.246 0 116.492 0 3.246 3.246 0 01-6.492 0z" clip-rule="evenodd"/>
							</svg>
                            
                             관리자 관리<span class="fa arrow"></span></a>
            
            
            
            
          </li>
          </sec:authorize>
          <li >
            <!-- <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
              Orders
            </a> -->
            <!-- 고객공지 -->
            <div>
            <a  href="/admin/customer_notice" class="nav-link" id="customer_notice">
	            <svg width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" d="M14 1H2a1 1 0 00-1 1v8a1 1 0 001 1h2.5a2 2 0 011.6.8L8 14.333 9.9 11.8a2 2 0 011.6-.8H14a1 1 0 001-1V2a1 1 0 00-1-1zM2 0a2 2 0 00-2 2v8a2 2 0 002 2h2.5a1 1 0 01.8.4l1.9 2.533a1 1 0 001.6 0l1.9-2.533a1 1 0 01.8-.4H14a2 2 0 002-2V2a2 2 0 00-2-2H2z" clip-rule="evenodd"/>
					<path d="M5 6a1 1 0 11-2 0 1 1 0 012 0zm4 0a1 1 0 11-2 0 1 1 0 012 0zm4 0a1 1 0 11-2 0 1 1 0 012 0z"/>
				</svg> 
				고객공지
			</a>
			</div>
          </li>
          
          <li >
            <!-- <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
              Orders
            </a> -->
            <!-- 고객공지 -->
            <div>
            <a  href="/admin/inquiry" class="nav-link" id="inquiry_list">
	            <svg class="bi bi-question-diamond" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.482 1.482 0 010-2.098L6.95.435zm1.4.7a.495.495 0 00-.7 0L1.134 7.65a.495.495 0 000 .7l6.516 6.516a.495.495 0 00.7 0l6.516-6.516a.495.495 0 000-.7L8.35 1.134z" clip-rule="evenodd"/>
				  <path d="M5.25 6.033h1.32c0-.781.458-1.384 1.36-1.384.685 0 1.313.343 1.313 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.007.463h1.307v-.355c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.326 0-2.786.647-2.754 2.533zm1.562 5.516c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
				</svg>
				고객 문의
			</a>
			</div>
          </li>
        </ul>
      </div>
      <div class="custom-file">
		<input type="file" class="custom-file-input" id="uploadFile_header" name="uploadFile_header">
		
	</div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        
      </div>

    
    <!-- </main>
  </div>
</div> -->

        <div id="page-wrapper">
        