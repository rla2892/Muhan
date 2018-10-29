<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>
<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_store.jsp" %>

<%-- --%>
<div class="btn-group btn-group-justified">
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=0'">전국</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=1'">서울</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=2'">인천</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=3'">경기</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=4'">대전</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=5'">세종</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=6'">충청도</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=7'">강원도</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=8'">부산</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=9'">울산</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=14'">대구</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=10'">경상도</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=11'">광주</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=12'">전라</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_find.do?location1=13'">제주</a>
</div>

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
	<c:forEach var="store" items="${stores}">
		<tr>
			<td>
			<a href ="Admin_store_detail.do?store_id=${store.store_id}">
			${store.store_id}
			</a>
			</td>
			<%-- 
			<td>${store.store_pw}</td>
			--%>
			<td>${store.store_address}</td>
			<td>${store.store_name}</td>
			<td>${store.store_tel}</td>
			<td>${store.owner_name}</td>
			<td>${store.owner_tel}</td>
			<%--
			<td>${store.owner_reg_date}</td>
			<td>${store.owner_email}</td>
			--%>
		</tr>	
	</c:forEach>
	<!-- 검색 //////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<tr >
		
		<td colspan="9">
			<form name="inputform" method="get" action="Admin_store_search_view.do" >
			주소
			<input class="input" type="text" name="keyword" maxlength="15">
			<input class="btn btn-primary" type="submit" value="검색">
			<input class="btn btn-primary" type="reset" value="취소">
			</form>
		</td>
	</tr>
	
	<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
</table>
<c:if test="${startPage gt pageBlock}">
	<a href="Admin_store_find.do?location1=${location1}">[◀◀] </a>
	<a href="Admin_store_find.do?location1=${location1}&pageNum=${startPage-pageBlock}">[◀] </a>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i eq currentPage}">
		<b>[${i}]</b>
	</c:if>
	<c:if test="${i ne currentPage}">					
		<a href="Admin_store_find.do?location1=${location1}&pageNum=${i}">[${i}] </a>
	</c:if>	
</c:forEach>
<c:if test="${pageCount gt endPage}">
	<a href ="Admin_store_find.do?location1=${location1}&pageNum=${startPage+pageBlock}">[▶]</a>
	<a href ="Admin_store_find.do?location1=${location1}&pageNum=${pageCount}">[▶▶]</a>
</c:if>	
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>

