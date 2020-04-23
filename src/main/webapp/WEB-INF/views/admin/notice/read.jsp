<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header_admin.jsp" %>


<div class="content">
	<!-- 컨텐츠 타이틀 -->
	<h3 class="tit_content title">공지사항</h3>
	<!-- //컨텐츠 타이틀 -->

	<!-- 컨텐츠 내용 -->
	<div>
		<div class="tbl_type2 leftPd">
			<table summary="<b>4~5월 국가기술자격 상시검정 시행 안내</b>">
				
				<colgroup>
					<col width="12%">
					<col width="*">
					<col width="12%">
					<col width="20%">
					<col width="12%">
					<col width="20%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td colspan="5"><b><c:out value="${vo.title }"></c:out></b></td>
					</tr>
					<tr>
						<th scope="row">담당부서</th>
						<td>@담당부서</td>
						<th scope="row">등록일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate }"/></td>
						<th scope="row">최종수정일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.updatedate }"/> </td>
					</tr>

					<tr>
						<th scope="row">첨부파일</th>
						<td colspan="5">

							<a href="javascript:fileDown('bbs/Q001/Q001_2194542', '4~5월 국가기술자격 상시검정 시행 조치 계획.hwp', '2194542')" class="btn3_icon download">4~5월 국가기술자격 상시검정 시행 조치 계획.hwp<span class="blind">다운로드</span></a>

							<a href="javascript:fileDown('bbs/Q001/Q001_2194543', '4~5월 국가기술자격 상시검정 시행 조치 계획.pdf', '2194543')" class="btn3_icon download">4~5월 국가기술자격 상시검정 시행 조치 계획.pdf<span class="blind">다운로드</span></a>

						</td>
					</tr>

					<tr>
						<td colspan="6">
							<div style="padding:20px;margin:20px">
								<c:out value="${vo.content }"></c:out>
							</div>
							<textarea id="contents_text" style="width:100%;display:none;" rows="10">
							
							
							</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="5">
						<td colspan="2">
							<div class="btn-group outline-dark" role="group" aria-label="Basic example">
								<button class="btn btn-outline-primary btn-sm" type="button">수정</button>
								<button class="btn btn-outline-primary btn-sm" type="button">삭제</button>
								<button class="btn btn-outline-primary btn-sm" type="button">목록</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
		
									
									