<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>
<jsp:include page="store_topNav.jsp" flush="false"/>

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
			title: '해당 월 일별 매출액',
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
  
  function updateMonthRevenue(value) {
		location.href="Store_revenue_month.do?month="+value;
	}
  
  </script>
 <main>
 	<jsp:include page="store_aside_order.jsp" flush="false"/>
 <div class="container">
	 <div class="row">
		  월 :&nbsp;<select id="month" name="month" onchange="updateMonthRevenue(this.value)">
		   <option value="hide">-- 월 선택 --</option>
		    <option value="01">1월</option>
		    <option value="02">2월</option>
		    <option value="03">3월</option>
		    <option value="04">4월</option>
		    <option value="05">5월</option>
		    <option value="06">6월</option>
		    <option value="07">7월</option>
		    <option value="08">8월</option>
		    <option value="09">9월</option>
		    <option value="10">10월</option>
		    <option value="11">11월</option>
		    <option value="12">12월</option>
		</select>
	</div>
</div>
<br>
 	<div class="container" id="chart_div"></div>
 </main>