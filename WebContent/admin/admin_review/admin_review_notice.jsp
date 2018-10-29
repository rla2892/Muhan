<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>
<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_review.jsp" %>

<!-- ////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="container">
	<form name="inputform" method="post" action="Admin_review_notice_pro.do" onsubmit="return noticeCheck();">
		<h3>공지에 대한 정보를 입력하세요</h3>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="notice_subject">공지 제목</label>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<input class="form-control" type="text" name="notice_subject" id="notice_subject" maxlength="15">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="notice_content">공지 내용</label>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<textarea class="form-control" name="notice_content" id="notice_content" rows="10" cols="30">
				</textarea>
			</div>
		</div>
		<div class="form-group">
			<input class="btn btn-primary" type="submit" value="게시">
			<input class="btn btn-primary" type="reset" value="취소">
		</div>
	</form>
</div>

<!-- ////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>