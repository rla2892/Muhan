<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="db.store_member.Store_member_DBBean"%>
    
<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<h2>Store Modify Pro</h2>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		//<!--
		alert( modifyerror );
		//-->
	</script>
	<meta http-equiv="refresh" content="0, url=Store_main.do">
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="Store_main.do"/>
</c:if>