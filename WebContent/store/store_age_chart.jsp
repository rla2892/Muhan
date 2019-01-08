<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	//표
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawPieChart);
    
	function drawPieChart() {
		var data = google.visualization.arrayToDataTable([
	          ['연령', '비율'],
	          ['20대',     ${count_ages2}],
	          ['30대',     ${count_ages3}],
	          ['40대',  ${count_ages4}],
	          ['50대', ${count_ages5}],
	          ['60대',    ${count_ages6}]
	        ]);

	        var options = {
	          title: '고객 연령 비율'
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

	        chart.draw(data, options);
		
	}
</script>
<div id="piechart" style="height:250px;"></div>