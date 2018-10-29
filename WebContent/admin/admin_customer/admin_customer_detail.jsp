<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>

<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_customer.jsp" %>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<table class="table table-hover">
	<tr>
		<th>ID</th>
		<td>${customer_member_dto.cus_id}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${customer_member_dto.cus_pw}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${customer_member_dto.cus_nickname}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${customer_member_dto.cus_address}</td>
	</tr>
	<tr>
		<th>상세주소</th>
		<td>${customer_member_dto.cus_address2}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${customer_member_dto.cus_email}</td>
	</tr>
	<tr>
		<th>전화</th>
		<td>${customer_member_dto.cus_tel}</td>
	</tr>
	<tr>
		<th>가입일</th>
		<td>${customer_member_dto.cus_reg_date}</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
		<c:if test="${customer_member_dto.cus_gender eq 1}">
			남
		</c:if>
		<c:if test="${customer_member_dto.cus_gender eq 2}">
			여
		</c:if>
		</td>
	</tr>
	<tr>
		<th>가입일</th>
		<td>${customer_member_dto.cus_birth}</td>
	</tr>
	<tr>
		<th>신고횟수</th>
		<td>
		${countReport}
		<c:if test="${countReport gt 1}">
			<img src="/Muhan/admin/admin_images/waring.png" border="0" width="20" height="15">
		</c:if>	
		</td>
	</tr>
	<tr>
		<th>글쓰기 권한</th>
		<td>
			<c:if test="${checkBlack gt 0}">
				정지
			</c:if>
			<c:if test="${checkBlack eq 0}">
				정상
			</c:if>
			<div class="btn-group">
				<input class="btn btn-primary" type="button" value="정지" onclick="location='Admin_customer_black.do?cus_id=${customer_member_dto.cus_id}'">
				<input class="btn btn-primary" type="button" value="복구" onclick="location='Admin_customer_unblack.do?cus_id=${customer_member_dto.cus_id}'">
			</div>
		</td>
	</tr>
</table>
<input class="btn btn-primary" type="button" value="수정" onclick="location='Admin_customer_modify_form.do?cus_id=${customer_member_dto.cus_id}'">


<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>