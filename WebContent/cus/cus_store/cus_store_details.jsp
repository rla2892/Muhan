<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>

<html>
	<head>
		<%@include file="/cus/cus_head.jsp"%>
	</head>
	<body>
		<%@include file="/cus/cus_topNav.jsp"%>		
		<%@include file="/cus/cus_store/cus_store_subNav.jsp"%>
		
		<div class="container-fluid mt-1 pt-2">	
			<div class="group d-inline">
  				<div class="map border border-warning col-lg-7 text-center" id="store">
  						
  				</div>
  				<div class="col-lg-5 float-right mt-5 pt-4">
  					<div class="d-block">
  						<h2 class="text-center ml-4 mt-4 mb-5" id="store_name"><strong>${std.store_name}</strong></h2>
  						<h5 class="text-center ml-4 mt-5">매장 주소: ${std.store_address}</h5>
  						<h5 class="text-center ml-4 mt-4">매장 전화 번호: ${std.store_tel}</h5>
  						<h5 class="text-center ml-4 mt-4">영업 시간: 10:00 - 22:00</h5>
  						<h5 class="text-center ml-4 mt-4">최소 주문 금액: 10,000원</h5>
  						<br>
  						<div class="text-center">
  							<button class="btn btn-warning btn btn-pull-center" type="button" onclick="location='cus_store.do'"><strong>목록으로</strong></button>
  						</div>
  					</div>
  				</div>
			</div>
			
			<!-- API가 아래의 숨겨진 div에서 주소 정보를 잡아온다 -->
			<div class="d-none" id="store_address">${std.store_address}</div>
		<%@include file="/cus/cus_fixedFooter.jsp"%>		
		</div>
	</body>
</html>

<script type="text/javascript" 
src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a5bf82ef7d05269ccc81f0f8f243c9f&libraries=services"></script>

<script>
var mapContainer = document.getElementById('store'); // 지도를 표시할 div 

mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  
//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch(document.getElementById('store_address').innerHTML, function(result, status) {
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
			content: '<div class="col-lg-12 text-center font-weight-bold text-warning bg-dark ml-0 mr-3">롯데리아'+document.getElementById('store_name').innerHTML+'</div>'
		});
	    infowindow.open(map, marker);

		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		map.setCenter(coords);

	}
});
</script>	
    