<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>

<link rel="stylesheet" type="text/css" href="/Muhan/cus/cus_theme.css">

<%@include file="/cus/cus_topNav.jsp"%>
<%@include file="/cus/cus_member/cus_member_subNav.jsp"%>
<style>
#a{
	margin-top:100px; 
}
</style>				
		<!-- Container -->
		<div class="container max-auto"  id="a" style="width:1000px;">
			
			
			<form method="post" name="modify_info_form" action="cus_delete_info_pro.do">
			 <div class="row">
			 	<h3 class="text-muted">회원탈퇴</h3>&nbsp;&nbsp;
				<input class="form-control col-5" type="password" name="cus_pw">&nbsp;&nbsp;
				<button type="submit" class="btn btn-md btn-secondary">삭제</button>&nbsp;
				<button type="button" class="btn btn-md btn-secondary"
				onclick="location='cus_user_main.do'">취소</button>
			</div>	
				
			 </form>
			
			</div>
			
		
			<!-- Footer - No Scroll -->
			<div class="footer bg-dark fixed-bottom">
				<nav class="navbar navbar-expand-lg bg-dark justify-content-center">
					<!-- Bottom Logo -->
					<a class="navbar-brand" href="cus_user_main.do">
						<img src="/Muhan/cus/cus_images/logo_white.png" class="img-fluid" alt="Lotteria White Main Logo" style="width: 70%">
					</a>
					
					<!-- Links -->
					<ul class="navbar-nav" style="font-size: 0.75rem;">
						<li class="nav-item">
							<a class="nav-link ml-5 mr-5 text-white" href="#">이용약관</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ml-5 mr-5 text-danger" href="#">개인정보처리방침</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ml-5 mr-5 text-white" href="#">이용안내</a>
						</li>
						<li class="nav-item">
							<a class="nav-link ml-5 mr-5 text-white" href="https://www.instagram.com/lotteria_kr/">소셜미디어</a>
						</li>
					</ul>
				</nav>
				<%@include file="/cus/cus_fixedFooter.jsp"%>
			</div>
		</div>
