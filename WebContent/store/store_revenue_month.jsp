<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>

<c:set var="jsonmonthmap" value="${jsonmonthmap}"/>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
  var jsonmonthparse = JSON.parse('${jsonmonthmap}');
  
  var monthdata = [];
   for(var i in jsonmonthparse) {
	   monthdata.push( [ i , jsonmonthparse[i]] );
  } 
  
  google.charts.load('current', {packages: ['corechart', 'bar']});
  google.charts.setOnLoadCallback(drawBasic);

  function drawBasic() {
		
		var data = new google.visualization.DataTable();
		data.addColumn('string', '일');
		data.addColumn('number', '매출액');
		
		data.addRows(monthdata);
		
		//그래프 모양
		var options = {
			title: '이번달 일별 매출액',
			hAxis: {
				title: '일별(일)',
				format: '일',
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
 <div id="chart_div"></div>