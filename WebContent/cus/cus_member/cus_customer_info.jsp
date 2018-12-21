<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<script src="cus/cus_member/cus_join_checking_script.js"></script>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp"%>
<%@include file="/cus/cus_head.jsp"%>
<%@include file="/cus/cus_topNav.jsp"%>
<%@include file="/cus/cus_member/cus_member_subNav.jsp" %>
<style>
	#a{
		margin-top:30px;
	}

</style>
</head>
<article class="container">
      
        <div class="mx-auto" style="width: 700px" id="a">

 	<form class="form-horizontal" name="joinform" >
	
    	    <h2 class="text-left text-dark" >${customer_member_dto.cus_id}님의 정보</h2>
      
        <br><br>
         <div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">아이디</label>
				<div class="col-sm-8"><input class="form-control" style="border:0 padding-top:2; text-align:center;" type="text" value="${customer_member_dto.cus_id}" readonly></div>
		</div>
	 	
	 	<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">닉네임</label>
				<div class="col-sm-8"><input class="form-control" style="border:0 padding-top:2; text-align:center;"  type="text" value="${customer_member_dto.cus_nickname}" readonly></div>
		</div>
		
		<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">성별</label>
		<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;"
		value="<c:if test="${customer_member_dto.cus_gender eq 1 }">남자</c:if>
<c:if test="${customer_member_dto.cus_gender eq 2 }">여자</c:if>" readonly>
	 	</div>
		</div>
		
		 <div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">생년월일</label>
				<div class="col-sm-8"><input class="form-control" style="border:0 padding-top:2; text-align:center;" type="text" value="<fmt:formatDate value="${customer_member_dto.cus_birth}" type="both" pattern="yyyy-MM-dd"/>" readonly></div>
		
		<div class="form-group row">
		       <label for="age" class="col-sm-3 col-form-label">나이</label>
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="만${age}세" readonly></div>
		</div>	
	 	 	
	 	<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">주소</label>
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="${customer_member_dto.cus_address}" readonly></div>
		</div>
		
		<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">상세주소</label>
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="${customer_member_dto.cus_address2}" readonly></div>
		</div>
	 	
	 	<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">이메일</label>
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="${customer_member_dto.cus_email}" readonly></div>
		</div>
		
		<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">전화번호</label>
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="${customer_member_dto.cus_tel}" readonly></div>
		</div>
	 	
	 	<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">가입일자</label>
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="<fmt:formatDate value="${customer_member_dto.cus_reg_date}" type="both" pattern="yyyy-MM-dd"/>" readonly></div>
		</div>
			<!-- Fixed Footer: 붙이는 위치가 Scrollable Footer와는 다릅니다! Fixed Footer는 중단 Container 안에 넣어주셔야 합니다. --> 
			
				</form>
				
			</div>
	</article>
	<%@include file="/cus/cus_scrollableFooter.jsp"%>

</html>