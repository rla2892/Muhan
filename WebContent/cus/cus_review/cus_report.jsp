<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="report" tabindex="-1" role="dialog" aria-labelledby="report" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="report">리뷰 신고하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<div class="mt-2 mb-4">신고 사유를 선택해 주세요.</div>
				<form class="form" method="get" name="reportReviewForm" action="cus_report_pro.do">
					<select class="custom-select text-center w-50 mb-4" name="report_reason">
						<option value="1">광고/도배</option>
						<option value="2">욕설/비방</option>
						<option value="3">음란물/성적 비방</option>
						<option value="4">기타 부적절한 내용</option>						
					</select>
					<input type="hidden" name="cus_id" value="${sessionScope.cus_id}">
					<input type="hidden" name="review_no" value="${content.review_no}">
					<br>
	  				<button type="submit" class="btn btn-warning">신고</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
				</form>
			</div>
		</div>
	</div>
</div>