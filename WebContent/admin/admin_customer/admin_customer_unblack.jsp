<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../setting.jsp" %>
<script src="${project}script.js"></script>


<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		erroralert( "블랙 회원이 아닙니다." );
		//-->
	</script>
	<meta http-equiv="refresh" content="0; url=Admin_customer_find.do">
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="Admin_customer_detail.do?cus_id=${cus_id}"/>	
</c:if>