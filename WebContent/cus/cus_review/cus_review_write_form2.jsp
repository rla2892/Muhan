<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%-- 
<%@include file="/cus/cus_script.jsp"%>
--%>
<script src="./cus/cus_review/cus_review_write_form2_script.js"></script>

<html>
	<head>
		<%@include file="/cus/cus_head.jsp"%>
	</head>
	<body>
		<%@include file="/cus/cus_topNav.jsp"%>
		<%@include file="/cus/cus_review/cus_review_subNav.jsp"%>
		
		<!-- Container -->
		<div class="container w-100 mt-5 pt-5">
			<form class="form d-flex flex-column w-50" name="review_write_form" method="post" action="Cus_review_write_pro2.do" enctype="multipart/form-data" onsubmit="return review_write_check();">
				<div class="form-group row flex-item">
					<label for="review_subject">
						<strong>리뷰 제목: &nbsp;</strong>
					</label>
					<input class="form-control" type="text" name="review_subject" maxlength="30" placeholder="리뷰를 남겨주세요.">
				</div>
				<div class="form-group row flex-item">
					<label for="review_content">
						<strong>리뷰 내용: &nbsp;</strong>
					</label>
					<textarea class="form-control" name="review_content" id="review_content" rows="10" cols="30" maxlength="1333" placeholder="롯데리아는 고객님의 소중한 리뷰를 기다리고 있습니다."></textarea>
				</div>
				<div class="form-group row flex-item">
					<label for="review_score">
						<strong>리뷰 평점: &nbsp;</strong>
					</label>
					
					<div class="text-center d-flex flex-inline">
						<label class="reviewRatings">5점
							<input type="radio" name="review_score" value="5" checked>
							<span class="checkmark"></span>
						</label>
						
						<label class="reviewRatings">4점
							<input type="radio" name="review_score" value="4">
							<span class="checkmark"></span>
						</label>
						
						<label class="reviewRatings">3점
							<input type="radio" name="review_score" value="3">
							<span class="checkmark"></span>
						</label>
						
						<label class="reviewRatings">2점
							<input type="radio" name="review_score" value="2">
							<span class="checkmark"></span>
						</label>
						
						<label class="reviewRatings">1점
							<input type="radio" name="review_score" value="1">
							<span class="checkmark"></span>
						</label>
					</div>			
				</div>
				
				<div class="form-group row flex-item d-flex flex-inline">
					<label for="review_image_file"><strong>리뷰 이미지: &nbsp;</strong></label>
					<div class="custom-file w-100">
						<input type="file" class="custom-file-input" name="review_image_file" id="review_image_file">
						<label class="custom-file-label fileLabel" for="review_image_file">이미지 파일만 업로드 해 주세요.</label>		
					</div>
				</div>
				<input type="hidden" name="review_no" value="${review_no}">
				<input type="hidden" name="sort" value="${sort}">
				<div class="form-group row justify-content-center">
					<button class="btn btn-warning ml-1" type="submit"><strong>리뷰등록</strong></button>
					<button class="btn btn-warning ml-1" type="reset"><strong>초기화</strong></button>
					<button class="btn btn-warning ml-1" type="button" onclick="returnToList()"><strong>돌아가기</strong></button>
				</div>
			</form>
		</div>
		<%@include file="/cus/cus_scrollableFooter.jsp"%>
	</body>
</html>