<%@page import="db.store_member.Store_member_DataBean"%>
<%@page import="db.store_member.Store_member_DBBean"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>
<jsp:include page="store_topNav.jsp" flush="false"/>

<link rel="stylesheet" type="text/css" href="${project}form.css">
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">

<c:if test="${result eq 1}">
<form name="storemodifyform" class="form_contact" method="post" action="Store_modify_pro.do" onsubmit="return modifycheck()">
	<h3>${msg_modify}</h3>
	
	<label>${str_store_name}</label>
	<input class="input" type="text" name="store_name" value="${store_member_dto.store_name}" disabled>
	
	<label>${str_store_id}</label>
	<input class="input" type="text" name="store_id" value="${store_member_dto.store_id}" disabled>
	
	<label>${str_storepasswd}</label>
	<input class="input" type="password" name="store_pw" maxlength="15"
						value ="${store_member_dto.store_pw}">
	<input class="input" type="password" name="store_repasswd" maxlength="15"
						value ="${store_member_dto.store_pw}">
	
	<label>${str_store_address}</label>
	<input class="input" type="text" name="store_address" value="${store_member_dto.store_address}" disabled>
	<input type="hidden" name="store_address" value="${store_member_dto.store_address}">
	
	<label>${str_store_tel}</label>
	<input class="input" type="tel" name="store_tel" value="${store_member_dto.store_tel}">
	
	<label>${str_owner_email}</label>
	<input class="email" type="text" name="owner_email" maxlength="15"
				value="${store_member_dto.owner_email}">
	
	<label>${str_owner_name}</label>
	<input class="input" type="text" name="owner_name" maxlength="15"
				value="${store_member_dto.owner_name}">
				
	<label>${str_owner_tel}</label>
	<input class="input" type="tel" name="owner_tel" maxlength="15"
				value="${store_member_dto.owner_tel}">
				
	<label>${str_owner_reg_date}</label>
	&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${store_member_dto.owner_reg_date}" pattern="yyyy-MM-dd HH:mm"/>
	
	<button type="submit">${btn_mod}</button>
	<button onclick="location='Store_main.do'">${btn_mod_cancel}</button>
	
</form>
</c:if>

<c:if test="${result eq -1}">
	<script type="text/javascript">
		<!--
		erroralert(loginpasswderror);
		-->
	</script>
</c:if>