<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <script src="cus/cus_cart/cus_cart_script.js"></script> -->
<%@include file="/cus/cus_cart/cus_script_for_cart.jsp"%>

<div id="ordered_menus"></div>
<a href="cus_pay.do" class="btn btn-warning submitOrder" role="button" onclick="orderCartItems()"><strong>바로 주문하기</strong></a>

<script type="text/javascript">
	setMenus('localStorage');	
</script>