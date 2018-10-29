<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>

<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_menu.jsp" %>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="container">
	<form method="post" action="Admin_menu_modify_pro.do" name="inputform" onsubmit="return submitMenu();" enctype="multipart/form-data">
		<h3>메뉴에 대한 정보를 입력하세요</h3>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="menu_id">메뉴 아이디</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="number" name="menu_id" id="menu_id" maxlength="15" value="${menu_dto.menu_id}" readonly>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="menu_name">메뉴 명</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="menu_name" id="menu_name" maxlength="15" value="${menu_dto.menu_name}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="menu_price">메뉴 가격</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="number" name="menu_price" id="menu_price" maxlength="20" value="${menu_dto.menu_price}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="menu_image">메뉴 이미지 경로</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="menu_image" id="menu_image" maxlength="20" value="${menu_dto.menu_image}">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="menu_image_file">메뉴 이미지 파일</label>
			</div>
			<div class="col-xs-2">
				<input class="input" type="file" name="menu_image_file" id="menu_image_file" >
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="menu_category">메뉴 분류</label>
			</div>
			<div class="col-xs-2">
				<select name="menu_category" id="menu_category">
					<c:if test="${menu_dto.menu_category eq 1}">
						<option value="1" selected>세트</option>
					</c:if>
					<c:if test="${menu_dto.menu_category ne 1}">
						<option value="1">세트</option>
					</c:if>
					<c:if test="${menu_dto.menu_category eq 2}">
						<option value="2" selected>버거</option>
					</c:if>
					<c:if test="${menu_dto.menu_category ne 2}">
						<option value="2">버거</option>
					</c:if>
					<c:if test="${menu_dto.menu_category eq 3}">
						<option value="3" selected>사이드와 음료</option>
					</c:if>
					<c:if test="${menu_dto.menu_category ne 3}">
						<option value="3">사이드와 음료</option>
					</c:if>
					<c:if test="${menu_dto.menu_category eq 4}">
						<option value="4" selected>신제품</option>
					</c:if>
					<c:if test="${menu_dto.menu_category ne 4}">
						<option value="4">신제품</option>
					</c:if>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="menu_detail">메뉴 설명</label>
			</div>
			<div class="col-xs-2">
				<textarea class="form-control" name="menu_detail" id="menu_detail" rows="10" cols="30">
${menu_dto.menu_detail}
				</textarea>
			</div>
		</div>
		<div class="form-group row">
			<input class="btn btn-primary" type="submit" value="수정">
			<input class="btn btn-primary" type="reset" value="취소">
		</div>
	</form>
</div>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>
<script>
document.getElementById("menu_image_file").value = "";
</script>