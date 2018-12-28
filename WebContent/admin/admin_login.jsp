<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="./jquery-3.3.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
  
</head>
<body class="registration" style="margin-top: 280px;">
<div class="container" style="width: 600px">
<c:set var="project" value="/Muhan/admin/"/>

<div class="container">
	<form id="style" method="post" action="Admin_login_pro.do" name="loginform" onsubmit="return logincheck()">
		<h3>관리자용 로그인 페이지</h3>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label" for="id">아이디</label>
			<div class="col-sm-8">
				<input class="form-control" type="text" name="id" id="id" maxlength="15" autofocus="autofocus" placeholder="아이디">
			</div>
			<div class="col-sm-2">
				<input class="btn btn-primary" type="submit" value="로그인">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label" for="passwd">비밀번호</label>
			<div class="col-sm-8">
				<input class="form-control" type="password" name="passwd" id="passwd" maxlength="15" placeholder="비밀번호">
			</div>
			<div class="col-sm-2">
				<input class="btn btn-primary" type="reset" value="취소">
			</div>
		</div>
	</form>
</div>
</div>
</body>