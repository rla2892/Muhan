<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>
<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_review.jsp" %>

<!-- ////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="container">
	<form method="post" action="Admin_review_notice_modify_pro.do" name="modifyform" onsubmit="return noticeCheck();">
		<h3>공지에 대한 정보를 수정하세요</h3>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="notice_no">공지 번호</label>
				<input class="form-control" type="number" name="notice_no" id="notice_no" maxlength="15" value="${notice_dto.notice_no}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="notice_subject">공지 제목</label>
				<input class="form-control" type="text" name="notice_subject" id="notice_subject" maxlength="15" value="${notice_dto.notice_subject}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="notice_content">공지 내용</label>
				<textarea class="form-control" name="notice_content" id="notice_content" rows="10" cols="30">
${notice_dto.notice_content}
				</textarea>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="notice_write_date">공지 작성일</label>
				<input class="form-control" type="text" name="notice_write_date" id="notice_write_date" maxlength="15" value="${notice_dto.notice_write_date}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="notice_hits">공지 조회수</label>
				<input class="form-control" type="number" name="notice_hits" id="notice_hits" maxlength="15" value="${notice_dto.notice_hits}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<input class="btn btn-primary" type="submit" value="수정">
				<input class="btn btn-primary" type="reset" value="취소">
			</div>
		</div>
	</form>
</div>

<!-- ////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>