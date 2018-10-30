<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>

<html>
	<head>
		<%@include file="/cus/cus_head.jsp"%>
	</head>
	<body>
		<%@include file="/cus/cus_topNav.jsp"%>
		
		<!-- <!-- Descriptor Jumbotron -->
		<!-- <div class="jumbotron mt-1">
			<h1 class="display-5 text-center font-weight-bold pt-4">내가 쓴 리뷰</h1>
		</div>  -->
		
		<%@include file="/cus/cus_member/cus_member_subNav.jsp"%>
		
		<!-- Container -->
		<div class="container">
			<table class="table table-sm table-responsive-lg table-striped table-hover text-center mt-3 mb-3">
				<thead>
					<tr>
						<th scope="col" class="reviewNo">글번호</th>
						<th scope="col" class="reviewWriter">작성자</th>
						<th scope="col" class="reviewSubject">제목</th>
						<th scope="col" class="reviewScore">별점</th>
						<th scope="col" class="reviewHits">조회수</th>
						<th scope="col" class="reviewWriteDate">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${count eq 0}">
						<tr> 
							<th colspan="6">아직 작성하신 리뷰가 없습니다.</th>
						</tr>
					</c:if>
							
					<c:if test="${count ne 0}">
						<c:forEach var="article" items="${articles}">
							<c:if test="${article.review_subject ne '블라인드'}">
								<tr class="clickableRow" data-href="cus_content.do?contentType=0&content_no=${article.review_no}&pageNum=${pageNum}&number=${number}">
									<td scope="row">
										${number}
										<c:set var="number" value="${number-1}"/>
									</td>
									<td>${article.cus_id}</td>
									<td class="text-left">
										<c:if test="${article.re_level gt 1}">
											<c:set var="wid" value="${(article.re_level-1)*10}"/>
											<img src="/Muhan/cus/cus_images/level.gif" width="${wid}" height="15">
										</c:if>
										
										<c:if test="${article.re_level gt 0}">
											RE: &ensp;
										</c:if>
											${article.review_subject}
									</td>
									<td>${article.review_score} / 5</td>
									<td>${article.review_hits}</td>								
									<td><fmt:formatDate value="${article.review_write_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								</tr>
							</c:if>
							<c:if test="${article.review_subject eq '블라인드'}">	
								<tr class="blindedRow">
									<td scope="row">
										${number}
										<c:set var="number" value="${number-1}"/>
									</td>
									<td>${article.cus_id}</td>
									<td colspan="3">
											<div class="text-muted">관리자에 의하여 블라인드 처리된 리뷰입니다.</div>
									</td>									
									<td><fmt:formatDate value="${article.review_write_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
			
		<div class="col-lg-12 pt-0 mb-2 text-center">
			<c:if test="${count ne 0}">
				<c:if test="${startPage gt pageBlock}">
					<a href="cus_my_review_list.do">
						<img src="/Muhan/cus/cus_images/rewind.png" class="rewind">
						<!-- <strong class="rewind">|&lt;&lt;</strong> -->
					</a>
					&ensp;
					<a href="cus_my_review_list.do?pageNum=${startPage-pageBlock}">
						<img src="/Muhan/cus/cus_images/return.png" class="return">
						<!-- <strong class="return">&lt;</strong> -->
					</a>
				</c:if>
				&ensp;
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i eq currentPage}">
						<a class="currentPageBottom text-danger font-weight-bold" href="">${i}</a>
					</c:if>
					<c:if test="${i ne currentPage}">
						<a class="pageNumBottom text-dark" href="cus_my_review_list.do?pageNum=${i}">${i}</a>
					</c:if>
				</c:forEach>
				&ensp;
				<c:if test="${pageCount gt endPage}">
					<a href="cus_my_review_list.do?pageNum=${startPage+pageBlock}">
						<img src="/Muhan/cus/cus_images/forward.png" class="forward">
						<!-- <strong class="forward">&gt;</strong> -->
					</a>
					&ensp;
					<a href="cus_my_review_list.do?pageNum=${pageCount}">
						<img src="/Muhan/cus/cus_images/fastForward.png" class="fastForward">
						<!-- <strong class="fastForward">&gt;&gt;|</strong> -->
					</a>
				</c:if>
			</c:if>
			
			<div class="jumbotron bg-white">
			</div>	
			<%@include file="/cus/cus_fixedFooter.jsp"%>
		</div>
	</body>
</html>