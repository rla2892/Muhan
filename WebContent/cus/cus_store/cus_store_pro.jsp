<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>

<link rel="stylesheet" type="text/css" href="/Muhan/cus/cus_theme.css">

<!-- CDN 방식 -->
<link 
	rel="stylesheet" 
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
	crossorigin="anonymous">

<script 
	src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
	crossorigin="anonymous"></script>

<script 
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" 
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" 
	crossorigin="anonymous"></script>

<script 
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" 
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" 
	crossorigin="anonymous"></script>

<html> 

<head>
	<title>롯데리아</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" href="/Muhan/cus/cus_images/favicon.png" type="image/png">
</head>
<script type="text/javascript">
($("a[data-toggle=modal]")).click(function() {
	   var target, url;
	   target = ($(this)).attr('data-target');
	   url = ($(this)).attr('href');
	   return ($(target)).load(url);
	   }); 
	   
	   
function enterKeyword1() {
	if(! searchStore.keyword.value) {
		alert("검색 키워드를 입력해 주세요.");
		return false;
	}
	if(! searchStore.keyword1.value) {
		alert("검색 키워드를 입력해 주세요.");
		return false;
	}
}


	


</script>  
<style type="text/css" >
aside{
  width:15%;
  float:left;

}

#navx {
    width:60%; 
}

</style>

<body>
	<!-- Top Navigation Bar -->
		<nav class="navbar navbar-expand-lg bg-warning fixed-top">	
			<!-- Lotteria Logo, Used as Home Button -->
			<a class="navbar-brand ml-5 mr-3 pl-5" href="cus_user_main.do">
				<img src="/Muhan/cus/cus_images/logo_red.png" class="img-fluid" alt="Lotteria Red Main Logo">
			</a>
			
			<!-- Toggler/Collapsible Button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<img src="/Muhan/cus/cus_images/navbarTogglerIcon.png" id="navbarToggleIcon">
			</button>
			
			<!-- Main Links -->
			<div class="collapse navbar-collapse ml-3" id="collapsibleNavbar">
				<ul class="navbar-nav" id="mainNavbar">
					<li class="nav-item">
						<a class="nav-link ml-5 mr-4 pl-5 text-danger" href="cus_menu.do?menu_category=1">MENU</a>
					</li>
					<li class="nav-item">
						<a class="nav-link ml-5 mr-4 pl-5 text-danger" href="cus_store.do">STORE</a>
					</li>
					<li class="nav-item">
						<a class="nav-link ml-5 mr-4 pl-5 text-danger" href="cus_review.do">REVIEW</a>
					</li>
					<li class="nav-item">
						<c:if test="${sessionScope.cus_id eq null}">
							<a class="nav-link ml-5 mr-5 pl-5 pr-5 pt-3 text-dark font-weight-light" href="cus_login_form.do" id="loginCartNavbar">LOGIN/JOIN</a>
						</c:if>
						<c:if test="${sessionScope.cus_id ne null}">
							<a class="nav-link ml-5 mr-5 pl-5 pr-5 pt-3 text-dark font-weight-light" href="cus_customer_info.do" id="loginCartNavbar">MY INFO</a>
						</c:if>
					</li>
				</ul>
			</div>	

			<div class="dropdown">
				<button type="button" class="btn btn-warning ml-4 mr-5" data-toggle="dropdown">
					<img src="/Muhan/cus/cus_images/cart.png">
					<span class="badge badge-pill badge-danger">1</span>
				</button>
				<div class="dropdown-menu dropdown-menu-right">
					<div class="row total-header-section">
						<div class="col-lg-6 total-section text-right">
							<p>Total: <span class="text-info">3,800 원</span></p>
						</div>
					</div>
					<div class="row cart-detail">
						<div class="col-lg-4 cart-detail-img">
							<img src="/Muhan/menu_images/burger_t-rex.png">
						</div>
						<div class="col-lg-8 cart-detail-product">
							<p>T-REX버거</p>
							<span class="price text-info">3,800 원</span><span class="count">수량: 1</span>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 text-center checkout">
							<button class="btn btn-warning">바로 주문하기</button>
							<button class="btn btn-warning">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</nav>
		
		<!-- The Modal -->
		<div class="modal modal-fade" id="cartModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
				
					<!-- ModalHeader -->
					<div class="modal-header">
						<h4 class="modal-title">장바구니</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
		     		<div class="modal-body">
		       			주문 목록들..
		      		</div>
		
		     		<!-- Modal footer -->
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			     	</div>
			     </div>
			</div>
		</div>
		
		<!-- Descriptor Jumbotron -->
		<div class="jumbotron mt-0.2">
		</div>
		
		

	<nav class="navbar navbar-expand-sm bg-white " >
	  <ul class="navbar-nav ml-auto">
	    <li class="nav-item">
	      <a class="nav-link" href="cus_user_main.do">HOME</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" >>>STORE</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" >>>매장찾기</a>
	    </li>
	  </ul>
	</nav>
	<br><br>
<aside>

	<nav class="navbar bg-light" id="navx">
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="cus_store_details.do" >STORE</a>
    </li>
    <li class="nav-item">
      <a class="nav-link">배달매장 찾기</a>
    </li>
 
  </ul>
</nav>
	
	
</aside>

<!-- aside 끝 -->


<form method="post" action="cus_store_pro.do" name="searchStore">

 <div class="container" style="width: 70%; float:none; margin:0 auto">

			 

			<div id="storeList">
				
				  <div class="form-group row">
					  <div class="col-4">
					   
					    <input class="form-control" id="ex1" type="text" placeholder="동이름  등록하세요">
					  </div>
					  <div class="col-5">
					    
					    <input class="form-control" id="ex2" type="text" placeholder="매장이름으로 등록하세요" name="keyword">
					  </div>
					 
					  <button type="submit" class="btn btn-info" onclick="return enterKeyword1()">검색</button>
				 
					</div>
				<table class="table mt15">
					
					<thead>
						<tr>
							<th scope="col">매장주소</th>
							<th scope="col">매장이름</th>
							<th scope="col">전화번호</th>
							<th scope="col">최소주문금액</th>
							<th scope="col">배달가능시간</th>
							<th scope="col">상세보기</th>
						</tr>
					</thead>
					<tbody>
						
					  <c:forEach var="store" items="${selectStoresByTextsssssss}">
						<tr>
							<td>${store.store_address}</td>
							<td>${store.store_name}</td>
							<td>${store.store_tel}</td>
							<td>10000원</td>
							<td>10:00~22:00</td>
											
							
							<td><button type="button" class="btn btn-info">상세보기</button></td>
						</tr>
					</c:forEach>
					 
					</tbody>
				</table>
				
				<c:if test="${startPage gt pageBlock}">
							<a href="cus_store.do">[◀◀] </a>
							<a href="cus_store.do?pageNum=${startPage-pageBlock}">[◀] </a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i eq currentPage}">
								<b>[${i}]</b>
						</c:if>
						<c:if test="${i ne currentPage}">					
								<a href="cus_store.do?pageNum=${i}">[${i}] </a>
						</c:if>	
				</c:forEach>
				<c:if test="${pageCount gt endPage}">
							<a href ="cus_store.do?pageNum=${startPage+pageBlock}">[▶]</a>
							<a href ="cus_store.do?pageNum=${pageCount}">[▶▶]</a>
				</c:if>	
			</div>
	</div>
</form>
		<!-- Footer Container -->
		<div class="container-fluid w-100 pl-0 pr-0 pb-0">
		
			<!-- Footer (스크롤이 있을 때 사용해야 하는 footer)-->
			<div class="footer bg-dark position-relative" id="footerWScroll">
				<nav class="navbar navbar-expand-lg bg-dark justify-content-center">
					<!-- Bottom Logo -->
					<a class="navbar-brand" href="cus_user_main.do">
						<img src="/Muhan/cus/cus_images/logo_white.png" class="img-fluid" alt="Lotteria White Main Logo" style="width: 70%">
					</a>
					
					<!-- Links -->
					<ul class="navbar-nav bottomLink">
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
				<div class="container text-white pb-2 mb-0" id="bottomInfo">
					<span class="footer-info">엔코아 플레이데이터 빅데이터/딥러닝 2기</span>
					<span class="footer-info">웹프로젝트</span>
					<span class="footer-info">무한(김)상사</span>
					<span class="footer-info">팀장: &emsp;김상진</span>
				</div>
				<div class="container pb-0 mb-0">
					<p class="text-white mb-0">Copyright &copy; 2018</p>
				</div>
			</div>
		</div>


</body>

</html>
