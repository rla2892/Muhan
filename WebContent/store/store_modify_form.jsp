<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
<jsp:include page="store_topNav.jsp" flush="false"/>
<script src="${project}script.js"></script>
<style type="text/css">
<!--
body{
  margin: 0;
  padding: 0;
  border: 0;
  background-color: #4A8DCA;
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: 'Open Sans', 'Helvetica', sans-serif; 
  overflow: hidden;
  width: 100%;
  height: 100vh;
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

form label{
  display: inline-block;
}

form .modifybutton{
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

form .modifybutton:focus{
  outline: none;
}

form .modifybutton:hover{
  background-color: #67A84F;
}
-->
</style>

<main>
<div class="container">
	<form name="storepasswdform" class="form_contact" method="post" action="Store_modify_view.do" onsubmit="return passwdcheck()">
	<h1> 점주 정보 수정 페이지 </h1>
		<h2>${str_storepasswd}</h2>
		<input type="password" name="store_pw" maxlength="20" placeholder="비밀번호를 입력해주세요" autofocus>
		<button class="modifybutton" type="submit">${btn_mod}</button>
		<br>
		<button class="modifybutton" type="button" onclick="location='Store_main.do'">${btn_mod_cancel}</button>
	</form>
</div>
</main>