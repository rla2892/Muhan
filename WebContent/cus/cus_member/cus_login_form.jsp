<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_head.jsp"%>
<%@include file="/cus/cus_topNav.jsp"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/cus/cus_script.jsp"%>
    <style>
body {
  height: 100%;
}

body {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}
.btn {
  background-color: #232F34;
}

.form-signin {
  width: 100%;
  max-width: 440px;
  padding: 15px;
  margin-top: 10px;
  margin-left: 530px;
  margin-bottom: 500px;
  margin-right: 300px;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

 </style>
	</head>
	<body class="login" onload="loginfocus()">
			<form class="form-signin" name="loginform" method="post" role="form" action="cus_login_pro.do" onsubmit="return logincheck()">
  				<img class="pt-0 mt-0 mb-6" src="/Muhan/cus/cus_images/lot.png" alt="logo" width="400" height="250">
  				<input type="text" id="cus_id" name="cus_id" class="form-control" 
     				placeholder="아이디" required autofocus>
 	 				<script type="text/javascript">
						window.onload=function() {
							var localId=localStorage.getItem('cus_id');
							if(localId) {
								loginform.cus_id.value=localId;
							} 							
						}
					</script>
 	 				<input type="password" id="inputPassword" name="cus_pw" class="form-control" 
 	 				placeholder="비밀번호" required>
  		
				<div class="checkbox">
					<label><input type="checkbox" name="rememberMe" value="checked" checked>내 아이디 기억하기</label>
				</div>
				
				<input type="hidden" name="identifier" value="${identifier}">
				<!-- 0: 일반 로그인 / 1: 바로 주문하기를 통해서 로그인 페이지에 접근한 경우 -->
				<button class="btn btn-success btn-block" type="submit">로그인</button>
				
				<!-- <button type="submit" class="btn btn-success btn-block">
					<span class="text-dark font-weight-bold">로그인</span>
				</button> -->
				<div class="form-group">
					<button type="button" class="btn btn-success btn-block" id="joinButton">		
						회원가입
					</button>
					<button type="button" class="btn btn-success btn-block" id="findIdPwButton"     style="margin-top: 0px">		
						아이디/패스워드 찾기
					</button>
				</div>
			</form>
		
			<!-- Fixed Footer: 붙이는 위치가 Scrollable Footer와는 다릅니다! Fixed Footer는 중단 Container 안에 넣어주셔야 합니다. --> 
			<%@include file="/cus/cus_fixedFooter.jsp"%>
	</body>
</html>