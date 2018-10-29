<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
*{
    margin: 0;
    padding: 0;
    font-family: 'Varela Round', sans-serif;
    box-sizing: border-box;
}
.img-responsive{
	padding: 70px;
    margin-left: auto;
    margin-right: auto;
}
</style>
<c:if test="${sessionScope.store_id eq null}">
<body>
	<jsp:include page="store_topNav.jsp" flush="false"/>
	<div class="container-fluid">
	<div class="row">
		<div class="col-sm-8" style="height:65%;padding:5px;">
			<div style="position: absolute;z-index:2;">
				<div style="position: relative; top:30px; left:30px;">
				<img src="/Muhan/cus/cus_images/logo_red.png"></img>
				</div>
			</div>
			<div id="demo" class="carousel slide col-sm-8" data-ride="carousel">
				<ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				    <li data-target="#demo" data-slide-to="2"></li>
  				</ul>
  				<!-- The slideshow -->
				  <div class="carousel-inner border">
				    <div class="carousel-item active">
				      <img src="/Muhan/store/burger_walk_dribbble.gif" class="img-fluid" alt="burger_walk">
				    </div>
				    <div class="carousel-item">
				      <img src="/Muhan/store/food_fight_1.gif" class="img-fluid" alt="food_fight">
				    </div>
				    <div class="carousel-item">
				      <img src="/Muhan/store/french_fries.gif" class="img-fluid" alt="french_fries">
				    </div>
				  </div>
				 <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#demo" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#demo" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
			</div>
		</div>	
		<div class="col-sm-4 p-0" style="height:65%" >
			<div><c:import url="/Store_login_form.do"/></div>
		</div>
		
	</div>
	<div class="row">
		<div class="col-sm-3" style="background-color:#4ECDC4;height:35%;">
			<div onclick="return loginfirst()">
				<img src="/Muhan/store/order_food.png" class="img-responsive" title="현재  주문  확인">
			</div>
		</div>
		
		<div class="col-sm-3" style="background-color:#FF6B6B;height:35%;">
			<div onclick="return loginfirst()">
				<img src="/Muhan/store/delivery-truck.png" class="img-responsive" title="모든 주문 위치 확인">
			</div>
		</div>
		
		<div class="col-sm-3" style="background-color:#FFE66D;height:35%;">
			<div onclick="return loginfirst()">
				<img src="/Muhan/store/notepad.png" class="img-responsive" title="회원 정보 수정">
			</div>
		</div>
		<div class="col-sm-3" style="background-color:#292F36;height:35%;">
			<div onclick="return loginfirst()">
				<img src="/Muhan/store/storm.png" class="img-responsive" title="현재  날씨 확인">
			</div>
		</div>
	</div>
	</div>
</body>
</c:if>

<c:if test="${sessionScope.store_id ne null}">
<body>
	<jsp:include page="store_topNav.jsp" flush="false"/>
	
	<div class="container-fluid">
	<div class="row">
		<div class="col-sm-8" style="height:65%;padding:5px;">
			<div style="position: absolute;z-index:2;">
				<div style="position: relative; top:30px; left:30px;">
				<img src="/Muhan/cus/cus_images/logo_red.png"></img>
				</div>
			</div>
			<div id="demo" class="carousel slide col-sm-8" data-ride="carousel">
				<ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				    <li data-target="#demo" data-slide-to="2"></li>
  				</ul>
  				<!-- The slideshow -->
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="/Muhan/store/burger_walk_dribbble.gif" class="img-fluid" alt="burger_walk">
				    </div>
				    <div class="carousel-item">
				      <img src="/Muhan/store/food_fight_1.gif" class="img-fluid" alt="food_fight">
				    </div>
				    <div class="carousel-item">
				      <img src="/Muhan/store/french_fries.gif" class="img-fluid" alt="french_fries">
				    </div>
				  </div>
				 <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#demo" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#demo" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
			</div>
		</div>
		<div class="col-sm-4 p-0" style="height:65%">
			<div><c:import url="/Store_login.do"/></div>
		</div>
		
	</div>
		<div class="row">
		
			<div class="col-sm-3" style="background-color:#4ECDC4;height:35%;">
				<div class="col-sm-3" onclick="location.href='Store_order_check.do'">
					<img src="/Muhan/store/order_food.png" class="img-responsive" title="현재  주문  확인">
				</div>
			</div>
			<div class="col-sm-3" style="background-color:#FF6B6B;height:35%;align:center">
				<div class="col-sm-3" onclick="location.href='Store_orders_location.do'">
					<img src="/Muhan/store/delivery-truck.png" class="img-responsive" title="모든 주문 위치 확인">
				</div>
			</div>
			<div class="col-sm-3" style="background-color:#FFE66D;height:35%;">
				<div class="container-fluid" onclick="location.href='Store_modify_form.do'">
					<img src="/Muhan/store/notepad.png" class="img-responsive" title="회원 정보 수정">
				</div>
			</div>
			<div class="col-sm-3" style="background:#292F36;height:35%;padding:0;">
				<div><c:import url="/Store_weather.do"/></div>
			</div>	
		</div>
	</div>
</body>
</c:if>