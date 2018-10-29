<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>

<html>
	<head>
		<%@include file="/cus/cus_head.jsp"%>
	</head>
<style>
	#a{
		margin-top:100px;
	}

</style>
	<body>
		<%@include file="/cus/cus_topNav.jsp"%>
		<%@include file="/cus/cus_member/cus_member_subNav.jsp" %>
  
	<div class="mx-auto" id="a" style="width: 1000px;" >
		<!-- <div class="page-header text-center">
    	    <h1>회원수정</h1>
        </div> -->
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h1>아이디</h1></div>
	 		<div class="col-md-9 bg-dark text-white rounded-right text-center"><h1>${customer_member_dto.cus_id}</h1></div>
	 	</div><br>
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h1>비밀번호</h1></div>
	 		<div class="col-md-9 bg-dark text-white	rounded-right text-center"><h1>******</h1></div>
	 	</div><br>
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h1>닉네임</h1></div>
	 		<div class="col-md-9 bg-dark text-white rounded-right text-center"><h1>${customer_member_dto.cus_nickname}</h1></div>
	 	</div><br>
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h1>주소</h1></div>
	 		<div class="col-md-9 bg-dark text-white rounded-right"><h1>${customer_member_dto.cus_address}</h1></div>
	 	</div><br>
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h1>상세주소</h1></div>
	 		<div class="col-md-9 bg-dark text-white rounded-right"><h1>${customer_member_dto.cus_address2}</h1></div>
	 	</div><br>
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h1>이메일</h1></div>
	 		<div class="col-md-9 bg-dark text-white rounded-right text-center"><h1>${customer_member_dto.cus_email}</h1></div>
	 	</div><br>
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded"><h1>전화번호</h1></div>
	 		<div class="col-md-9 bg-dark text-white rounded text-center"><h1>${customer_member_dto.cus_tel}</h1></div>
	 	</div><br>
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded"><h1>상세주소</h1></div>
	 		<div class="col-md-9 bg-dark text-white rounded text-center"><h1>${customer_member_dto.cus_reg_date}</h1></div>
	 	</div><br>
	 </div>
	
	
			<!-- Fixed Footer: 붙이는 위치가 Scrollable Footer와는 다릅니다! Fixed Footer는 중단 Container 안에 넣어주셔야 합니다. --> 
			<%@include file="/cus/cus_fixedFooter.jsp"%>
		
	</body>
</html>