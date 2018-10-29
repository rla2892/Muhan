<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>
<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_menu.jsp" %>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<!--enctype="multipart/form-data"-->
<div class="container">
	<form name="inputform" method="post" action="Admin_menu_insert_pro.do" enctype="multipart/form-data" 
	onsubmit="return submitMenu();">
		<h3>메뉴에 대한 정보를 입력하세요</h3>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="menu_name">메뉴 명</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="menu_name" id="menu_name" maxlength="15">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="menu_price">메뉴 가격</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="number" name="menu_price" id="menu_price" maxlength="20">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="menu_image_file">메뉴 이미지 파일</label>
			</div>
			<div class="col-xs-2">
				<input class="input" type="file" name="menu_image_file" id="menu_image_file">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="menu_category">메뉴 분류</label>
			</div>
			<div class="col-xs-2">
				<select name="menu_category"	id="menu_category">
				  <option value="1">세트</option>
				  <option value="2">버거</option>
				  <option value="3">사이드와음료</option>
				  <option value="4">신제품 세트</option>
				  <option value="5">신제품 버거</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="menu_detail">메뉴 설명</label>
			</div>
			<div class="col-xs-2">
				<textarea class="form-control" name="menu_detail" id="menu_detail" rows="10" cols="30">
				</textarea>
			</div>
		</div>
		<div class="form-group row">
			<input class="btn btn-primary" type="submit" value="등록">
			<input class="btn btn-primary" type="reset" value="취소">
		</div>
	</form>
</div>
	
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>