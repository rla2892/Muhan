<%@page import="db.order_history.Order_history_DataBean_for_store2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>
<script src="/Muhan/jquery-3.3.1.js"></script>
<div class="container" >
<form class="form_contact">
<h3>선택하신 주문의 상세정보</h3>
<br>
<label>[ 주문 메뉴명 및 수량 ]</label>
<c:forEach var="orderdetail" items="${orderdetails}">
	<label>
		${orderdetail.menu_name}&nbsp; ${orderdetail.order_qnt}개&nbsp;
	</label>
</c:forEach>
<br>
<label>[ 배달 주소 ]</label>
	<label id="address">
	${cus_address}&nbsp;${cus_address2}&nbsp;
	</label>
</form>
</div>
<br>
<br>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a71e70cec1bc28094794f6172871d86&libraries=services"></script>
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=b217e571-641d-4a09-a856-897209fc048c"></script>
<div id="map_div"></div>

<script>
//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
var cuslon;
var cuslat;

var list = new Array();
'<c:forEach var="eachlonlat" items="${storeLonLat}">'
	list.push("${eachlonlat.store_lon}");
	list.push("${eachlonlat.store_lat}");
'</c:forEach>'
var storelon = list[0];
var storelat = list[1];

	//주소로 좌표를 검색합니다
	geocoder.addressSearch( document.getElementById('address').innerText, function(result, status) {
	
		// 정상적으로 검색이 완료됐으면 
		 if (status === daum.maps.services.Status.OK) {
			 cuslon = result[0].x;
			 cuslat = result[0].y;
		    
		    var map, routeSearchLayer, styleMap, point_vector_layer;
		  //페이지가 로딩이 된 후 호출하는 함수입니다.
		  function initTmap(){
		  	//map 생성
		  	//Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.

		  	map = new Tmap.Map({div:'map_div', width:'100%', height:'400px'});
		  	map.setCenter(new Tmap.LonLat("126.9850380932383", "37.566567545861645").transform("EPSG:4326", "EPSG:3857"), 15); //설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점으로 설정합니다.
		  	var tData = new Tmap.TData(); //REST API 에서 제공되는 경로, 교통정보, POI 데이터를 쉽게 처리할 수 있는 클래스입니다.
		  	
		  	var s_lonLat = new Tmap.LonLat(storelon, storelat); //김포 시작 좌표입니다.
		  	var e_lonLat = new Tmap.LonLat(cuslon, cuslat); 
		  	
		  	var optionObj = {
		  		reqCoordType:"WGS84GEO", //요청 좌표계 옵셥 설정입니다.
		  		resCoordType:"EPSG3857", //응답 좌표계 옵션 설정입니다.
		  		trafficInfo:"Y" //교통정보 표출 옵션 설정입니다.
		           }
		  	
		  	tData.getRoutePlan(s_lonLat, e_lonLat, optionObj);//경로 탐색 데이터를 콜백 함수를 통해 XML로 리턴합니다.
		  	
		  	tData.events.register("onComplete", tData, onComplete);//데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트를 등록합니다.
		  	tData.events.register("onProgress", tData, onProgress);//데이터 로드중에 발생하는 이벤트를 등록합니다.
		  	tData.events.register("onError", tData, onError);//데이터 로드가 실패했을 떄 발생하는 이벤트를 등록합니다.
		  }
		  //데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트 함수 입니다. 
		  function onComplete(){		  
		  	//교통정보 표출시 생성되는 LineColor 입니다.      
		  	var trafficColors = {
		  		extractStyles:true,
		  		
		  		// 사용자가 임의로 색상을 설정할 수 있습니다.
		  		// 교통정보 옵션 - 라인색상
		  		trafficDefaultColor:"#000000", //교통 정보가 없을 때
		  		trafficType1Color:"#009900", //원할
		  		trafficType2Color:"#8E8111", //지체
		  		trafficType3Color:"#FF0000", //정체
		  		
		  	};    
		  	var kmlForm = new Tmap.Format.KML(trafficColors).readTraffic(this.responseXML);
		  	var vectorLayer = new Tmap.Layer.Vector("vectorLayerID");
		  	vectorLayer.addFeatures(kmlForm);    
		  	
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
		  initTmap();
		} 
	});
</script>