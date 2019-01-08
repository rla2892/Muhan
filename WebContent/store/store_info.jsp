<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>
<jsp:include page="store_topNav.jsp" flush="false"/>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<style>
.wrapper {
    display: flex;
    width: 100%;
    align-items: stretch;
}
</style>

<main>
	<div class="wrapper">
		<div class="container">
			<table class="table table-hover">
				<tr>
					<th>ID</th>
					<td>${store_member_dto.store_id}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td id="address">${store_member_dto.store_address}</td>
				</tr>
				<tr>
					<th>매장명</th>
					<td id='store_name'>${store_member_dto.store_name}</td>
				</tr>
				<tr>
					<th>매장 전화번호</th>
					<td>${store_member_dto.store_tel}</td>
				</tr>
				<tr>
					<th>점주명</th>
					<td>${store_member_dto.owner_name}</td>
				</tr>
				<tr>
					<th>점주 전화번호</th>
					<td>${store_member_dto.owner_tel}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${store_member_dto.owner_reg_date}</td>
				</tr>
				<tr>
					<th>점주 이메일</th>
					<td>${store_member_dto.owner_email}</td>
				</tr>
				<tr>
					<th>고객 연령 비율</th>
					<td id="piechart" style="height:250px;"></td>
				</tr>
				<tr>
					<th>상권 유형</th>
					<td>
						<c:if test="${sumsum eq 1}">
							대학/학원가
						</c:if>
						<c:if test="${sumsum eq 2}">
							상업지역
						</c:if>
						<c:if test="${sumsum eq 3}">
							주거지역
						</c:if>
					</td>
				</tr>
				<tr>
					<th>위치</th>
					<td><div id="map" style="width:500px;height:250px;"></div></td>
				</tr>
			</table>
		</div>
	</div>
</main>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84ade146f4c88c0cf4ae826cc2f4eec8&libraries=services"></script>
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

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch(document.getElementById('address').innerHTML, function(result, status) {
	
	// 정상적으로 검색이 완료됐으면 
	 if (status === daum.maps.services.Status.OK) {
	
	    var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new daum.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new daum.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">롯데리아'+document.getElementById('store_name').innerHTML+'</div>'
	    });
	    infowindow.open(map, marker);
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
	});    
</script>
