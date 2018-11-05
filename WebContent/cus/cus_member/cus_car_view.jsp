<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>
<script src="./jquery-3.3.1.js"></script>

<link rel="stylesheet" type="text/css" href="/Muhan/cus/cus_theme.css">
		
		<%@include file="/cus/cus_topNav.jsp"%>
		<%@include file="/cus/cus_member/cus_member_subNav.jsp"%>

<div class="container">
	<div class="col-sm-8" id="map" style="width:100%;height:73%;"></div>
	<div class="col-sm-4 alignment-center">
		<h1>배달상태</h1>
		<c:if test="${order_status eq 1}">1 주문 대기</c:if>
		<c:if test="${order_status eq 2}">2 주문 접수</c:if>
		<c:if test="${order_status eq 3}">3 주문 확인</c:if>
		<c:if test="${order_status eq 4}">4 주문 완료</c:if>
	</div>
</div>

<input type="hidden" name="cus_address" id="cus_address" value="${cus_address}">

<%@include file="/cus/cus_fixedFooter.jsp"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84ade146f4c88c0cf4ae826cc2f4eec8&libraries=services,clusterer"></script>
<script>


var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 6 //지도의 레벨(확대, 축소 정도)
};
var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

//고객의 주소
var cus_address = document.getElementById('cus_address').value;
var geocoder = new daum.maps.services.Geocoder();
var callback = function(result, status) {
	if (status === daum.maps.services.Status.OK) {
		var cus_location = new daum.maps.LatLng(result[0].y,result[0].x);
		map.setCenter(cus_location);
		cus_marker = new daum.maps.Marker({	// 마커
			position: cus_location,
			title:"고객"
		});
		cus_marker.setMap(map);
		var customOverlay = new daum.maps.CustomOverlay({
		    map: map,
		    clickable: false,
		    content: '<input type="text" style="width:50px;" value="배송지">',
		    position: cus_location,
		    xAnchor: 0.5,
		    yAnchor: 2.7,
		    zIndex: 3
		});
	}
};
geocoder.addressSearch(cus_address, callback);


//마커 클러스터러를 생성합니다 
var clusterer = new daum.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 10 // 클러스터 할 최소 지도 레벨 
});

var bike = '/Muhan/cus/cus_images/bike.png'; // 마커이미지의 주소입니다    
bikeSize = new daum.maps.Size(30, 30); // 마커이미지의 크기입니다
imageOption = {offset: new daum.maps.Point(1, 1)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
var reddot = '/Muhan/cus/cus_images/reddot.png'; // 마커이미지의 주소입니다    
reddotSize = new daum.maps.Size(10, 10); // 마커이미지의 크기입니다
  
//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var bikeImage = new daum.maps.MarkerImage(bike, bikeSize, imageOption)
var reddotImage = new daum.maps.MarkerImage(reddot, reddotSize, imageOption)

</script>

<script type="text/javascript">
//<!--

setInterval(
	function(){
		$.ajax(
			{
				type : 'post',
				url : 'cus_car_location.do?order_no='+${param.order_no},
				dataType : 'xml',	//json은 jsp파일 안에 있어서 안 읽힘 그래서 대신 text로 준다
				success : function(data){
					
					
					//alert("success");
					var order_hisotry_car_dtos= data.getElementsByTagName('order_hisotry_car_dto');
					
					clusterer.clear();
					for(var i=0; i<order_hisotry_car_dtos.length; i++){
						var car_id = order_hisotry_car_dtos[i].children[0].textContent;
						var order_no = order_hisotry_car_dtos[i].children[1].textContent;
						var car_x = order_hisotry_car_dtos[i].children[2].textContent;
						var car_y = order_hisotry_car_dtos[i].children[3].textContent;
						var car_x_before=0;
						var car_y_before=0;
						if(i !=0 ){
							car_x_before = order_hisotry_car_dtos[i-1].children[2].textContent;
							car_y_before = order_hisotry_car_dtos[i-1].children[3].textContent;
						}
						var car_date = order_hisotry_car_dtos[i].children[4].textContent;
						
						var car_location = new daum.maps.LatLng(car_y,car_x);
						
						var car_marker;
						
						if(i==0){
							car_marker = new daum.maps.Marker({	// 마커
							    position: car_location,
							    title:"차량",
							    image:bikeImage
							});
						}else{
							car_marker = new daum.maps.Marker({	// 마커
							    position: car_location,
							    title:"차량",
							    image:reddotImage
							});
						}
						// 마커가 지도 위에 표시되도록 설정합니다
						//car_marker.setMap(map);
						
						// 클러스터러에 마커들을 추가합니다
				        clusterer.addMarker(car_marker);
						
						//선을 그립니다
						if(i !=0 ){
							var polyline = new daum.maps.Polyline({
							    map: map,
							    path: [
							        new daum.maps.LatLng(car_y_before, car_x_before),
							        new daum.maps.LatLng(car_y, car_x) 
							    ],
							    strokeWeight: 4,
							    strokeColor: '#FF99FF',
							    strokeOpacity: 1.0,
							    strokeStyle: 'solid'
							});
						}
						
						//지도 중심 설정
						if(i==0){
							map.setCenter(car_location);
						}
					}
					
				},
				error : function(e){
					alert("error");
				}
			}
		);
	},2000);
//-->
</script>

