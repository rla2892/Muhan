<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>
<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_review.jsp" %>

<!-- ////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="container">
	<form method="post" action="Admin_review_modify_pro.do" name="modifyform">
		<h3>리뷰에 대한 정보를 수정하세요</h3>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="review_no">리뷰 번호</label>
				<input class="form-control" type="number" name="review_no" id="review_no" maxlength="15" value="${review_dto.review_no}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="review_subject">리뷰 제목</label>
				<input class="form-control" type="text" name="review_subject" id="review_subject" maxlength="15" value="${review_dto.review_subject}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="review_content">리뷰 내용</label>
				<textarea class="form-control" name="review_content" id="review_content" rows="10" cols="30">
${review_dto.review_content}
				</textarea>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="review_image">리뷰 이미지</label>
				<input class="form-control" type="text" name="review_image" id="review_image" maxlength="15" value="${review_dto.review_image}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="review_write_date">리뷰 작성일</label>
				<input class="form-control" type="text" name="review_write_date" id="review_write_date" maxlength="15" value="${review_dto.review_write_date}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="review_hits">리뷰 조회수</label>
				<input class="form-control" type="number" name="review_hits" id="review_hits" maxlength="15" value="${review_dto.review_hits}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="review_score">리뷰 평점</label>
				<input class="form-control" type="number" name="review_score" id="review_score" maxlength="15" value="${review_dto.review_score}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-4">
				<label for="cus_id">아이디</label>
				<input class="form-control" type="text" name="cus_id" id="cus_id" maxlength="15" value="${review_dto.cus_id}" readonly>
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