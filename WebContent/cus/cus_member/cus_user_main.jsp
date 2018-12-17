<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp"%>
<style>

</style>
<html>
	<head>
		<%@include file="/cus/cus_head.jsp"%>
	</head>
	<body style="background-color: #353535;">
		<%@include file="/cus/cus_topNav.jsp"%>
	
		<!-- Container -->
		<div class="container-fluid">
			
			<!-- Carousel (Ads) -->
			<div id="ads" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#ads" data-slide-to="0" class="active"></li>
					<li data-target="#ads" data-slide-to="1"></li>
					<li data-target="#ads" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block h-75 newTrex" src="/Muhan/cus/cus_images/ad_1.jpg" alt="First Slide" >
					</div>
					<div class="carousel-item">
						<img class="d-block h-75" src="/Muhan/cus/cus_images/ad_2.jpg" alt="Second Slide" >
					</div>
					<div class="carousel-item">
						<img class="d-block h-75" src="/Muhan/cus/cus_images/ad_4.jpg" alt="Third Slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#ads" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#ads" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>				
				</a>
			</div>
			
			<!-- Fixed Footer: 붙이는 위치가 Scrollable Footer와는 다릅니다! Fixed Footer는 중단 Container 안에 넣어주셔야 합니다. --> 
			<%@include file="/cus/cus_fixedFooter.jsp"%>
		</div>
	</body>
</html>
 