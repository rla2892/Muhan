<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>

<script>
localStorage.removeItem("order");
sessionStorage.removeItem("order");
window.location.href = 'cus_user_main.do';
</script>

