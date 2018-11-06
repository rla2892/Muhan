<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>

<c:if test="${sessionScope.store_id eq null}">
	<jsp:include page="store_topNav.jsp" flush="false"/>
	<main>
		<c:import url="/Store_login_form.do"/>
	</main>
</c:if>

<c:if test="${sessionScope.store_id ne null}">
	<jsp:include page="store_topNav.jsp" flush="false"/>
	<main>
		<c:import url="/Store_login.do"/>
	</main>
</c:if>