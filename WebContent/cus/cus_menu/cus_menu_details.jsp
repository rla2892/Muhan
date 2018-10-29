<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp"%>

<html>
	<head>
		<%@include file="/cus/cus_head.jsp"%>
	</head>
	<body>
		<%@include file="/cus/cus_topNav.jsp"%>
		<%@include file="/cus/cus_menu/cus_menu_subNav.jsp"%>
		
		<!-- Container -->
		<div class="container mt-1 pt-5">
		
			<!-- Menu Item -->
			<div class="menuItem col-lg-6 mt-5">
				<img class="menuImg border-0 w-100" src="/Muhan/menu_images/${menuItem.menu_image}" alt="Menu Img">
			</div>
			<div class="menuContent col-lg-4 mt-5">
				<form name="menuform">
					<div class="text-center">
						<h3 class="text dark"><strong>${menuItem.menu_name}</strong></h3>
						<p class="text-dark pt-3 pl-3 pr-3">${menuItem.menu_detail}</p>
						<h3 class="mb-0"><strong>${menuItem.menu_price}원</strong></h3>
						<div class="row">
							<div class="input-group justify-content-center mt-3 mb-1">
								<p>수량:&ensp;</p><input type="number" name="qty" class="form-control form-control-sm text-center font-weight-bold col-lg-3" value="1" min="1" max="19">
							</div>
						</div>
						<h6 class="card-text text-dark"><small>20개 이상의 단체주문은 매장으로 연락주시기 바랍니다.</small></h6>
					</div>
				
					<input type="hidden" name="menu_id" value="${menuItem.menu_id}">
					<input type="hidden" name="menu_name" value="${menuItem.menu_name}">
					<input type="hidden" name="menu_image" value="${menuItem.menu_image}">
					<input type="hidden" name="menu_price" value="${menuItem.menu_price}">
				
					<div class="mt-3 text-center">
						<button type="button" class="btn btn-warning" onclick="moveItemsToCart(${menuItem.menu_id})"><b>장바구니에 담기</b></button>
						<button type="button" class="btn btn-warning" onclick="orderNow(${menuItem.menu_id})"><b>바로 주문하기</b></button>
						<button type="button" class="mt-1 btn btn-warning" onclick="returnToList()"><b>목록으로 돌아가기</b></button>
					</div>
				</form>
			</div>		
			
			<div class="jumbotron bg-white">
			</div>
			<%@include file="/cus/cus_fixedFooter.jsp"%>
		</div>
	</body>
</html>