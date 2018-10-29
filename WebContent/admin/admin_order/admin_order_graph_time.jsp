<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>

<%@ include file="../../admin/admin_ui/admin_aside_order.jsp" %>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="btn-group btn-group-justified">
  <a href="Admin_order_graph_time.do?time_scale=1" class="btn btn-primary">오늘</a>
  <a href="Admin_order_graph_time.do?time_scale=2" class="btn btn-primary">이번달</a>
  <a href="Admin_order_graph_time.do?time_scale=3" class="btn btn-primary">이번년</a>
  <a href="Admin_order_graph_time.do?time_scale=4" class="btn btn-primary">전체</a>
</div>

<!-- 일,월,년,전체 타임스케일 -->
<input type="hidden" name="time_scale" id="time_scale" value="${param.time_scale}">

<!-- 기본 데이터 -->
<c:forEach var="time_sale" items="${time_sales}">
	<input type="hidden" name="time_sale_key" value="${time_sale.key}">
	<input type="hidden" name="time_sale_value" value="${time_sale.value}">
</c:forEach>
<!-- 누적 데이터 -->
<c:forEach var="time_sale_cumul" items="${time_sales_cumul}">
	<input type="hidden" name="time_sale_cumul_key" value="${time_sale_cumul.key}">
	<input type="hidden" name="time_sale_cumul_value" value="${time_sale_cumul.value}">
</c:forEach>

<div id="chart_div"></div>
<div id="chart_div_cumul"></div>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>


//그래프
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);
google.charts.setOnLoadCallback(drawCumul);

function drawBasic() {
	

	//오늘의 시간별 매출
	var time_sale_key = document.getElementsByName("time_sale_key"); 
	var time_sale_value = document.getElementsByName("time_sale_value"); 
	//타임스케일
	var time_scale = document.getElementById("time_scale").value;
	var time_scale_str;//단위
	var time_scale_title;//제목
	var time_scale_xtitle;//x제목
	
	if(time_scale==1 || time_scale==""){
		time_scale_str="시";
		time_scale_title="오늘의 시간대별 매출액";
		time_scale_xtitle="시간대(시)";
	}else if(time_scale==2){
		time_scale_str="일";
		time_scale_title="이번달의 일별 매출액";
		time_scale_xtitle="시간대(일)";
	}else if(time_scale==3){
		time_scale_str="월";
		time_scale_title="이번 연도의 월별 매출액";
		time_scale_xtitle="시간대(월)";
	}else if(time_scale==4){
		time_scale_str="년";
		time_scale_title="연도별 매출액";
		time_scale_xtitle="시간대(년)";
	}
	
	var mydata = [];
	for(var i=0; i<time_sale_key.length;i++){
		mydata.push([parseInt(time_sale_key[i].value), parseInt(time_sale_value[i].value)]);
	}
	
	
	for(var i=0; i<mydata.length;i++){
		mydata[i][0]=mydata[i][0]+time_scale_str;
	}
	
	
	var data = new google.visualization.DataTable();
	data.addColumn('string', '시간');
	data.addColumn('number', '매출액');
	
	data.addRows(mydata);
	
	//그래프 모양
	var options = {
		title: time_scale_title,
		hAxis: {
			title: time_scale_xtitle,
		},
		vAxis: {
			title: '매출액(원)'
		},
		width:1100,
		height:500
	};
	
	//그래프 그리기 시행
	var chart = new google.visualization.ColumnChart(
		document.getElementById('chart_div'));
		chart.draw(data, options);
}
	
function drawCumul() {
	

	//오늘의 시간별 매출
	var time_sale_key = document.getElementsByName("time_sale_cumul_key"); 
	var time_sale_value = document.getElementsByName("time_sale_cumul_value"); 
	//타임스케일
	var time_scale = document.getElementById("time_scale").value;
	var time_scale_str;//단위
	var time_scale_title;//제목
	var time_scale_xtitle;//x제목
	
	if(time_scale==1 || time_scale==""){
		time_scale_str="시";
		time_scale_title="오늘의 시간대별 누적 매출액";
		time_scale_xtitle="시간대(시)";
	}else if(time_scale==2){
		time_scale_str="일";
		time_scale_title="이번달의 일별 누적 매출액";
		time_scale_xtitle="시간대(일)";
	}else if(time_scale==3){
		time_scale_str="월";
		time_scale_title="이번 연도의 월별 누적 매출액";
		time_scale_xtitle="시간대(월)";
	}else if(time_scale==4){
		time_scale_str="년";
		time_scale_title="연도별 누적 매출액";
		time_scale_xtitle="시간대(년)";
	}
	
	var mydata = [];
	for(var i=0; i<time_sale_key.length;i++){
		mydata.push([parseInt(time_sale_key[i].value), parseInt(time_sale_value[i].value)]);
	}
	
	
	for(var i=0; i<mydata.length;i++){
		mydata[i][0]=mydata[i][0]+time_scale_str;
	}
	
	
	var data = new google.visualization.DataTable();
	data.addColumn('string', '시간');
	data.addColumn('number', '매출액');
	
	data.addRows(mydata);
	
	//그래프 모양
	var options = {
		title: time_scale_title,
		hAxis: {
			title: time_scale_xtitle,
		},
		vAxis: {
			title: '매출액(원)'
		},
		width:1100,
		height:500
	};
	
	//그래프 그리기 시행
	var chart = new google.visualization.AreaChart(
		document.getElementById('chart_div_cumul'));
		chart.draw(data, options);
}
</script>