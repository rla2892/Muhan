<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<c:set var="project" value="/Muhan/admin/"/>

<%-- 
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>
--%>
<div class="container">
	<form method="post" action="Admin_login_pro.do" name="loginform" onsubmit="return logincheck()">
		<h3>관리자용 로그인 페이지</h3>
		<div class="form-group row">
			<div class="col-xs-1">
				<label for="id">아이디</label>
			</div>
			<div class="col-xs-2">
				<input class="input" type="text" name="id" id="id" maxlength="15" autofocus="autofocus">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-1">
				<label for="passwd">비밀번호</label>
			</div>
			<div class="col-xs-2">
				<input class="input" type="password" name="passwd" id="passwd" maxlength="15">
			</div>
		</div>
		
		<div class="form-group row">
			<input class="btn btn-primary" type="submit" value="로그인">
			<input class="btn btn-primary" type="reset" value="취소">
		</div>
	</form>
</div>