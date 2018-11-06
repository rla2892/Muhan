<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>
<jsp:include page="store_topNav.jsp" flush="false"/>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<c:set var="jsondaymap" value="${jsondaymap}"/>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
  var jsondayparse = JSON.parse('${jsondaymap}');
  
  var daydata = [];
   for(var i in jsondayparse) {
	   daydata.push( [ i , jsondayparse[i]] );
  } 
  
  google.charts.load('current', {packages: ['corechart', 'bar']});
  google.charts.setOnLoadCallback(drawBasic);

  function drawBasic() {
		
		var data = new google.visualization.DataTable();
		data.addColumn('string', '시간');
		data.addColumn('number', '매출액');
		
		data.addRows(daydata);
		
		//그래프 모양
		var options = {
			title: '오늘의 시간대별 매출액',
			hAxis: {
				title: '시간대(시)',
				format: '시간',
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
  
  $( function() {
	    $( "#datepicker" ).datepicker({
	    	dateFormat: 'yy-mm-dd',
 	    	onSelect: function(dateText, inst) {
	    	      $("input[name='datepick']").val(dateText);
	    	      location.href="Store_revenue_day.do?day="+dateText;
	    	    } 
	    });
	  } );
  
  </script>
 <main>
 	<jsp:include page="store_aside_order.jsp" flush="false"/>
 <div class="container">
	 <div class="row">
	 	날짜 : &nbsp;<input type="text" id="datepicker" name="day">
	 </div>
 </div>
 <br>
 	<div class="container" id="chart_div"></div>
 </main>