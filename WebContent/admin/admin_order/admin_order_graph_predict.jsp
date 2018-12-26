<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>

<%@ include file="../../admin/admin_ui/admin_aside_order.jsp" %>
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
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
<!-- 예상 데이터 -->
<c:forEach var="time_sales_predict" items="${time_sales_predicted}">
	<input type="hidden" name="time_sales_predict_key" value="${time_sales_predict.key}">
	<input type="hidden" name="time_sales_predict_value" value="${time_sales_predict.value}">
</c:forEach>
<!-- 예상 누적 데이터 -->
<c:forEach var="time_sales_cumul_predict" items="${time_sales_cumul_predicted}">
	<input type="hidden" name="time_sales_cumul_predict_key" value="${time_sales_cumul_predict.key}">
	<input type="hidden" name="time_sales_cumul_predict_value" value="${time_sales_cumul_predict.value}">
</c:forEach>

<div id="chart"></div>
<div id="chart_cumul"></div>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>


<!-- 빌보드.js 쓰기 위한 준비 -->
<script src="https://d3js.org/d3.v5.min.js"></script>
<link rel="stylesheet" href="https://naver.github.io/billboard.js/release/latest/dist/billboard.css">
<script src="https://naver.github.io/billboard.js/release/latest/dist/billboard.js"></script>

<script>
//노드를 리스트 데이터로 바꾸는 함수
function to_list(elements,col_name){
	list_data=[]
	list_data.push(col_name)
	for(var i=0; i<elements.length;i++){
		list_data.push(elements[i].value);
	}
	return list_data;
}

//오늘의 시간별 매출
var time_sale_value = document.getElementsByName("time_sale_value");
var time_sales_predict_value = document.getElementsByName("time_sales_predict_value");

time_sale_data=to_list(time_sale_value,"오늘의매출액");
time_sale_predict_data=to_list(time_sales_predict_value,"예상매출액");

//오늘의 시간별 누적 매출
var time_sale_cumul_value = document.getElementsByName("time_sale_cumul_value");
var time_sales_cumul_predict_value = document.getElementsByName("time_sales_cumul_predict_value");

time_sale_cumul_data=to_list(time_sale_cumul_value,"오늘의 누적매출액");
time_sale_cumul_predict_data=to_list(time_sales_cumul_predict_value,"예상 누적매출액");

//generate the chart
var chart = bb.generate({
    bindto: "#chart",
    data: {
      type: "line",
        columns: [
        	time_sale_data,
        	time_sale_predict_data
        ]
    }
});
//generate the chart : cumul
var chart = bb.generate({
    bindto: "#chart_cumul",
    data: {
      type: "line",
        columns: [
        	time_sale_cumul_data,
        	time_sale_cumul_predict_data
        ]
    }
});
</script>