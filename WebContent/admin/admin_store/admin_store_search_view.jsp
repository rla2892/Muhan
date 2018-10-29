<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>

<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_store.jsp" %>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<table class="table table-hover">
	<tr>
		<td>ID</td>
		<%-- 
		<td>PW</td>
		--%>
		<td>주소</td>
		<td>매장명</td>
		<td>매장 전화</td>
		<td>점주</td>
		<td>점주 전화</td>
		<%--
		<td>등록일</td>
		<td>점주 이메일</td>
		--%>
	</tr>
	<c:forEach var="store_member_dto" items="${store_member_dtos}">
		<tr>
			
			<td>
			<a href ="Admin_store_detail.do?store_id=${store_member_dto.store_id}">
			${store_member_dto.store_id}
			</a>
			</td>
			<%-- 
			<td>${store.store_pw}</td>
			--%>
			<td>${store_member_dto.store_address}</td>
			<td>${store_member_dto.store_name}</td>
			<td>${store_member_dto.store_tel}</td>
			<td>${store_member_dto.owner_name}</td>
			<td>${store_member_dto.owner_tel}</td>
			<%--
			<td>${store.owner_reg_date}</td>
			<td>${store.owner_email}</td>
			--%>
		</tr>	
	</c:forEach>
	
	<!-- 검색 //////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<tr>
		<td>
			주소
		</td>
		<td>
			<form name="inputform" method="get" action="Admin_store_search_view.do" >
			<input class="input" type="text" name="keyword" maxlength="15">
			<input class="btn btn-primary" type="submit" value="검색">
			<input class="btn btn-primary" type="reset" value="취소">
			</form>
		</td>
	</tr>
	<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
</table>
<c:if test="${startPage gt pageBlock}">
	<a href="Admin_store_search_view.do?keyword=${keyword}">[◀◀] </a>
	<a href="Admin_store_search_view.do?keyword=${keyword}&pageNum=${startPage-pageBlock}">[◀] </a>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i eq currentPage}">
		<b>[${i}]</b>
	</c:if>
	<c:if test="${i ne currentPage}">					
		<a href="Admin_store_search_view.do?keyword=${keyword}&pageNum=${i}">[${i}] </a>
	</c:if>	
</c:forEach>
<c:if test="${pageCount gt endPage}">
	<a href ="Admin_store_search_view.do?keyword=${keyword}&pageNum=${startPage+pageBlock}">[▶]</a>
	<a href ="Admin_store_search_view.do?keyword=${keyword}&pageNum=${pageCount}">[▶▶]</a>
</c:if>	

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>