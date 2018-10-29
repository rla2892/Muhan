<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>
<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_store.jsp" %>

<div class="btn-group btn-group-justified">
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=0'">전국</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=1'">서울</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=2'">인천</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=3'">경기</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=4'">대전</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=5'">세종</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=6'">충청도</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=7'">강원도</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=8'">부산</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=9'">울산</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=14'">대구</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=10'">경상도</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=11'">광주</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=12'">전라</a>
  <a href="#" class="btn btn-primary" onclick="location='Admin_store_map.do?location1=13'">제주</a>
</div>

<input id="locationKeyword" type="hidden" value="${locationKeyword}">
<c:forEach var="store" items="${stores}">
	<input name="store_address" type="hidden" value="${store.store_address}">
</c:forEach>

<div id="map" style="width:100%;height:700px;"></div>

<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84ade146f4c88c0cf4ae826cc2f4eec8&libraries=services"></script>
<script>
var locationKeyword = document.getElementById("locationKeyword").value;
if(locationKeyword=="경상" ||locationKeyword=="전라"){
	locationKeyword +="도";
}
var store_address_tags = document.getElementsByName("store_address");	//주소 태그들 받기
var store_address_values = [];	//주소 배열 생성
for(var i=0; i<store_address_tags.length;i++){	
	store_address_values.push(store_address_tags[i].value);
}


var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(37.5, 127.1), // 지도의 중심좌표
    level: 12 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = './admin/admin_ui/reddot.png', // 마커이미지의 주소입니다    
imageSize = new daum.maps.Size(5, 5), // 마커이미지의 크기입니다
imageOption = {offset: new daum.maps.Point(0, 0)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);

var geocoder = new daum.maps.services.Geocoder();
var addMarker = function(result, status) {
    if (status === daum.maps.services.Status.OK) {
        console.log(result);
        var marker = new daum.maps.Marker({
            map: map,
            position: new daum.maps.LatLng(result[0].y, result[0].x),
            image: markerImage
        });
    }
};

var change_map_center = function(result,status){
	if (status === daum.maps.services.Status.OK) {
		map.setCenter(new daum.maps.LatLng(result[0].y, result[0].x));
	}
}

geocoder.addressSearch(locationKeyword,change_map_center);
for(var i=0; i<store_address_values.length;i++){
	geocoder.addressSearch(store_address_values[i], addMarker);
}

console.log(locationKeyword);
</script>    