<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>    
<script src="${project}script.js"></script>
<table class="table table-hover">
	<tr>
		<th class="col-md-1">사진</th>
		<th class="col-md-1">ID</th>
		<th class="col-md-1">메뉴명</th>
		<th class="col-md-1">가격</th>
		<%-- 
		<th>이미지</th>
		--%>
		<th class="col-md-1">분류</th>
		<th class="col-md-2">설명</th>
		<th class="col-md-2">관리</th>
	<c:forEach var="menu" items="${menus2}">
		<tr>
			<td>
				<img src="/Muhan/menu_images/${menu.menu_image}" width="150" height="100">
			</td>
			<td>${menu.menu_id}</td>
			<td>${menu.menu_name}</td>
			<td>${menu.menu_price}원</td>
			<%--
			<td>${menu.menu_image}</td>
			--%>
			<td>
				<c:if test="${menu.menu_category eq 1}">
					세트
				</c:if>
				<c:if test="${menu.menu_category eq 2}">
					버거
				</c:if>
				<c:if test="${menu.menu_category eq 3}">
					사이드와 음료
				</c:if>
				<c:if test="${menu.menu_category eq 4}">
					신제품 세트
				</c:if>
				<c:if test="${menu.menu_category eq 5}">
					신제품 버거
				</c:if>
			</td>
			<td>${menu.menu_detail}</td>
			<td>
				<div class="btn-group">
					<input class="btn btn-primary btn-sm" type="button" value="수정" onclick="location='Admin_menu_modify_form.do?menu_id=${menu.menu_id}'">
					<input class="btn btn-primary btn-sm" type="button" value="삭제" onclick="location='Admin_menu_delete.do?menu_id=${menu.menu_id}'">
				</div>
			</td>
		</tr>	
	</c:forEach>
	<c:forEach var="menu" items="${menus}">
		<tr>
			<td><img src="/Muhan/menu_images/${menu.menu_image}" width="150" height="100"></td>
			<td>${menu.menu_id}</td>
			<td>${menu.menu_name}</td>
			<td>${menu.menu_price}원</td>
			<%--
			<td>${menu.menu_image}</td>
			--%>
			<td>
				<c:if test="${menu.menu_category eq 1}">
					세트
				</c:if>
				<c:if test="${menu.menu_category eq 2}">
					버거
				</c:if>
				<c:if test="${menu.menu_category eq 3}">
					사이드와 음료
				</c:if>
				<c:if test="${menu.menu_category eq 4}">
					신제품 세트
				</c:if>
				<c:if test="${menu.menu_category eq 5}">
					신제품 버거
				</c:if>
			</td>
			<td>${menu.menu_detail}</td>
			<td>
				<div class="btn-group">
					<input class="btn btn-primary btn-sm" type="button" value="수정" onclick="location='Admin_menu_modify_form.do?menu_id=${menu.menu_id}'">
					<input class="btn btn-primary btn-sm" type="button" value="삭제" onclick="location='Admin_menu_delete.do?menu_id=${menu.menu_id}'">
				</div>
			</td>
		</tr>	
	</c:forEach>
	</tr>
	
</table>