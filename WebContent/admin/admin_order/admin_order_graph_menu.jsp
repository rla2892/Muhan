<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>

<%@ include file="../../admin/admin_ui/admin_aside_order.jsp" %>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="btn-group btn-group-justified">
  <a href="Admin_order_graph_menu.do?time_scale=1" class="btn btn-primary">오늘</a>
  <a href="Admin_order_graph_menu.do?time_scale=2" class="btn btn-primary">이번달</a>
  <a href="Admin_order_graph_menu.do?time_scale=3" class="btn btn-primary">이번년</a>
  <a href="Admin_order_graph_menu.do?time_scale=4" class="btn btn-primary">전체</a>
</div>

<!-- 일,월,년,전체 타임스케일 -->
<input type="hidden" name="time_scale" id="time_scale" value="${param.time_scale}">

<!-- 기본 데이터 -->
<c:forEach var="menu_sale" items="${menu_sales}">
	<input type="hidden" name="menu_sale_key" value="${menu_sale.key}">
	<input type="hidden" name="menu_sale_value" value="${menu_sale.value}">
</c:forEach>

<div id="chart_div"></div>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>


//그래프
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawMaterial);

function drawMaterial() {
	//오늘의 시간별 매출
	var menu_sale_key = document.getElementsByName("menu_sale_key"); 
	var menu_sale_value = document.getElementsByName("menu_sale_value"); 
	
	var mydata = [];
	mydata.push(['메뉴','매출액(원)']);
	for(var i=0; i<menu_sale_key.length;i++){
		mydata.push([menu_sale_key[i].value, parseInt(menu_sale_value[i].value)]);
	}
	
	var data = google.visualization.arrayToDataTable(mydata);
	
	//타임스케일
	var time_scale = document.getElementById("time_scale").value;
	var time_scale_title;//제목
	
	if(time_scale==1 || time_scale==""){
		time_scale_title="오늘의 메뉴별 매출액";
	}else if(time_scale==2){
		time_scale_title="이번달의 메뉴별 매출액";
	}else if(time_scale==3){
		time_scale_title="이번 연도의 메뉴별 매출액";
	}else if(time_scale==4){
		time_scale_title="전체 기간 메뉴별 매출액";
	}
	
	
      var materialOptions = {
		chart: {
		title: time_scale_title,
		},
		hAxis: {
			title: '매출액(원)',
			minValue: 0,
		},
		vAxis: {
			title: '메뉴',
		},
		bars: 'horizontal',
		width: 1000,
		height: 1200,
      };
      var materialChart = new google.charts.Bar(document.getElementById('chart_div'));
      materialChart.draw(data, materialOptions);
    }
	
</script>