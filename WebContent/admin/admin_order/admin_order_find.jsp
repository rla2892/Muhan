<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>

<%@ include file="../../admin/admin_ui/admin_aside_order.jsp" %>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<h2>전체</h2>

<table>
	<c:forEach var="order_history_dto" items="${order_history_dtos}">
		<tr>
			<td>${order_history_dto.order_no}</td>
			<td>${order_history_dto.order_qnt}</td>
			<td>${order_history_dto.order_date}</td>
			<td>${order_history_dto.menu_id}</td>
			<td>${order_history_dto.cus_id}</td>
			<td>${order_history_dto.store_id}</td>
			<td>${order_history_dto.order_status}</td>
		</tr>	
	</c:forEach>
</table>


<h2>cus_id</h2>
<table>
	<c:forEach var="order_history_dto2" items="${order_history_dtos2}">
		<tr>
			<td>${order_history_dto2.order_no}</td>
			<td>${order_history_dto2.order_qnt}</td>
			<td>${order_history_dto2.order_date}</td>
			<td>${order_history_dto2.menu_id}</td>
			<td>${order_history_dto2.cus_id}</td>
			<td>${order_history_dto2.store_id}</td>
			<td>${order_history_dto2.order_status}</td>
		</tr>	
	</c:forEach>
</table>

<h2>store_id</h2>
<table>
	<c:forEach var="order_history_dto3" items="${order_history_dtos3}">
		<tr>
			<td>${order_history_dto3.order_no}</td>
			<td>${order_history_dto3.order_qnt}</td>
			<td>${order_history_dto3.order_date}</td>
			<td>${order_history_dto3.menu_id}</td>
			<td>${order_history_dto3.cus_id}</td>
			<td>${order_history_dto3.store_id}</td>
			<td>${order_history_dto3.order_status}</td>
		</tr>	
	</c:forEach>
</table>

<h2>order_no</h2>
<table>
	<c:forEach var="order_history_dto4" items="${order_history_dtos4}">
		<tr>
			<td>${order_history_dto4.order_no}</td>
			<td>${order_history_dto4.order_qnt}</td>
			<td>${order_history_dto4.order_date}</td>
			<td>${order_history_dto4.menu_id}</td>
			<td>${order_history_dto4.cus_id}</td>
			<td>${order_history_dto4.store_id}</td>
			<td>${order_history_dto4.order_status}</td>
		</tr>	
	</c:forEach>
</table>

<h2>order_info</h2>
<table>
		<tr>
			<td>${order_history_dto5.order_no}</td>
			<td>${order_history_dto5.order_date}</td>
			<td>${order_history_dto5.cus_id}</td>
			<td>${order_history_dto5.store_name}</td>
			<td>${order_history_dto5.order_status}</td>
		</tr>	
</table>

<h2>order_menu</h2>
<table>
	<c:forEach var="order_history_dto6" items="${order_history_dtos6}">
		<tr>
			<td>${order_history_dto6.order_qnt}</td>
			<td>${order_history_dto6.menu_name}</td>
			<td>${order_history_dto6.menu_price}</td>
		</tr>	
	</c:forEach>
</table>

<h2>pay</h2>
<table>
	<tr>
		<td>${pay}</td>
	</tr>
</table>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>