<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_head.jsp"%>
<%@include file="/cus/cus_topNav.jsp"%>
<%@include file="/cus/cus_script.jsp"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="./jquery-3.3.1.js"></script>
<script src="/Muhan/cus/cus_member/cus_join_checking_script.js"></script>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<style type="text/css">
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
  margin: auto;
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
			<form class="form-signin" name="loginform" method="post" role="form" action="cus_login_pro.do" onsubmit="return logincheck()" style="margin-top: 10px;">
  				<img class="pt-0 mt-0 mb-4" src="/Muhan/cus/cus_images/lot-MH.png" alt="logo" width="400" height="250">
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
					<button class="btn btn-lg btn-secondary btn-block" type="submit">로그인</button>
				
				<div class="form-group">
					<button type="button" class="btn btn-lg btn-secondary btn-block" id="joinButton">		
						회원가입
					</button>
					<button type="button" class="btn btn-lg btn-secondary btn-block" id="findIdPwButton"     style="margin-top: 0px">		
						아이디/패스워드 찾기
					</button>
				</div>
			</form>
		
			<!-- Fixed Footer: 붙이는 위치가 Scrollable Footer와는 다릅니다! Fixed Footer는 중단 Container 안에 넣어주셔야 합니다. --> 
			<%@include file="/cus/cus_fixedFooter.jsp"%>
	</body>
</html>