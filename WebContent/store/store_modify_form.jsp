<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>

<jsp:include page="store_topNav.jsp" flush="false"/>
<link rel="stylesheet" type="text/css" href="${project}form.css">
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
<script src="${project}script.js"></script>

<body>
	<form name="storepasswdform" class="form_contact" method="post" action="Store_modify_view.do" onsubmit="return passwdcheck()">
	<h3> 점주 정보 수정 페이지 </h3>
		<label>${str_storepasswd}</label>
		<input type="password" name="store_pw" maxlength="20" placeholder="비밀번호를 입력해주세요" autofocus>
		<button type="submit">${btn_mod}</button>
		<button type="button" onclick="location='Store_main.do'">${btn_mod_cancel}</button>
	</form>
</body>