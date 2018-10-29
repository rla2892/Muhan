<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>

<html> 
	<head>
		<%@include file="/cus/cus_head.jsp"%>
	</head>
		
	<script type="text/javascript">
	($("a[data-toggle=modal]")).click(function() {
	   var target, url;
	   target = ($(this)).attr('data-target');
	   url = ($(this)).attr('href');
	   return ($(target)).load(url);
	   }); 
	
	/* function enterKeyword1() {
		if(! searchStore.keyword.value) {
			alert("검색 키워드를 입력해 주세요.");
			return false;
		}
		 if(! searchStore.keyword1.value) {
			alert("검색 키워드를 입력해 주세요.");
			return false;
		} 
	}
	 */
	</script>  
	
	<body>
		<%@include file="/cus/cus_topNav.jsp"%>
			
		<!-- Descriptor Jumbotron -->
		<div class="jumbotron mt-1">
			<h1 class="display-5 text-center font-weight-bold pt-4">매장 찾기</h1>
		</div>
		
		<%@include file="/cus/cus_store/cus_store_subNav.jsp"%>
		
		<div class="container w-100 mt-4 mb-0">
			<form method="get" action="cus_store.do" name="searchStore">		
				<div class="form-group row justify-content-center">
					<div class="w-25 ml-1">
						<input class="form-control text-center" id="ex1" type="text" placeholder="동이름으로 검색하세요" name="keyword1">
					</div>
			  		<div class="w-25 ml-1 mr-1"> 
						<input class="form-control text-center" id="ex2" type="text" placeholder="매장이름으로 검색하세요" name="keyword">
					</div>
					<button type="submit" class="btn btn-warning pl-4 pr-4" onclick="return enterKeyword1()"><strong>검색</strong></button>					 
				</div>
				
				<table class="table table-borderless table-responsive-lg table-striped table-hover mt-3 mb-0 text-center">
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
						<c:forEach var="store" items="${selectStomers2}">
							<tr>
								<td><div class="pt-1">${store.store_address}</div></td>
								<td><div class="pt-1">${store.store_name}</div></td>
								<td><div class="pt-1">${store.store_tel}</div></td>
								<td><div class="pt-1">10000원</div></td>
								<td><div class="pt-1">10:00~22:00</div></td>
								<td><button type="button" class="btn btn-sm btn-warning" onclick='location="cus_store_details.do?store_id=${store.store_id}"'><strong>상세보기</strong></button></td>
							</tr>
						</c:forEach>  
					</tbody>
				</table>
					
				<div class="text-center">
					<c:if test="${count ne 0 }">
						<c:if test="${startPage gt pageBlock}">
							<a href="cus_store.do?keyword=${keyword}&keyword1=${keyword1}">
								<img src="/Muhan/cus/cus_images/rewind.png" class="rewind">
							</a>
							&ensp;
							<a href="cus_store.do?keyword=${keyword}&keyword1=${keyword1}&pageNum=${startPage-pageBlock}">
								<img src="/Muhan/cus/cus_images/return.png" class="return">
							</a>
						</c:if>
						&ensp;
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i eq currentPage}">
								<a class="currentPageBottom text-danger font-weight-bold" href="">${i}</a>
							</c:if>
							<c:if test="${i ne currentPage}">	
								<a class="pageNumBottom text-dark" href="cus_store.do?keyword=${keyword}&keyword1=${keyword1}&pageNum=${i}">${i}</a>
							</c:if>	
						</c:forEach>
						&ensp;
						<c:if test="${pageCount gt endPage}">
							<a href="cus_store.do?keyword=${keyword}&keyword1=${keyword1}&pageNum=${startPage+pageBlock}">
								<img src="/Muhan/cus/cus_images/forward.png" class="forward">
							</a>
							&ensp;
							<a href="cus_store.do?keyword=${keyword}&keyword1=${keyword1}&pageNum=${pageCount}">
								<img src="/Muhan/cus/cus_images/fastForward.png" class="fastForward">
							</a>
						</c:if>	
					</c:if>
				</div>
			</form>
		</div>
	
		<%@include file="/cus/cus_scrollableFooter.jsp"%>
	</body>
</html>
