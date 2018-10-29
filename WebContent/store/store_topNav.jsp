<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>
<!-- Sub-Navigation Bar, in place of Side Panel -->
<c:if test="${sessionScope.store_id ne null}">
	<nav class="navbar sticky-top navbar-expand-lg bg-dark justify-content-center">
		<ul class="navbar-nav" id="subNavbar">
			<li class="nav-item">
				<a class="nav-link active text-white ml-5 mr-5" href="Store_main.do">메인</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active text-white ml-5 mr-5" href="Store_order_check.do">현재주문확인</a>
			</li>
			<li class="nav-item">
				<a class="nav-link text-white ml-5 mr-5" href="Store_orders_location.do">모든 주문위치</a>
			</li>
			<li class="nav-item">
				<a class="nav-link text-white ml-5 mr-5" href="#">날씨확인</a>
			</li>
			<li class="nav-item">
				<a class="nav-link text-white ml-5 mr-5" href="Store_modify_form.do">회원정보수정</a>
			</li>
		</ul>
	</nav>
</c:if>