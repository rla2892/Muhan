<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>
<jsp:include page="store_topNav.jsp" flush="false"/>

<c:set var="jsonyearmap" value="${jsonyearmap}"/>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
  var jsonyearparse = JSON.parse('${jsonyearmap}');
  
  var yeardata = [];
   for(var i in jsonyearparse) {
	   yeardata.push( [ i , jsonyearparse[i]] );
  } 
  
  google.charts.load('current', {packages: ['corechart', 'bar']});
  google.charts.setOnLoadCallback(drawBasic);

  function drawBasic() {
		
		var data = new google.visualization.DataTable();
		data.addColumn('string', '월');
		data.addColumn('number', '매출액');
		
		data.addRows(yeardata);
		
		//그래프 모양
		var options = {
			title: '이번년도 월별 매출액',
			hAxis: {
				title: '월별(월)',
				format: '월',
				viewWindow: {
					min: [7, 30, 0],
					max: [57, 30, 0]
				}
			},
			vAxis: {
				title: '매출액(원)'
			},
			width:1100,
			height:500
		};

  	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
  	chart.draw(data, options);
  }
  </script>
 <main>
 	<jsp:include page="store_aside_order.jsp" flush="false"/>
 	<div class="container" id="chart_div"></div>
 </main>