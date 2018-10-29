<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>
<h2>cus_modify_info_pro.jsp</h2>

<c:if test="${result eq 0}">
	alert("수정 에러")
</c:if>
<c:if test="${result eq 1}">
	
	<c:redirect url="cus_user_main.do"/> 
</c:if>
	
	
