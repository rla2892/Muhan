<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>

<!-- <link rel="stylesheet" type="text/css" href="/Muhan/cus/cus_theme.css"> -->
		
		<%@include file="/cus/cus_topNav.jsp"%>
		<%@include file="/cus/cus_member/cus_member_subNav.jsp"%>
		
		<!-- Container -->
	
	<body>
	<div class="container mt-1 pt-5"> 
		<table class="table table-sm table-responsive-lg table-striped table-hover text-center mt-2 mb-5">
				<thead>
					<tr>
						<th scope="col" class="order_no" colspan="3">
							주문 번호               :          ${order_no}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							주문 날짜               :          ${order_date}
						</th>
					</tr>
					<tr>
						<th scope="col" class="menu_name">아이템</th>
						<th scope="col" class="order_qnt">수량</th>
						<th scope="col" class="menu_price">금액</th>
					</tr>
				</thead>
				<c:set var="total" value="0"/>
				<c:forEach var="orderdetailbycus" items="${orderdetailsbycus}">
					<tr class="">
						<td scope="row">
							${orderdetailbycus.menu_name}
						</td>
						<td scope="row">
							${orderdetailbycus.order_qnt}
						</td>
						<td scope="row">
							<c:set var="sum" value="${orderdetailbycus.order_qnt * orderdetailbycus.menu_price }"/>
							<c:out value="${sum}"/>
							<c:set var="total" value="${total + sum}"/>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td scope="row" colspan="2">
						<b>총 금액</b>
					</td>
					<td scope="row">
						<c:out value="${total}"/>
					</td>
				</tr>
			</table>	
					
			</div>
			<div class="col-sm3"style="text-align:center;">
			<button class="btn btn-secondary"onclick="window.location.href='cus_car_view.do?order_no=${order_no}'">배달 현황</button>
		</div>
		<%@include file="/cus/cus_fixedFooter.jsp"%>
