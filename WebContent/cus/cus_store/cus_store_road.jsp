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

		<div class="container-fluid col-lg-11 d-flex flex-row mt-5 pt-5">
			<c:forEach var="store_member_dto" items="${store_member_dtos}">
				<input type="hidden" name="store_id" id="store_id" value="${store_member_dto.store_id}">
				<input type="hidden" name="store_address" id="store_address" value="${store_member_dto.store_address}">
				<input type="hidden" name="store_name" id="store_name" value="${store_member_dto.store_name}">
				<input type="hidden" name="store_lon" id="store_lon" value="${store_member_dto.store_lon}">
				<input type="hidden" name="store_lat" id="store_lat" value="${store_member_dto.store_lat}">
			</c:forEach>
		
			<div id="map_div" class="col-lg-5 storesMap border border-warning flex-item">
			</div>
			<div id="nearestStore" class="col-lg-7 flex-item mt-4">
			</div>
		</div>
	<%@include file="/cus/cus_fixedFooter.jsp"%>
	</body>
</html>

<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=5be12d9a-1dc5-4b15-9a9e-2df720097696"></script>
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

var map;
map = new Tmap.Map({div:'map_div'});
// 페이지가 로딩이 된 후 호출하는 함수입니다.
function initTmap(num){
	// map 생성
	// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
	//map = new Tmap.Map({div:'map_div', width:'100%', height:'400px'});

	var tData = new Tmap.TData();//REST API 에서 제공되는 경로, 교통정보, POI 데이터를 쉽게 처리할 수 있는 클래스입니다.
	
	//////////////////////////////현재 좌표
	function error() {
		alert("사용자의 위치를 찾을 수 없습니다.");
	}

	navigator.geolocation.getCurrentPosition(success, error);
	
	function success(position) {
		var mylatitude  = position.coords.latitude;
		var mylongitude = position.coords.longitude;
		var mylocation = new Tmap.LonLat(mylongitude,mylatitude);
		
		var positions=[];
		for(var i=0; i<store_names.length;i++){
			positions.push({
				name: store_names_values[i],
				address: store_addresses_values[i],
				id:store_id_values[i],
				latlng:  new Tmap.LonLat(store_lon[i].value,store_lat[i].value),
				distance: Math.pow((mylatitude-store_lat[i].value),2)+Math.pow((mylongitude-store_lon[i].value),2)
				//distance: parseInt(new daum.maps.Polyline({
				//	path: [
				//		mylocation,
				//		new daum.maps.LatLng(store_lat[i].value,store_lon[i].value)
				//	]
				//}).getLength()
				//)
				
			});
		}
		
		positions.sort(function(a, b){return a.distance - b.distance});
		
		//var s_lonLat = new Tmap.LonLat(126.925356, 37.553756); //시작 좌표입니다.   
		var s_lonLat = mylocation; //시작 좌표입니다.   
		//var e_lonLat = new Tmap.LonLat(126.975598, 37.554034); //도착 좌표입니다.
		var e_lonLat = positions[num].latlng; //도착 좌표입니다.
		var optionObj = {
             reqCoordType:"WGS84GEO", //요청 좌표계 옵셥 설정입니다.
             resCoordType:"EPSG3857"  //응답 좌표계 옵셥 설정입니다.
             }
		
		tData.getRoutePlan(s_lonLat, e_lonLat, optionObj);//경로 탐색 데이터를 콜백 함수를 통해 XML로 리턴합니다.
		
		tData.events.register("onComplete", tData, onComplete);//데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트를 등록합니다.
		tData.events.register("onProgress", tData, onProgress);//데이터 로드중에 발생하는 이벤트를 등록합니다.
		tData.events.register("onError", tData, onError);//데이터 로드가 실패했을 떄 발생하는 이벤트를 등록합니다.
		
		//1~5위 출력
		var storehtml ="";
		storehtml+=	'<div class="container">';
		storehtml+=		'<table class="table table-responsive-lg table-striped table-hover text-center">';
		storehtml+=			'<thead>';
		storehtml+=				'<tr>';
		storehtml+=					'<th scope="col" id="ranking">순위</th>';
		storehtml+=					'<th scope="col">매장 이름</th>';
		storehtml+=					'<th scope="col">매장 주소</th>';
		storehtml+=					'<th scope="col">가는 길</th>';
		storehtml+=				'</tr>';
		storehtml+=			'</thead>';	
		storehtml+=			'<tbody>';

		for(var i=0;i<5;i++){
			storehtml+=			'<tr>';
			storehtml+=				'<td>';
			storehtml+=					(i+1)+" 순위 ";
			storehtml+=				'</td>';
			storehtml+=				'<td>';
			storehtml+=					positions[i].name;
			storehtml+=				'</td>';
			storehtml+=				'<td>';
			storehtml+=					positions[i].address;
			storehtml+=				'</td>';
			
			storehtml+=				'<td>';
			storehtml+=					'<button class="btn btn-warning" onclick="initTmap('+i+')")>';
			storehtml+=						'찾기';
			storehtml+=					'</button>';
			storehtml+=				'</td>';
			storehtml+=			'</tr>';
		}
		
		storehtml+=			'</tbody>';
		storehtml+=		'</table>';
		storehtml+=	'</div>';
		
		document.getElementById("nearestStore").innerHTML = storehtml;
	}
}

//데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트 함수 입니다. 
function onComplete(){
	console.log(this.responseXML); //xml로 데이터를 받은 정보들을 콘솔창에서 확인할 수 있습니다.
	var kmlForm = new Tmap.Format.KML({extractStyles:true}).read(this.responseXML);
	var vectorLayer = new Tmap.Layer.Vector("vectorLayerID");
	vectorLayer.addFeatures(kmlForm);
	if(map.layers[1]){
		map.removeLayer(map.layers[1]);
	}
	//map.removeLayer(map.layers[1]);
	map.addLayer(vectorLayer);
	//경로 그리기 후 해당영역으로 줌  
	map.zoomToExtent(vectorLayer.getDataExtent());
   }
//데이터 로드중 발생하는 이벤트 함수입니다.
function onProgress(){
	//alert("onComplete");
}
//데이터 로드시 에러가 발생시 발생하는 이벤트 함수입니다.
function onError(){
	alert("onError");
}
// 맵 생성 실행
initTmap(0);
</script>
