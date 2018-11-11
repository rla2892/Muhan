<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Footer -->
<!-- 주의! 메인에서 쓰는 footer는 아래에 붙이는 방식이 달라서 아무데나 가져다 쓰면 안 됩니다! 
fixed-bottom이라 페이지에 스크롤이 있을 경우 스크롤 내릴 때마다 footer가 계속 보일겁니다. 그 때는 menu나 review 페이지의 footer를 가져다쓰세요. -->

<div class="footer bg-dark fixed-bottom pt-0">
	<nav class="navbar navbar-expand-lg bg-dark justify-content-center">
		<!-- Bottom Logo -->
		<a class="navbar-brand" href="cus_user_main.do">
			<img src="/Muhan/cus/cus_images/logo_white-MH.png" class="mainWhiteLogo" alt="Lotteria White Main Logo">
		</a>
		
		<!-- Links -->
		<ul class="navbar-nav bottomLink">
			<li class="nav-item">
				<a class="nav-link ml-5 mr-5 text-white" href="https://mobilehome.lotteria.com/customer/agreement">이용약관</a>
			</li>
			<li class="nav-item">
				<a class="nav-link ml-5 mr-5 text-danger" href="https://mobilehome.lotteria.com/customer/policy">개인정보처리방침</a>
			</li>
			<li class="nav-item">
				<a class="nav-link ml-5 mr-5 text-white" href="https://www.instagram.com/lotteria_kr/">소셜미디어</a>
			</li>
		</ul>
	</nav>
	<div class="container text-white pb-2 mb-0" id="bottomInfo">
		<span class="footer-info">엔코아 플레이데이터 빅데이터/딥러닝 2기</span>
		<span class="footer-info">웹프로젝트</span>
		<span class="footer-info">무한(김)상사</span>
		<span class="footer-info">팀장: &emsp;김상진</span>
	</div>
	<div class="container pb-2">
		<p class="text-white">Copyright &copy; 2018</p>
	</div>
</div>