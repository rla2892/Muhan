<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		erroralert( loginiderror );
		//-->
	</script>
</c:if>
<c:if test="${result eq -1}">
	<script type="text/javascript">
		<!--
		erroralert( loginpasswderror );
		//-->
	</script>
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="cus_user_main.do"/>	
</c:if>