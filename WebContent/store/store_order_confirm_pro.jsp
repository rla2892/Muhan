<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>

<h2>Store Order Confirm Pro</h2>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		//<!--
		alert( completeerror );
		//-->
	</script>
	<meta http-equiv="refresh" content="0, url=Store_order_check.do">
</c:if>
<c:if test="${result gt 0}">
	<c:redirect url="Store_order_email_pro.do?order_no=${order_no}"/>
</c:if>