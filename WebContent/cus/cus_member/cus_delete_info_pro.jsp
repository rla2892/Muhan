<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>
    
<h2>cus_delete_info_pro.jsp</h2>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		alert( "실패" );
	</script>
	<meta http-equiv="refresh" content="0; url=cus_user_main.do">
</c:if>
<c:if test="${result eq 1}">
	${sessionScope.cus_id = null}
	<script type="text/javascript">
		alert( "성공" );
		sessionStorage.removeItem('cus_id');
	</script>
	<meta http-equiv="refresh" content="0; url=cus_user_main.do">
</c:if>



