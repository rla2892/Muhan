<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<script src="cus/cus_cart/cus_cart_script.js"></script>

<style>
.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>

<c:forEach var="store_member_dto" items="${store_member_dtos}">
	<input type="hidden" name="store_id" id="store_id" value="${store_member_dto.store_id}">
	<input type="hidden" name="store_address" id="store_address" value="${store_member_dto.store_address}">
	<input type="hidden" name="store_name" id="store_name" value="${store_member_dto.store_name}">
	<input type="hidden" name="store_lon" id="store_lon" value="${store_member_dto.store_lon}">
	<input type="hidden" name="store_lat" id="store_lat" value="${store_member_dto.store_lat}">
</c:forEach>

<div class="container-fluid">
	<div class="row">
		<div class="col">
			<div id="map" style="width:100%;height:100%;"></div>
		</div>
		<div class="col">
			<div id="nearestStore"></div>
		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84ade146f4c88c0cf4ae826cc2f4eec8&libraries=services"></script>
<script>
////////////////////store 값들 받아오기
var store_ids = document.getElementsByName("store_id");

var store_names = document.getElementsByName("store_name");
var store_addresses = document.getElementsByName("store_address");	//주소 태그들 받기
var store_lon = document.getElementsByName("store_lon");	//주소 태그들 받기
var store_lat = document.getElementsByName("store_lat");	//주소 태그들 받기

var store_addresses_values = [];	//주소 배열 생성
var store_lon_values = [];	//경도 배열 생성
var store_lat_values = [];	//위도 배열 생성
var store_names_values = [];	//매장명 배열 생성
var store_id_values = [];	//매장명 배열 생성


for(var i=0; i<store_addresses.length;i++){	//주소 배열에 값들 삽입
	store_addresses_values.push(store_addresses[i].value);
}
for(var i=0; i<store_lon.length;i++){	
	store_lon_values.push(store_lon[i].value);
}
for(var i=0; i<store_lat.length;i++){	
	store_lat_values.push(store_lat[i].value);
}
for(var i=0; i<store_names.length;i++){	
	store_names_values.push(store_names[i].value);
}
for(var i=0; i<store_id.length;i++){	
	store_id_values.push(store_id[i].value);
}
////////////////////////////// 현재 좌표

function error() {
	alert("사용자의 위치를 찾을 수 없습니다.");
};

navigator.geolocation.getCurrentPosition(success, error);


////////////////////////////// 지도 그리기
function success(position) {
	var mylatitude  = position.coords.latitude;
	var mylongitude = position.coords.longitude;
	var mylocation = new daum.maps.LatLng(mylatitude,mylongitude);
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: mylocation, // 지도의 중심좌표
	    level: 4 // 지도의 확대 레벨
	};
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	var mymarker = new daum.maps.Marker({	//내 위치 마커
	    position: mylocation,
	    title:"내위치",
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	mymarker.setMap(map);
	
	//컨텐트
	var mycontent = '<div class="customoverlay">' +
    '  <a href="cus_user_main.do" target="_blank">' +
    '    <span class="title">현재위치</span>' +
    '  </a>' +
    '</div>';
	
	var mycustomOverlay = new daum.maps.CustomOverlay({
		map:map,
	    position: mylocation,
	    content: mycontent,
	});
	
	
	var positions=[];
	for(var i=0; i<store_names.length;i++){
		positions.push({
			address:store_addresses_values[i],
			name: store_names_values[i],
			id:store_id_values[i],
			latlng:  new daum.maps.LatLng(store_lat[i].value,store_lon[i].value),
			//distance: Math.pow((mylocation.getLat()-store_lat[i].value),2)+Math.pow((mylocation.getLng()-store_lon[i].value),2)
			distance: parseInt(new daum.maps.Polyline({
				path: [
					mylocation,
					new daum.maps.LatLng(store_lat[i].value,store_lon[i].value)
				]
			}).getLength()
			)
			
		});
	}
	
	positions.sort(function(a, b){return a.distance - b.distance});
	
	for (var i = 0; i < 5; i ++) {
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    map: map, // 마커를 표시할 지도
		    position: positions[i].latlng, // 마커를 표시할 위치
		    title : positions[i].title // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		});
		//커스텀오버레이
		//컨텐트
		var content = '<div class="customoverlay">' +
	    '  <a href="cus_store_details.do?store_id='+positions[i].id+'" target="_blank">' +
	    '    <span class="title">'+positions[i].name+'</span>' +
	    '  </a>' +
	    '</div>';
		var customOverlay = new daum.maps.CustomOverlay({
			map:map,
		    position: positions[i].latlng,
		    content: content   
		});
	}
	var storehtml ="";
	storehtml +='<table class="table table-hover">';
	storehtml +=	'<tr>';
	storehtml +=		'<td>주소</td>';
	storehtml +=		'<td>매장명</td>';
	storehtml +=		'<td>선택</td>';
	storehtml +=	'</tr>';
	for(var i=0;i<5;i++){
		storehtml+='<tr>';
		storehtml+=	'<td>'+positions[i].address+'<td>';
		storehtml+=	'<td>'+positions[i].name+'<td>';
		storehtml+=	'<td><button class="btn btn-md btn-secondary" onclick="setStore('+"'"+positions[i].id+"'"+','+"'"+positions[i].name+"'"+');">';
		storehtml+=	'선택</button></td>';
		storehtml+='</tr>';
	}
	
	storehtml +='</table>';
	document.getElementById("nearestStore").innerHTML = storehtml;
	
};
</script>

