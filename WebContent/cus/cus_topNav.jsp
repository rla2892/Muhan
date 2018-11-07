<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<link rel="stylesheet" type="text/css"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		body {
			min-height: 75rem;
			padding-top: 4.5rem;
		}		
		a.nav-item {
			color: white;
		}
	#mainNavbar {
	font-size: 1.75rem !important;
	font-weight: bold !important;
}

#loginCartNavbar {
	font-size: 1.25rem !important;
	font-weight: light !important;
}

#navbarToggleIcon {
	width: 3rem;
	height: 3rem;
}

.myInfo {
	width: 13rem;
}

.dropdown-item:hover {
	background-color: #ffc107 !important;
}

.cart {
	width: 20rem !important;
/* /* 	left: -110px !important; */ */
}

.ordered_menus {
	width: 20rem !important;
}

.mainWhiteLogo {
	width: 70% !important;
}			
	</style>
</head>	
	</body>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
	<!-- Lotteria Logo, Used as Home Button -->
	<a class="navbar-brand" href="cus_user_main.do">
		<img src="/Muhan/cus/cus_images/Muhan (1).png" class="d-inline-block align-top" alt="Lotteria Red Main Logo">
	</a>
	
	<!-- Toggler/Collapsible Button -->
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
			aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
		<img src="/Muhan/cus/cus_images/navbarTogglerIcon.png" id="navbarToggleIcon">
	</button>
	
	<!-- Main Links -->
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<ul class="navbar-nav" id="mainNavbar">
			<li class="nav-item">
				<a class="nav-link ml-2 mr-2 pl-2 text-white" href="cus_menu.do?menu_category=4,5">MENU</a>
			</li>
			<li class="nav-item">
				<a class="nav-link ml-5 mr-5 pl-5 text-white" href="cus_store.do">STORE</a>
			</li>
			<li class="nav-item">
				<a class="nav-link ml-5 mr-5 pl-5 text-white" href="cus_review.do">REVIEW</a>
			</li>
			<li class="nav-item">
				<a class="nav-link ml-5 mr-5 pl-5 text-white" href="cus_chart.do">CHART</a>
			</li>
			
			
		</ul>
	</div>	

	<div class="group d-flex ml-5 mr-5">				
		<div class="dropdown mt-1 mr-2">
			<a class="nav-link text-white font-weight-light" href="#" id="loginCartNavbar" data-toggle="dropdown">LOGIN/JOIN</a>
			<script type="text/javascript">
				window.onload=function() {
					if(!sessionStorage.getItem('cus_id')) {
						loginCartNavbar.innerHTML='LOGIN/JOIN';
					} else {
						loginCartNavbar.innerHTML='MY INFO ▼';								
					}								
				}
			</script>
			<div class="dropdown-menu myInfo text-center">
				<div class="showCusId"></div>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item customerInfo" href="cus_customer_info.do">내 정보 보기</a>
				<a class="dropdown-item modifyInfo" href="cus_modify_info_form.do">내 정보 수정</a>
				<a class="dropdown-item myReviewList" href="cus_my_review_list.do">내가 쓴 리뷰</a>
				<a class="dropdown-item orderHistory" href="cus_order_history.do">내 주문 이력</a>
				<div class="dropdown-divider"></div>
				<div class="justify-content-center">
					<div class="message mt-1 pl-3 pr-3">새 메세지가 없습니다.</div>
				</div>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item logout" href="cus_logout.do">로그아웃</a>
				<div class="messageSection"></div>
			</div>
		</div>
		
		<div class="dropdown ml-4 pr-5">
		
			<button type="button" data-toggle="dropdown" style="border: none; background: transparent;"><img src="/Muhan/cus/cus_images/iconmonstr-shopping-cart-2-72.png">
				<span class="badge badge-pill badge-danger numberOfItems"></span>
			</button>
			<div class="dropdown-menu dropdown-menu-right cart text-center">
				<%@include file="/cus/cus_cart/cart.jsp"%>
			</div>
		</div>
	</div>
	</nav>
	</body>
</html>