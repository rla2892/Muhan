<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp"%>

<html>
	<head>
		<%@include file="/cus/cus_head.jsp"%>
		


<style>
.jumbotron{
    background: url("/Muhan/cus/cus_images/menu1.jpg") no-repeat center center; 
    -webkit-background-size: 100% 100%;
    -moz-background-size: 100% 100%;
    -o-background-size: 100% 100%;
    background-size: 100% 100%;
}
/* jumbotron image */


</style>
	</head>
	<body>
		<%@include file="/cus/cus_topNav.jsp"%>
		
		<!-- Descriptor Jumbotron -->
		<div class="jumbotron mt-1">
			<h1 class="display-5 text-center font-weight-bold pt-4"></h1>
			
		</div>
		
		<%@include file="/cus/cus_menu/cus_menu_subNav.jsp"%>
		
		<!-- Container -->
		<div class="container">
			
			<!-- Menu List shown in Cards -->
			<div class="card-deck mt-4 mb-4">
				<c:forEach var="menu" items="${menus}">
				<a class="menuListItem" href="cus_menu_details.do?menu_id=${menu.menu_id}" >
					<div class="card mt-4 mb-4">
						<img class="card-img-top img-fluid" src="/Muhan/menu_images/${menu.menu_image}" alt="Menu Img" width="150" height="100">
						<div class="card-body text-center font-weight-bold flex-fill">
							<b class="card-title text-danger">${menu.menu_name}</b>
							<p class="card-text text-dark">${menu.menu_price}원</p>
						</div>
					</div>
				</a>
				</c:forEach>
			</div>
			
		</div>
		
		
		<%@include file="/cus/cus_scrollableFooter.jsp"%>
		<!-- Scrollable Footer: 붙이는 위치가 Fixed Footer와는 다릅니다! Scollable Footer는 중단 Container 밖에 넣어주셔야 합니다. -->
		
	</body>
</html>