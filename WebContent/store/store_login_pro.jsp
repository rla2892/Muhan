<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.store_member.Store_member_DBBean"%>
    
<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<h2>Store Login Pro </h2>

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
		${sessionScope.store_id = store_id}
		${sessionScope.store_name = store_member_dto.store_name}
		<c:redirect url="Store_main.do"/>
</c:if>