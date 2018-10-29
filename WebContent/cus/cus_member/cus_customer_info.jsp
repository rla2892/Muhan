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
  
	<div class="mx-auto" id="a" style="width: 800px;" >
		<!-- <div class="page-header text-center">
    	    <h5>회원수정</h5>
        </div> -->
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h5>아이디</h5></div>
	 		<div class="col-md-9 bg-dark text-white rounded-right text-center"><h5>${customer_member_dto.cus_id}</h5></div>
	 	</div><br>
	 	
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h5>닉네임</h5></div>
	 		<div class="col-md-9 bg-dark text-white rounded-right text-center"><h5>${customer_member_dto.cus_nickname}</h5></div>
	 	</div><br>
	 	
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h5>성별</h5></div>
	 		<div class="col-md-9 bg-dark text-white	rounded-right text-center"><h5>
	 			
	 				<c:if test="${customer_member_dto.cus_gender eq 1 }">	<!-- 성별 기능 -->	 
						남자
	 				</c:if>
	 				<c:if test="${customer_member_dto.cus_gender eq 2 }">
	 						여자
	 				</c:if>
	 		</h5></div>
	 	</div><br>
	 	
	 	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h5>생년월일</h5></div>
	 		<div class="col-md-9 bg-dark text-white	rounded-right text-center"><h5>
	 		
	 			<fmt:formatDate value="${customer_member_dto.cus_birth}" type="both" pattern="yyyy-MM-dd"/>  <!-- 날짜출력(timestamp) 형식 바꿈 jstl태그이용 -->
	 			
	 		</h5></div>
	 	</div><br>
	 	
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h5>주소</h5></div>
	 		<div class="col-md-9 bg-dark text-white rounded-right text-center"><h5>${customer_member_dto.cus_address}</h5></div>
	 	</div><br>
	 	
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h5>상세주소</h5></div>
	 		<div class="col-md-9 bg-dark text-white rounded-right text-center"><h5>${customer_member_dto.cus_address2}</h5></div>
	 	</div><br>
	 	
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded-left"><h5>이메일</h5></div>
	 		<div class="col-md-9 bg-dark text-white rounded-right text-center"><h5>${customer_member_dto.cus_email}</h5></div>
	 	</div><br>
	 	
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded"><h5>전화번호</h5></div>
	 		<div class="col-md-9 bg-dark text-white rounded text-center"><h5>${customer_member_dto.cus_tel}</h5></div>
	 	</div><br>
	 	
	 	<div class="row">
	 		<div class="col-md-3 bg-secondary text-white rounded"><h5>가입일자</h5></div>
	 		<div class="col-md-9 bg-dark text-white rounded text-center"><h5>
	 			<fmt:formatDate value="${customer_member_dto.cus_reg_date}" type="both" pattern="yyyy-MM-dd"/></h5> 
	 	</div><br>
		 </div>
	
	</div>
			<!-- Fixed Footer: 붙이는 위치가 Scrollable Footer와는 다릅니다! Fixed Footer는 중단 Container 안에 넣어주셔야 합니다. --> 
			<%@include file="/cus/cus_fixedFooter.jsp"%>
		
	</body>
</html>