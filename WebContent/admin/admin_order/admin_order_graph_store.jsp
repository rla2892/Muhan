<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<%@ include file="../../admin/admin_ui/admin_top.jsp"%>

<%@ include file="../../admin/admin_ui/admin_aside_order.jsp"%>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="btn-group btn-group-justified">
	<a href="Admin_order_graph_store.do?time_scale=1"class="btn btn-primary">오늘</a> 
	<a href="Admin_order_graph_store.do?time_scale=2" class="btn btn-primary">이번달</a>
	<a href="Admin_order_graph_store.do?time_scale=3"class="btn btn-primary">이번년</a> 
	<a href="Admin_order_graph_store.do?time_scale=4" class="btn btn-primary">전체</a>
</div>

<div class="container">
<c:if test="${param.time_scale eq null}"><h2>오늘의 매장별 매출액</h2></c:if>
<c:if test="${param.time_scale eq 1}"><h2>오늘의 매장별 매출액</h2></c:if>
<c:if test="${param.time_scale eq 2}"><h2>이번달 매장별 매출액</h2></c:if>
<c:if test="${param.time_scale eq 3}"><h2>이번년도 매장별 매출액</h2></c:if>
<c:if test="${param.time_scale eq 4}"><h2>전체 기간 매장별 매출액</h2></c:if>
</div>

<!-- 일,월,년,전체 타임스케일 -->
<input type="hidden" name="time_scale" id="time_scale"
	value="${param.time_scale}">

<!-- 기본 데이터 -->
<c:forEach var="store_sale" items="${store_sales}">
	<input type="hidden" name="store_sale_key" value="${store_sale.store_id}">
	<input type="hidden" name="store_sale_name"value="${store_sale.store_name}">
	<input type="hidden" name="store_sale_value"value="${store_sale.store_sale}">
</c:forEach>

<div id="table_div"></div>
<div id="chart_div"></div>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp"%>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script>

	//표
	google.charts.load('current', {'packages' : [ 'table' ]});
	google.charts.setOnLoadCallback(drawTable);

	function drawTable() {
		//오늘의 시간별 매출
		var store_sale_key = document.getElementsByName("store_sale_key");
		var store_sale_value = document.getElementsByName("store_sale_value");
		var store_sale_name= document.getElementsByName("store_sale_name");

		var mydata = [];
		//mydata.push([ '메뉴', '매출액(원)' ]);
		for (var i = 0; i < store_sale_key.length; i++) {
			mydata.push([ store_sale_key[i].value, store_sale_name[i].value, 
					parseInt(store_sale_value[i].value) ]);
		}


		//타임스케일
		var time_scale = document.getElementById("time_scale").value;
		var time_scale_title;//제목

		if (time_scale == 1 || time_scale == "") {
			time_scale_title = "오늘의 메뉴별 매출액";
		} else if (time_scale == 2) {
			time_scale_title = "이번달의 메뉴별 매출액";
		} else if (time_scale == 3) {
			time_scale_title = "이번 연도의 메뉴별 매출액";
		} else if (time_scale == 4) {
			time_scale_title = "전체 기간 메뉴별 매출액";
		}

		var data = new google.visualization.DataTable();
		
		data.addColumn('string', 'Store_id');
		data.addColumn('string', 'Store_name');
		data.addColumn('number', 'Sales');
		data.addRows(mydata);
		

		var table = new google.visualization.Table(document.getElementById('table_div'));

		table.draw(data, {
			showRowNumber : true,
			width : '100%',
			height : '100%',
			sortColumn:2,
			sortAscending: false,
			page: 'enable',
			pageSize: 20
		});
	}
</script>