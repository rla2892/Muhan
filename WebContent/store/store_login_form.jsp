<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br>
<br>
<br>
<br>
<br>
<div class="container" style="position: relative;
  display: inline-flex;
  align-self: center;
  padding: 50px 40px;
  background: #F7FFF7;
  border-radius: 4px;
  box-shadow: 0 26px 60px rgba(0,0,0,.1);">
<img src="/Muhan/store/login.png">
<form class="form-vertical" name="storeloginform" method="post" action="Store_login_pro.do" onsubmit="return logincheck()">
	<div class="form-signin">
		<input class="form-control mb-3" type="text" name="store_id" placeholder="ID를 입력해주세요" autofocus required>
	</div>
	
	<div class="form-signin">
		<input class="form-control mb-3" type="password" name="store_pw" placeholder="비밀번호를 입력해주세요" required>
	</div>
	
	<div class="form-signin">
		<input class="btn btn-lg btn-primary btn-block mb-1" type="submit" value="로그인">
	</div>
</form>

</div>