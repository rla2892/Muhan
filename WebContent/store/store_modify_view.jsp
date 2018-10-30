<%@page import="db.store_member.Store_member_DataBean"%>
<%@page import="db.store_member.Store_member_DBBean"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>
<jsp:include page="store_topNav.jsp" flush="false"/>

<style type="text/css">
body{
  background-color: #4A8DCA;
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: 'Open Sans', 'Helvetica', sans-serif; 
  width: 100%;
}
.container{
  background-color: #f9f9f9;
  border-radius: 5px;
  padding: 40px 50px 40px 50px;
}

form h1{
  font-size: 24px;
  font-weight: 300;
  margin-bottom: 30px;
  text-align: center;
  text-transform: none;
}

form h2{
  color: #444;
  font-size: 10px;
  font-weight: 700;
  margin-bottom: 10px;
  text-align: left;
}

form input{
  border: 1px solid #ddd;
  border-radius: 3px;
  color: #888;
  display: block;
  font-size: 12px;
  margin-bottom: 30px;
  padding: 0px 10px;
  height: 35px;
  width: 250px;
}
form input:focus{
  outline: none;
  border-color: #ccc;
}

::-webkit-input-placeholder {
  color: #bbb;
  font-size: 10px;
  line-height: 16px;
}
form .button{
  background-color: #4A8DCA;
  border: none;
  border-radius: 3px;
  color: #fff;
  font-size: 12px;
  font-weight: 700;
  letter-spacing: .5px;
  height: 50px;
  width: 270px;
  margin-bottom: 20px;
  -webkit-transition: all 400ms ease;
          transition: all 400ms ease;
}

form .button:focus{
  outline: none;
}

form .button:hover{
  background-color: #67A84F;
}
</style>

<c:if test="${result eq 1}">
<main>
<div class="container">
<form name="storemodifyform" class="form_contact" method="post" action="Store_modify_pro.do" onsubmit="return modifycheck()">
	<h1>${msg_modify}</h1>
	
	<h2>${str_store_name}</h2>
	<input type="text" name="store_name" value="${store_member_dto.store_name}" disabled>
	
	<h2>${str_store_id}</h2>
	<input type="text" name="store_id" value="${store_member_dto.store_id}" disabled>
	
	<h2>${str_storepasswd}</h2>
	<input type="password" name="store_pw" maxlength="15"
						value ="${store_member_dto.store_pw}">
	<input type="password" name="store_repasswd" maxlength="15"
						value ="${store_member_dto.store_pw}">
	
	<h2>${str_store_address}</h2>
	<input type="text" name="store_address" value="${store_member_dto.store_address}" disabled>
	<input type="hidden" name="store_address" value="${store_member_dto.store_address}">
	
	<h2>${str_store_tel}</h2>
	<input type="tel" name="store_tel" value="${store_member_dto.store_tel}">
	
	<h2>${str_owner_email}</h2>
	<input class="email" type="text" name="owner_email" maxlength="15"
				value="${store_member_dto.owner_email}">
	
	<h2>${str_owner_name}</h2>
	<input type="text" name="owner_name" maxlength="15"
				value="${store_member_dto.owner_name}">
				
	<h2>${str_owner_tel}</h2>
	<input type="tel" name="owner_tel" maxlength="15"
				value="${store_member_dto.owner_tel}">
				
	<h2>${str_owner_reg_date}</h2>
	<input type="text" value="<fmt:formatDate value="${store_member_dto.owner_reg_date}" pattern="yyyy-MM-dd HH:mm"/>">
	
	<button class="button" type="submit">${btn_mod}</button>
	<br>
	<button class="button" onclick="location='Store_main.do'">${btn_mod_cancel}</button>
	
</form>
</div>
</main>
</c:if>

<c:if test="${result eq -1}">
	<script type="text/javascript">
		<!--
		erroralert(loginpasswderror);
		-->
	</script>
</c:if>