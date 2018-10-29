<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<script src="${project}script.js"></script>


<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		erroralert( "삭제 실패" );
		//-->
	</script>
	<meta http-equiv="refresh" content="0; url=Admin_review_find.do">
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="Admin_review_find.do"/>	
</c:if>