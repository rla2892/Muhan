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
		<td>${notice_dto.notice_no}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${notice_dto.notice_write_date}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${notice_dto.notice_hits}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${notice_dto.notice_subject}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${notice_dto.notice_content}</td>
	</tr>
</table>

<!-- ////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>