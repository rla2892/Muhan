<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="store_setting.jsp"%>
<style>
	.wrapper {
	    display: flex;
	    width: 100%;
	    align-items: stretch;
	}
</style>
<script src="${project}script.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
//그래프
	
   	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);
	
	//품목 개수
	var itemNum=${order_history_dto.size()};
	function drawBasic() {
			
		//상품 이름/매출
		var menu_name = document.getElementsByName("menu_name"); 
		var menu_price = document.getElementsByName("menu_price"); 
	
		
		var storedata=[];
		for(var i=0;i<itemNum;i++){
			storedata.push([menu_name[i].value, parseInt(menu_price[i].value)]);
		} 

		var data = new google.visualization.DataTable();
		data.addColumn('string', '품목');
		data.addColumn('number', '매출액(원)');
		
		
		data.addRows(storedata);
		
		var classicOptions = {
				width:1100,
				height: setHeight(itemNum),
		        title: '오늘 품목별 매출',
		        chartArea: {width: '50%'},
		        hAxis: {
		        	
		        	 0: {axis:'매출액(원)'}
		        
		        },
		        vAxis: {
		        	 x: {
		               	'매출액(원)': { label: '매출액(원)',format: 'decimal' } // Top x-axis.
		              
		               }
		        }
		      };
		//그래프 모양
		//그래프 그리기 시행
		 var chartDiv=document.getElementById('chart_div');
			
		   function drawClassicChart() {
			   var chart = new google.visualization.BarChart(chartDiv);
			   chart.draw(data, classicOptions);
	     } 
	    //drawMaterialChart();
	    if(itemNum>0)drawClassicChart();
	    else{
	    	chartDiv.append("매출이 없습니다")
	    }
	}

	var today=new Date();
	var year=today.getFullYear();
	var month=today.getMonth()+1;
	var day=today.getDate();
</script>
<body>
<jsp:include page="store_topNav.jsp" flush="false"/>
<jsp:useBean id="today" class="java.util.Date"/>
<main>
	<div class="wrapper">
		<jsp:include page="store_aside_order.jsp" flush="false"/>
		<div class="container">
				<c:forEach var="order_history" items="${order_history_dto}">
					<input type="hidden" name="menu_name" value="${order_history.menu_name}">
					<input type="hidden" name="menu_category" value="${order_history.menu_category}">
					<input type="hidden" name="menu_price" value="${order_history.menu_price}">
					
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
					일:&nbsp;
					<select name="dayGroup">
						<fmt:formatDate value="${today}" var="curday" pattern="dd" />
						
						<c:forEach var="i" begin="1" end="31" step="1">
							<c:if test="${i eq curday}">
								<option value="${i}" selected="selected">${i}</option>
							</c:if>
							<c:if test="${i ne curday}">
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
					<button type="button" class="btn btn-sm" onclick="updateGraphAll()">조회</button>
				</div>
				<br>
				<div id="chartArea" class="row">
					<div id="chart_div"></div>
				</div>
		</div>
		</div>
	</main>
</body>