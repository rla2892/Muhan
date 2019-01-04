<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>
<script src="./jquery-3.3.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="cus/cus_cart/cus_cart_script.js"></script>
<style>
.dropdown-menu{
	background-color: #F6F6F6 !important;
	heightt: 30px;
	padding: 6px;
	margin: 1px;
	boarder: 0px;
	position: absolute;
	width: 360px;
	z-index: 200;
}
</style>


<!-- Top Navigation Bar -->
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">	
	
	<!-- Lotteria Logo, Used as Home Button -->
	<a class="navbar-brand ml-5 mr-5 pl-5" href="cus_user_main.do">
		<img src="/Muhan/cus/cus_images/logo_red.png" class="mainLogo" alt="Lotteria Red Main Logo">
	</a>
	
	<!-- Toggler/Collapsible Button -->
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<img src="/Muhan/cus/cus_images/navbarTogglerIcon.png" id="navbarToggleIcon">
	</button>
	
	<!-- Main Links -->
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav" id="mainNavbar">
			<li class="nav-item">
				<a class="nav-link ml-5 mr-5 pl-5 text-white" href="cus_menu.do?menu_category=4,5">MENU</a>
			</li>
			<li class="nav-item">
				<a class="nav-link ml-5 mr-5 pl-5 text-white" href="cus_store.do">STORE</a>
			</li>
			<li class="nav-item">
				<a class="nav-link ml-5 mr-5 pl-5 text-white" href="cus_review.do">REVIEW</a>
			</li>
		</ul>
	</div>	

	<div class="group d-flex ml-5 mr-5">				
		<div class="dropdown mt-1 mr-2">
			<a class="nav-link text-dark font-weight-light" href="#" id="loginCartNavbar" data-toggle="dropdown">LOGIN/JOIN</a>
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
				<a class="dropdown-item customerInfo" href="cus_customer_info.do">내 정보 보기</a>
				<a class="dropdown-item modifyInfo" href="cus_modify_info_form.do">내 정보 수정</a>
				<a class="dropdown-item myReviewList" href="cus_my_review_list.do">내가 쓴 리뷰</a>
				<a class="dropdown-item orderHistory" href="cus_order_history.do">내 주문 이력</a>
				<div class="dropdown-divider"></div>
				<div class="justify-content-center">
					<div class="message mt-1 pl-3 pr-3">새 메세지가 없습니다.</div>
					<button class="btn btn-sm btn-warning ml-2 msgCheck" disabled>확인</button>
				</div>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item logout" href="cus_logout.do">로그아웃</a>
				<div class="messageSection"></div>
			</div>
		</div>
		
	</div>
</nav>

<!-- Descriptor Jumbotron -->
		<div class="jumbotron mt-1 bg-white">
			<h1 class="display-5 text-center font-weight-bold text-dark pt-4 bg-white">주문</h1>
		</div>
		

<div class="container">
<form class="form-vertical" name="cus_pay_form" method='post' action='cus_pay_pro.do' onsubmit="return cus_pay_check();">
	<div id="cus_pay_row" class="row">
		<div id="cus_pay_col" class="col">
		<div id="cus_info">
			<div class="form-group row">
				<div class="col">
					<h4>아이디</h4>
				</div>
				<div class="col">
					<input class="form-control" type="text" value="${customer_member_dto.cus_id}" readonly>
				</div>
				<input type="hidden" name="cus_id" id="cus_id" value="${customer_member_dto.cus_id}"><br>
			</div>
			
			<div class="form-group row">
				<div class="col">
					<h4>주문자</h4>
				</div>
				<div class="col">
					<input class="form-control" type="text" value="${customer_member_dto.cus_nickname}" readonly>
				</div>
			</div>
			<div class="form-group row">
				<div class="col">
					<h4>이메일</h4>
				</div>
				<div class="col">
					<input class="form-control" type="text" value="${customer_member_dto.cus_email}" readonly>
				</div>
			</div>
			<div class="form-group row">
				<div class="col">
					
					<h4>전화번호</h4> 
				</div>
				<div class="col">
					<input class="form-control" type="text" value="${customer_member_dto.cus_tel}" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col">
					<h4>주문받을 주소</h4>
				</div>
				<div class="col">
					<input class="btn btn-md btn-secondary" type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기">
					&nbsp;
					<input class="btn btn-md btn-secondary" type="button" id="currentLocation" onclick="setCurrentLocation()" value="현재 주소">
				</div>
			</div>
			<div class="form-group row">
				<div class="col">
					<input class="form-control" type="text" name="cus_address" id="cus_address"  value="${customer_member_dto.cus_address}">
				</div>
			</div>
			<div class="form-group row">
				<div class="col">
					<h4>주문 받을 상세 주소</h4>
				</div>
			</div>
			<div class="form-group row">
				<div class="col">
					<input class="form-control" type="text" name="cus_address2" id="cus_address2" value="${customer_member_dto.cus_address2}">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-3">
					<h4>매장 명</h4>
				</div>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="store_name" id="store_name" readonly>
					<input type="hidden" name="store_id" id="store_id">
				</div>
				
				<div class="col-sm-5">
					<div class="dropdown">
					  <button class="btn btn-md btn-secondary" type="button" data-toggle="dropdown">매장 선택
					  <span class="caret"></span></button>
					  <div style="width:500px;">
					  <ul class="dropdown-menu">
					    <li>
					    	<div class="row">
							    <div class="col">
									<input class="btn btn-md btn-secondary" type="button" value="주소검색" onclick="searchStore()">
								</div>
								<div class="col">
									<input class="form-control" type="text" name="keyword" id="keyword">
								</div>
							</div>
						</li>
						<br>
					    <li>
							<div class="row">
								<div class="col">
									<input class="btn btn-md btn-secondary" type="button" value="매장명검색" onclick="searchStoreByName()">
								</div>
								<div class="col">
									<input class="form-control" type="text" name="keyword" id="keywordName">
								</div>
							</div>
					    </li>
					    <br>
					    <li>
					    	<div class="row">
					    		<div class="col">
									<input class="btn btn-md btn-secondary" type="button" value="현재위치 근처 매장" onclick="searchStoreByLocation()">
								</div>
							</div>
					    </li>
					    <br>
					    <li>
					    	<div class="row">
					    		<div class="col">
									<input class="btn btn-md btn-secondary" type="button" value="입력된 주소 근처 매장" onclick="searchStoreByAddress()">
								</div>
							</div>
					    </li>
					    <br>
					  </ul>
					  </div>
					</div>
					
				</div>
				
			</div>
			
		</div>
		</div>
		
		<div id="cus_pay_col" class="col">
			<div class="row">
				<div class="col">
					<h4>주문하신 메뉴</h4>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="row" id="ordered_menus"></div>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
						<input class="btn btn-md btn-secondary" type="submit" value="주문" style="width:300px;">
						&nbsp;
						<input class="btn btn-md btn-secondary" type="reset" value="닫기" style="width:200px;">
				</div>
			</div>
		</div>
	</div>
</form>
</div>

<%@include file="/cus/cus_scrollableFooter.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84ade146f4c88c0cf4ae826cc2f4eec8&libraries=services"></script>
<script>
setMenusForPay('sessionStorage');

</script>
<script>
$(document).ready(function(){
    $("#currentLocation").click(function(){
    });
});
</script>