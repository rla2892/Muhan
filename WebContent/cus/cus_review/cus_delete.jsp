<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="delete" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="delete">리뷰 삭제</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<div class="mt-2">한번 삭제된 리뷰는 복구될 수 없습니다. <br> 정말로 삭제하시겠습니까?</div>
				<form class="form" method="get" name="deleteReviewForm" action="cus_delete_pro.do">
					<input type="hidden" name="review_no" value="${content.review_no}">
					<br>
	  				<button type="submit" class="btn btn-warning">삭제</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
				</form>
			</div>
		</div>
	</div>
</div>