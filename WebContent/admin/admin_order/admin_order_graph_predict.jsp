<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>

<%@ include file="../../admin/admin_ui/admin_aside_order.jsp" %>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- 일,월,년,전체 타임스케일 -->
<input type="hidden" name="time_scale" id="time_scale" value="${param.time_scale}">

<!-- 기본 데이터 -->
<c:forEach var="time_sale" items="${time_sales}">
	<input type="text" name="time_sale_key" value="${time_sale.key}">
	<input type="text" name="time_sale_value" value="${time_sale.value}">
</c:forEach>
<!-- 누적 데이터 -->
<c:forEach var="time_sale_cumul" items="${time_sales_cumul}">
	<input type="text" name="time_sale_cumul_key" value="${time_sale_cumul.key}">
	<input type="text" name="time_sale_cumul_value" value="${time_sale_cumul.value}">
</c:forEach>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>
