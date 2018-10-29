<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_script.jsp"%>

<!-- Sub-Navigation Bar, in place of Side Panel -->
<nav class="navbar sticky-top navbar-expand-lg bg-dark justify-content-center">
	<ul class="navbar-nav" id="subNavbar">
		<li class="nav-item">
			<a class="nav-link text-white ml-5 mr-5" href="cus_store.do">매장 찾기</a>
		</li>
		<li class="nav-item">
			<a class="nav-link text-white ml-5 mr-5" href="Cus_store_map.do">전국 매장</a>
		</li>
		<li class="nav-item">
			<a class="nav-link text-white ml-5 mr-5" href="Cus_store_mylocation.do">가까운 매장</a>
		</li>
		<li class="nav-item">
			<a class="nav-link text-white ml-5 mr-5" href="Cus_store_road.do">근처 매장 가는 길</a>
		</li>
	</ul>
</nav>