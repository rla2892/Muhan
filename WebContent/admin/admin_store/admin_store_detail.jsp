<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>
<script src="${project}script.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_store.jsp" %>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<table class="table table-hover">
	<tr>
		<th>ID</th>
		<td>${store_member_dto.store_id}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${store_member_dto.store_pw}</td>
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
		<td>20대:${count_ages2}%&nbsp;&nbsp;30대:${count_ages3}%&nbsp;&nbsp;40대:${count_ages4}%&nbsp;&nbsp;50대:${count_ages5}%&nbsp;&nbsp;60대:${count_ages6}%</td>
	</tr>
	<tr>
		<th>소속 집단</th>
		<td>${sumsum}</td>
	</tr>
	<tr>
		<th>지도</th>
		<td><div id="map" style="width:500px;height:400px;"></div></td>
	</tr>
</table>
<input class="btn btn-primary" type="button" value="수정" onclick="location='Admin_store_modify_form.do?store_id=${store_member_dto.store_id}'">
<input class="btn btn-primary" type="button" value="삭제" onclick="location='Admin_store_delete_pro.do?store_id=${store_member_dto.store_id}'">

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84ade146f4c88c0cf4ae826cc2f4eec8&libraries=services"></script>
<script>
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
