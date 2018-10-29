<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>
<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_review.jsp" %>

<!-- ////////////////////////////////////////////////////////////////////////////////////////////////// -->


<table class="table table-hover">
	<tr>
		<th>글번호</th>
		<td>${review_dto.review_no}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${review_dto.review_subject}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${review_dto.review_write_date}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${review_dto.review_hits}</td>
	</tr>
	<tr>
		<th>별점</th>
		<td>${review_dto.review_score}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${review_dto.review_content}</td>
	</tr>
	<tr>
		<th>이미지</th>
		<td>${review_dto.review_image}</td>
	</tr>
	<%-- 
	<tr>
		<td>${review_dto.ref_id}</td>
	</tr>
	<tr>
		<td>${review_dto.re_step}</td>
	</tr>
	<tr>
		<td>${review_dto.re_level}</td>
	</tr>
	--%>
	<tr>
		<th>작성자</th>
		<td>${review_dto.cus_id}</td>
	</tr>
	<tr>
		<th>신고횟수</th>
		<td>${countReport}</td>
	</tr>
</table>
<input class="btn btn-primary" type="button" value="신고" onclick="location='Admin_review_report_pro.do?review_no=${review_dto.review_no}'">

<!-- ////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>