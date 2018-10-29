<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="store_setting.jsp"%>

<jsp:include page="store_topNav.jsp" flush="false"/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a71e70cec1bc28094794f6172871d86&libraries=services"></script>
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=b217e571-641d-4a09-a856-897209fc048c"></script>
<link rel="stylesheet" type="text/css" href="${project}form.css">
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">

<c:if test="${result eq 0}">
<form class="form_contact">
	<h3>${msg_noorder}</h3>
</form>
	
</c:if>

<c:if test="${result ne 0}">

<c:forEach var="order" items="${orders}">
	<input name="cus_address" type="hidden" value="${order.cus_address}">
	<%-- <input name="cus_tel" type="hidden" value="${order.cus_tel}"> --%>
</c:forEach>
<div id="map" style="width:100%;height:100%;margin:5px;"></div>	
</c:if>

<script>
	var cus_address_tags = document.getElementsByName("cus_address");
	var cus_address_values = [];

	var latSum=0;
	var lngSum=0;

	for( var i=0; i<cus_address_tags.length; i++ ) {
		cus_address_values.push(cus_address_tags[i].value);
	}

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level :7,
    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	var address_num=cus_address_values.length;
	var n=0;
/* 	
  	var clusterer = new daum.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 5 // 클러스터 할 최소 지도 레벨 
    });
  	 */
	//마커를 추가합니다.
	var addMarker = function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
			console.log(result);
			
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	        
	        latSum+=parseFloat(result[0].y);
	        lngSum+=parseFloat(result[0].x);
	        
			var address=result[0].road_address.address_name;
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords,
	            title:address
	        });
	       // markers.push(marker);
	        
         // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+address+'</div>',
	            removable : true

	        });
	        infowindow.open(map, marker); 
	        
			n++;
			//map.setCenter(coords)

    		if(n==address_num){
    			var latCenter=latSum/n;
    			var lngCenter=lngSum/n;
    			
    			map.setCenter(new daum.maps.LatLng(latCenter,lngCenter));
	        	// clusterer.addMarkers(markers); 	
	        }   
	    } 
	};    

	for( var i=0; i<address_num; i++ ) {
		geocoder.addressSearch( cus_address_values[i], addMarker );
	}

</script>



