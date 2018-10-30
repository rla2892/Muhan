<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>
<script>
//그래프
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawUpdate);


function setHeight(itemNum){
	return 100*itemNum;
}
function drawUpdate() {
	var itemNum=${order_history_dto.size()};
	//상품 이름/매출
	var menu_name = document.getElementsByName("name"); 
	var menu_price = document.getElementsByName("price"); 
	var menu_num=document.getElementsByName("num");
	
	var storedata=[];
	for(var i=0;i<itemNum;i++){
		storedata.push([menu_name[i].value, parseInt(menu_price[i].value),parseInt(menu_num[i].value)]);
	}
	
	var data = new google.visualization.DataTable();
	data.addColumn('string', '품목');
	data.addColumn('number', '매출액(원)');
	data.addColumn('number','판매개수(개)');
	
	data.addRows(storedata);
	
	//그래프 모양 
    var classicOptions = {
  	      width:1000,
          height:setHeight(itemNum),
          legend: { position: 'top' },
          chart: { title: '${year}년  ${month}월 '+setCategory(${menu_category})+'품목별 매출액과 판매개수'},
          bars: 'horizontal', // Required for Material Bar Charts.
          series: {
  	        0: {axis:'매출액(원)'},
  	        1: {axis:'판매개수(개)'}
  	      },
          axes: {
            x: {
            	'매출액(원)': { label: '매출액(원)'}, // Top x-axis.
            	'판매개수(개)': {side: 'top', label: '판매개수(개)'}
            }
          },
          bar: { groupWidth: "90%"}
	    };

		//그래프 그리기 시행
		 var chartDiv=document.getElementById('chart_div');
		
		   function drawClassicChart() {
	       var classicChart = new google.charts.Bar(chartDiv);
	       classicChart.draw(data, classicOptions);
	     } 
	    drawClassicChart();
  	}

</script>
<c:forEach var="order_history" items="${order_history_dto}">
	<input type="hidden" name="name" value="${order_history.menu_name}">
	<input type="hidden" name="price" value="${order_history.menu_price}">
	<input type="hidden" name="num" value="${order_history.menu_num}">
</c:forEach>
<div id="chart_div"></div>