<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>

<html>
	<head>
	<%@include file="/cus/cus_head.jsp"%>
	</head>
	<body>
		<%@include file="/cus/cus_topNav.jsp"%>
		
		<!-- Descriptor Jumbotron -->
		<div class="jumbotron mt-1">
			<h1 class="display-5 text-center font-weight-bold pt-4">주문 이력</h1>
		</div>
		
		<%@include file="/cus/cus_member/cus_member_subNav.jsp"%>
		
		<!-- Container -->
		<div class="container-fluid mt-5 pt-5 col-lg-9">

 		<c:if test="${result eq 0}">
			주문 이력이 없습니다.
		</c:if>	
		
		<c:if test="${result ne 0}">
			<table class="table table-sm table-responsive-lg table-striped table-hover text-center mt-3 mb-3">
				<thead>
					<tr>
						<th scope="col" class="order_no">주문번호</th>
						<th scope="col" class="order_date">날짜</th>
						<th scope="col" class="menu_name">주문내역</th>
					</tr>
				</thead>
		<c:forEach var="i" begin="0" end="${fn:length(cusorderlist)-1}" step="1">
			<c:set var="count" value="${counts[i]}"/>
			<c:set var="cusorder" value="${cusorderlist[i]}"/>
					<tr class="clickableRow" data-href="cus_detailed_order_history.do?order_no=${cusorder.order_no}&order_date=${cusorder.order_date}">
						<td scope="row">
							${cusorder.order_no}
						</td>
						<td scope="row">
						<fmt:formatDate value="${cusorder.order_date}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<c:if test="${count eq 1}">
							<td scope="row">
								${cusorder.menu_name}
							</td>
						</c:if>
						<c:if test="${count gt 1}">
							<td scope="row">
								${cusorder.menu_name} 외 ${count} 건
							</td>
						</c:if>
					</tr>
				</c:forEach>

			</table>
		</c:if>
			<%@include file="/cus/cus_fixedFooter.jsp"%>
		</div>
	</body>
</html>