<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
//그래프
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);
	
	function drawBasic() {
		//품목 개수
		var itemNum=${order_history_dto.size()};
		
		//상품 이름/매출
		var menu_name = document.getElementsByName("menu_name"); 
		var menu_price = document.getElementsByName("menu_price"); 
		var menu_num=document.getElementsByName("menu_num");
		
		var storedata=[];
		for(var i=0;i<itemNum;i++){
			storedata.push([menu_name[i].value, parseInt(menu_price[i].value),parseInt(menu_num[i].value)]);
		}
		
		var data = new google.visualization.DataTable();
		data.addColumn('string', '품목');
		data.addColumn('number', '매출액(원)');
		data.addColumn('number','판매개수(개)'); 
		
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
          height: setHeight(itemNum),
          legend: { position: 'top' },
          chart: { title: '이번달 품목별 매출'},
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
          bar: { groupWidth: "90%" }
	    };

		//그래프 그리기 시행
		 var chartDiv=document.getElementById('chart_div');
		
		   function drawClassicChart() {
	       var classicChart = new google.charts.Bar(chartDiv);
	       classicChart.draw(data, classicOptions);
	     } 
	    //drawMaterialChart();
	    drawClassicChart();
	}

	var today=new Date();
	var year=today.getFullYear();
	var month=today.getMonth()+1;
</script>
<jsp:useBean id="today" class="java.util.Date"/>

<jsp:include page="store_topNav.jsp" flush="false"/>
<jsp:include page="store_aside_order.jsp" flush="false"/>

<div class="container">
		<c:forEach var="order_history" items="${order_history_dto}">
			<input type="hidden" name="menu_name" value="${order_history.menu_name}">
			<input type="hidden" name="menu_category" value="${order_history.menu_category}">
			<input type="hidden" name="menu_price" value="${order_history.menu_price}">
			<input type="hidden" name="menu_num" value="${order_history.menu_num}">
		</c:forEach>

		<br>
		<div class="row">
			년도:&nbsp;
			<select name="yearGroup">
				<fmt:formatDate value="${today}" var="curyear" pattern="yyyy" />
				<c:forEach var="i" begin="${owner_date.year}" end="${curyear}" step="1">
					<c:if test="${i eq curyear}">
						<option value="${i}" selected="selected">${i}</option>
					</c:if>
					<c:if test="${i ne curyear}">
						<option value="${i}">${i}</option>
					</c:if>
				</c:forEach>
			</select>
			&nbsp;
			월:&nbsp;
			<select name="monthGroup">
				<fmt:formatDate value="${today}" var="curmonth" pattern="MM" />
				
				<c:forEach var="i" begin="1" end="12" step="1">
					<c:if test="${i eq curmonth}">
						<option value="${i}" selected="selected">${i}</option>
					</c:if>
					<c:if test="${i ne curmonth}">
						<option value="${i}">${i}</option>
					</c:if>
				</c:forEach>
			</select>
			&nbsp;
			품목:&nbsp; 
			<select name="itemGroup">
				<option value="0" selected="selected">전체</option>
				<option value="1">세트</option>
				<option value="2">버거</option>
				<option value="3">사이드와 음료</option>
				<option value="4">신제품-세트</option>
				<option value="5">신제품-버거</option>
			</select>
			&nbsp;
			<button type="button" class="btn btn-sm" onclick="updateGraph()">조회</button>
		</div>
		<br>
		<div id="chartArea" class="row">
			<div id="chart_div"></div>
		</div>
</div>

