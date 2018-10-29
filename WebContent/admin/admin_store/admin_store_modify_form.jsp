<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>

<script src="${project}script.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_store.jsp" %>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="container">
	<form method="post" action="Admin_store_modify_pro.do" name="modifyform" onsubmit="return submitModify();">
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="store_id">매장 아이디</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="store_id" id="store_id" value="${store_member_dto.store_id}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="store_pw">비밀번호</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="password" name="store_pw" id="store_pw" maxlength="15" value="${store_member_dto.store_pw}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="store_repw">비밀번호 재입력</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="password" name="store_repw" id="store_repw" maxlength="15" value="${store_member_dto.store_pw}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="store_address">매장 주소</label>
			</div>
			<input class="btn btn-primary" type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기">
			<div class="col-xs-2">
				<input class="form-control" type="text" name="store_address" id="store_address" value="${store_member_dto.store_address}" 
				maxlength="20" style="width: 270px">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="store_name">매장명</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="store_name" id="store_name" value="${store_member_dto.store_name}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="store_tel1">매장 전화번호</label>
			</div>
			<div class="col-xs-6">
				<div class="form-group row">
					<c:if test="${store_member_dto.store_tel eq null or store_member_dto.store_tel eq '' }">
						<div class="col-xs-2">
							<input class="form-control" type="text" name="store_tel1" id="store_tel1" maxlength="3" >
						</div>
						<div class="col-xs-1">
							-
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="store_tel2" maxlength="4" >
						</div>
						<div class="col-xs-1">
							-
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="store_tel3" maxlength="4" >
						</div>
					</c:if>	
					<c:if test="${store_member_dto.store_tel ne null and store_member_dto.store_tel ne ''}">
						<c:set var="t" value="${fn:split(store_member_dto.store_tel, '-')}"/>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="store_tel1" maxlength="3" value="${t[0]}">
						</div>
						<div class="col-xs-1">
							-
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="store_tel2" maxlength="4" value="${t[1]}">
						</div>
						<div class="col-xs-1">
							-
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="store_tel3" maxlength="4" value="${t[2]}">
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="owner_name">점주명</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="owner_name" id="owner_name" value="${store_member_dto.owner_name}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="owner_tel1">점주 전화번호</label>
			</div>
			<div class="col-xs-6">
				<div class="form-group row">
					<c:if test="${store_member_dto.owner_tel eq null or store_member_dto.owner_tel eq '' }">	
						<div class="col-xs-2">
							<input class="form-control" type="number"  name="owner_tel1" id="owner_tel1" maxlength="3">
						</div>
						<div class="col-xs-1">
							-
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="number" name="owner_tel2" maxlength="4">
						</div>
						<div class="col-xs-1">
							-
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="number" name="owner_tel3" maxlength="4">
						</div>
					</c:if>	
					<c:if test="${store_member_dto.owner_tel ne null and store_member_dto.owner_tel ne ''}">
						<c:set var="o" value="${fn:split(store_member_dto.owner_tel, '-')}"/>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="owner_tel1" maxlength="3" value="${o[0]}">
						</div>
						<div class="col-xs-1">
							-
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="owner_tel2" maxlength="4" value="${o[1]}">
						</div>
						<div class="col-xs-1">
							-
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="owner_tel3" maxlength="4" value="${o[2]}">
						</div>
					</c:if>	
				</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="owner_reg_date">점주 등록일</label>
			</div>
			<div class="col-xs-3">
				<input class="form-control" type="text" name="owner_reg_date" id="owner_reg_date" value="${store_member_dto.owner_reg_date}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="owner_email">점주 이메일</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="owner_email" id="owner_email" value="${store_member_dto.owner_email}">
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-xs-2">
				<input class="btn btn-primary" type="submit" value="수정 ">
				<input class="btn btn-primary" type="reset" value="취소">
			</div>
		</div>
	</form>
</div>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>