<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp"%>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		erroralert( "리뷰 실패" );
		//-->
	</script>
	<meta http-equiv="refresh" content="0; url=cus_user_main.do">
</c:if>
<c:if test="${result eq 1}">
	<c:redirect url="cus_review.do"/>	
</c:if>