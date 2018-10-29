<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>
<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_review.jsp" %>

<!-- ////////////////////////////////////////////////////////////////////////////////////////////////// -->
<c:if test="${fn:length(reviews) eq 0}">
게시물이 존재하지 않습니다.
</c:if>
<c:if test="${fn:length(reviews) ne 0}">
<table class="table table-hover">
	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>별점</td>
		<td>조회수</td>
		<td>관리</td>
	</tr>
	<c:forEach var="review" items="${reviews}">
		<tr>
			<td>${review.review_no}</td>
			<td>
			<a href ="Admin_review_detail.do?review_no=${review.review_no}">
			${review.review_subject}
			</a>
			</td>
			<td>${review.cus_id}</td>
			<td>${review.review_write_date}</td>
			<td>${review.review_score}</td>
			<td>${review.review_hits}</td>
			
			<%-- 
			<td>${review.review_content}</td>
			<td>${review.review_image}</td>
			<td>${review.ref_id}</td>
			<td>${review.re_step}</td>
			<td>${review.re_level}</td>
			--%>
			
			
			<td>
				<div class="btn-group">
					<input class="btn btn-primary btn-sm" type="button" value="수정" onclick="location='Admin_review_modify_form.do?review_no=${review.review_no}'">
					<input class="btn btn-primary btn-sm" type="button" value="블라인드" onclick="location='Admin_review_blind.do?review_no=${review.review_no}'">
					<input class="btn btn-primary btn-sm" type="button" value="삭제" onclick="location='Admin_review_delete_pro.do?review_no=${review.review_no}'">
				</div>
			</td>
		</tr>	
	</c:forEach>
</table>
<c:if test="${startPage gt pageBlock}">
	<a href="Admin_review_find_search.do?keyword=${keyword}&how=${how}">[◀◀] </a>
	<a href="Admin_review_find_search.do?keyword=${keyword}&how=${how}&pageNum=${startPage-pageBlock}">[◀] </a>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i eq currentPage}">
		<b>[${i}]</b>
	</c:if>
	<c:if test="${i ne currentPage}">					
		<a href="Admin_review_find_search.do?keyword=${keyword}&how=${how}&pageNum=${i}">[${i}] </a>
	</c:if>	
</c:forEach>
<c:if test="${pageCount gt endPage}">
	<a href ="Admin_review_find_search.do?keyword=${keyword}&how=${how}&pageNum=${startPage+pageBlock}">[▶]</a>
	<a href ="Admin_review_find_search.do?keyword=${keyword}&how=${how}&pageNum=${pageCount}">[▶▶]</a>
</c:if>	


<form method="post" action="Admin_review_find_search.do" name="searchform">
	<select name="how">
	  <option value="1">제목</option>
	  <option value="2">내용</option>
	  <option value="3">제목+내용</option>
	</select>
	<input class="input" type="text" name="keyword">
	<input class="btn btn-primary btn-sm" type="submit" value="검색">
</form>
</c:if><%--리뷰 존재 if --%>


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>