<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<script src="./jquery-3.3.1.js"></script>
<script src="cus/cus_cart/cus_cart_script.js"></script>

<c:if test="${fn:length(store_member_dtos) eq 0}">
검색결과가 없습니다.
</c:if>
<c:if test="${fn:length(store_member_dtos) ne 0}">
<div class="container">
			<table class="table table-sm table-responsive-lg table-striped table-hover text-center mt-3 mb-3">
				<thead>
					<tr>
						<th scope="col" class="reviewNo">ID</th>
						<th scope="col" class="reviewWriter">주소</th>
						<th scope="col" class="reviewSubject">매장명</th>
						<th scope="col" class="reviewScore">매장 전화</th>
						<th scope="col" class="reviewHits">선택</th>
					</tr>
				</thead>
	<c:forEach var="store_member_dto" items="${store_member_dtos}">
		<tr>
			
			<td>${store_member_dto.store_id}</td>
			<td>${store_member_dto.store_address}</td>
			<td>${store_member_dto.store_name}</td>
			<td>${store_member_dto.store_tel}</td>
			<td><button class="btn btn-md btn-secondary" onclick="setStore('${store_member_dto.store_id}','${store_member_dto.store_name}')">선택</button></td>
		</tr>	
	</c:forEach>
	
	<!-- 검색 //////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<tr>
		<td>
			주소
		</td>
		<td>
			<form name="inputform" method="get" action="Cus_pay_store_search.do" >
			<input class="input" type="text" name="keyword" maxlength="15">
			<input class="btn btn-primary" type="submit" value="검색">
			<input class="btn btn-primary" type="reset" value="취소">
			</form>
		</td>
	</tr>
	<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
</table>
</div>
<c:if test="${startPage gt pageBlock}">
	<a href="Cus_pay_store_search.do?keyword=${keyword}">[◀◀] </a>
	<a href="Cus_pay_store_search.do?keyword=${keyword}&pageNum=${startPage-pageBlock}">[◀] </a>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i eq currentPage}">
		<b>[${i}]</b>
	</c:if>
	<c:if test="${i ne currentPage}">					
		<a href="Cus_pay_store_search.do?keyword=${keyword}&pageNum=${i}">[${i}] </a>
	</c:if>	
</c:forEach>
<c:if test="${pageCount gt endPage}">
	<a href ="Cus_pay_store_search.do?keyword=${keyword}&pageNum=${startPage+pageBlock}">[▶]</a>
	<a href ="Cus_pay_store_search.do?keyword=${keyword}&pageNum=${pageCount}">[▶▶]</a>
</c:if>	
</c:if>