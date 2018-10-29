<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>

<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_customer.jsp" %>

<%-- --%>
<div class="btn-group btn-group-justified">
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=0'">전국</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=1'">서울</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=2'">인천</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=3'">경기</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=4'">대전</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=5'">세종</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=6'">충청도</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=7'">강원도</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=8'">부산</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=9'">울산</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=14'">대구</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=10'">경상도</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=11'">광주</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=12'">전라</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_customer_find.do?location1=13'">제주</a>
</div>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<table class="table table-hover">
	<thead class="thead-dark">
		<tr>
			<th scope="col">ID</th>
			<th scope="col">주소</th>
			<th scope="col">닉네임</th>
			<%-- 
			<td>비밀번호</td>
			<td>상세주소</td>
			<td>가입일</td>
			--%>
			<th scope="col">이메일</th>
			<th scope="col">전화</th>
			<th scope="col">신고횟수</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${fn:length(customers) gt 0}">
		<c:forEach var="i" begin="0" end="${fn:length(customers)-1}" step="1">
			<c:set var="customer" value="${customers[i] }"/>
			<tr>
				<td scope="row">
				<a href ="Admin_customer_detail.do?cus_id=${customer.cus_id}">
				${customer.cus_id}
				
				</a>
				</td>
				<td>${customer.cus_address}</td>
				<td>${customer.cus_nickname}</td>
				<%-- 
				<td>${customer.cus_pw}</td>
				<td>${customer.cus_address2}</td>
				<td>${customer.cus_reg_date}</td>
				--%>
				<td>${customer.cus_email}</td>
				<td>${customer.cus_tel}</td>
				<td>
					${reports[i]}
					<c:if test="${reports[i] gt 1}">
						<img src="/Muhan/admin/admin_images/waring.png" border="0" width="20" height="15">
					</c:if>	
				</td>
			</tr>
		</c:forEach>
		</c:if>
	</tbody>
</table>
<c:if test="${fn:length(customers) gt 0}">
<c:if test="${startPage gt pageBlock}">
	<a href="Admin_customer_find.do?location1=${location1}">[◀◀] </a>
	<a href="Admin_customer_find.do?location1=${location1}&pageNum=${startPage-pageBlock}">[◀] </a>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i eq currentPage}">
		<b>[${i}]</b>
	</c:if>
	<c:if test="${i ne currentPage}">					
		<a href="Admin_customer_find.do?location1=${location1}&pageNum=${i}">[${i}] </a>
	</c:if>	
</c:forEach>
<c:if test="${pageCount gt endPage}">
	<a href ="Admin_customer_find.do?location1=${location1}&pageNum=${startPage+pageBlock}">[▶]</a>
	<a href ="Admin_customer_find.do?location1=${location1}&pageNum=${pageCount}">[▶▶]</a>
</c:if>
</c:if>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>