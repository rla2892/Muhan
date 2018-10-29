<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp"%>

<html>
	<head>
		<%@include file="/cus/cus_head.jsp"%>
	</head>
	<body>
		<%@include file="/cus/cus_topNav.jsp"%>
		<%@include file="/cus/cus_review/cus_review_subNav.jsp"%>
		
		<!-- Container -->
		<div class="container col-lg-8 mt-5 pt-5 d-flex flex-column">
			<table class="table table-responsive-lg table-striped text-center mb-3 flex-item">
				<tbody>
					<c:if test="${contentType eq 0}">
						<tr>
							<th scope="col">글번호</th>
							<td scope="col">${number}</td>
							<th scope="col">작성자</th>
							<td scope="col"><div class="writerId">${content.cus_id}</div></td>
							<th scope="col">작성일</th>
							<td scope="col" class="dateWritten">
								<fmt:formatDate value="${content.review_write_date}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/>
							</td>
							<th scope="col">조회수</th>
							<td scope="col">${content.review_hits}</td>
							<th scope="col">별점</th>
							<td scope="col">${content.review_score} / 5</td>		
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td colspan="5">${content.review_subject}</td>
							
							<c:if test="${sessionScope.cus_id eq content.cus_id}"> 
								<th><a class="modifyContent" href="cus_modify_form.do?review_no=${content.review_no}">수정</a></th>								
								<th><a class="deleteContent" id="deleteContent" href="cus_delete.do" data-toggle="modal" data-target="#delete">삭제</a></th>
								<th><a class="replyToContent" id="replyToContent" href="Cus_review_write_form2.do?sort=1&review_no=${content.review_no}">답글</a></th>						
								<td><div class="text-muted" title="본인이 작성한 리뷰는 신고할 수 없습니다.">신고</div></td>
							</c:if>
							
							<c:if test="${sessionScope.cus_id ne content.cus_id}">
								<td><div class="text-muted" title="본인이 작성한 리뷰 이외에는 수정할 수 없습니다.">수정</div></td>
								<td><div class="text-muted" title="본인이 작성한 리뷰 이외에는 삭제할 수 없습니다.">삭제</div></td>
								<%-- 
								<th><a class="replyToContent" id="replyToContent" href="">답글</a></th>
								--%>
								<th><a class="replyToContent" id="replyToContent" href="Cus_review_write_form2.do?sort=1&review_no=${content.review_no}">답글</a></th>
								<th><a class="reportContent" id="reportContent" href="cus_report.do" data-toggle="modal" data-target="#report" data-backdrop="static" data-keyboard="false">신고</a></th>	
								
								
							</c:if>
						</tr>
						<tr>
							<td scope="row" colspan="10"><div class="reviewContentDiv">${content.review_content}</div></td>
						</tr>
						<tr>
							<c:if test="${content.review_image ne null}">
								<td scope="row" colspan="10"><div class="reviewContentDiv"><img src="/Muhan/review_images/${content.review_image}"></div></td>
							</c:if>
							<c:if test="${content.review_image eq null}">
								<td scope="row" colspan="10"><div class="reviewContentDiv">이미지가 없습니다</div></td>
							</c:if>
						</tr>
						
						<tr>
							
						</tr>
						
						<%@include file="/cus/cus_review/cus_report.jsp"%>	<!-- 신고에 쓰이는 모달페이지 -->
						<%@include file="/cus/cus_review/cus_delete.jsp"%>	<!-- 삭제에 쓰이는 모달페이지 -->
					</c:if>
				
					<c:if test="${contentType eq 1}">
						<tr>
							<th scope="col">공지번호</th>
							<td scope="col">${content.notice_no}</td>
							<th scope="col">작성자</th>
							<td scope="col">관리자</td>
							<th scope="col">작성일</th>
							<td scope="col" class="dateWritten">
								<fmt:formatDate value="${content.notice_write_date}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/>
							</td>
							<th scope="col">조회수</th>
							<td scope="col">${content.notice_hits}</td>		
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td colspan="7">${content.notice_subject}</td>
						</tr>
						<tr>
							<td colspan="8">${content.notice_content}</td>
						</tr>
						<tr>
							<td scope="row" colspan="10">placeholder for image</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div class="jumbotron bg-white">
			</div>
			<%@include file="/cus/cus_fixedFooter.jsp"%>
		</div>
	</body>
</html>