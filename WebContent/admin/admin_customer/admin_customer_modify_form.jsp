<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>

<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_customer.jsp" %>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="container">
	<form method="post" action="Admin_customer_modify_pro.do" name="modifyform">
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="cus_id">
					고객 아이디
				</label>
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="cus_id" id="cus_id" value="${customer_member_dto.cus_id}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="cus_pw">
					고객 비밀번호
				</label>
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="cus_pw" id="cus_pw" value="${customer_member_dto.cus_pw}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="cus_nickname">
					고객 닉네임
				</label>
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="cus_nickname" id="cus_nickname" value="${customer_member_dto.cus_nickname}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="cus_address">
					고객 주소
				</label>
			</div>
			<div class="col-xs-4">
				<input type="text" class="form-control" name="cus_address" id="cus_address" value="${customer_member_dto.cus_address}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="cus_address2">
					고객 상세 주소
				</label>
			</div>
			<div class="col-xs-4">
				<input type="text" class="form-control" name="cus_address2" id="cus_address2" value="${customer_member_dto.cus_address2}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="cus_email">
					고객 이메일
				</label>
			</div>
			<div class="col-xs-4">
				<input type="text" class="form-control" name="cus_email" id="cus_email" value="${customer_member_dto.cus_email}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="cus_tel">
					고객 전화번호
				</label>
			</div>
			<div class="col-xs-2">
				<input type="text" class="form-control" name="cus_tel" id="cus_tel" value="${customer_member_dto.cus_tel}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="cus_reg_date">
					고객 등록일
				</label>
			</div>
			<div class="col-xs-4">
				<input type="text" class="form-control" name="cus_reg_date" id="cus_reg_date" value="${customer_member_dto.cus_reg_date}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="cus_gender">
					성별
				</label>
			</div>
			<div class="col-xs-4">
				<input type="hidden" class="form-control" name="cus_gender" id="cus_gender" value="${customer_member_dto.cus_gender}" readonly>
				<c:if test="${customer_member_dto.cus_gender eq 1}">
					남
				</c:if>
				<c:if test="${customer_member_dto.cus_gender eq 2}">
					여
				</c:if>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="cus_birth">
					생년월일
				</label>
			</div>
			<div class="col-xs-4">
				<input type="text" class="form-control" name="cus_birth" id="cus_birth" value="${customer_member_dto.cus_birth}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<input class="btn btn-primary" type="submit" value="수정 ">
			<input class="btn btn-primary" type="reset" value="취소">
		</div>
	</form>
</div>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>