<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>

<jsp:include page="store_topNav.jsp" flush="false"/>
<jsp:include page="store_aside_order.jsp" flush="false"/>

<div class="container">
	<br>
	<div class="row">
		품목:&nbsp; 
			<select name="itemGroup"  id="category" onchange="changeCategory()">
				<option value="0" selected="selected">전체</option>
				<option value="1">세트</option>
				<option value="2">버거</option>
				<option value="3">사이드와 음료</option>
				<option value="4">신제품-세트</option>
				<option value="5">신제품-버거</option>
			</select>
		&nbsp;
	</div>
	<br>
	<div class="row">
			오늘의 품목별 매출
	</div>
	<div id="chartArea" class="row">
		<div id="chart_div"></div>
	</div>
</div>