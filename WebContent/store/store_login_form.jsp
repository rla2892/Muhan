<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
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

form .loginbutton{
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

form .loginbutton:focus{
  outline: none;
}

form .loginbutton:hover{
  background-color: #67A84F;
}
-->
</style>
<div class="container">
	<form name="storeloginform" method="post" action="Store_login_pro.do" onsubmit="return logincheck()">
		<h1>Log In</h1>
		<h2>아이디</h2>
			<input type="text" name="store_id" placeholder="ID를 입력해주세요" autofocus required>
		<h2>비밀번호</h2>
			<input type="password" name="store_pw" placeholder="비밀번호를 입력해주세요" required>
			
		<input type="submit" class="loginbutton" value="로그인">
	</form>
</div>