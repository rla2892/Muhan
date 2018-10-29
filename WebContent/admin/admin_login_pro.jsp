<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="project" value="/Muhan/admin/"/>
<script src="${project}script.js"></script>

<h2> admin_login_pro </h2>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		erroralert( "아이디가 없습니다." );
		//-->
	</script>
</c:if>
<c:if test="${result eq -1}">
	<script type="text/javascript">
		<!--
		erroralert( "비밀번호가 다릅니다." );
		//-->
	</script>
</c:if>
<c:if test="${result eq 1}">
	${sessionScope.memid = id}
	<c:redirect url="Admin_main.do"/>	
</c:if>