<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="./jquery-3.3.1.js"></script>
cus car view
<div id="map" style="width:500px;height:400px;"></div>
<div id="testdiv"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84ade146f4c88c0cf4ae826cc2f4eec8&libraries=services"></script>
<script>
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};
var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>

<script type="text/javascript">
//<!--


$(document).ready(

	function(){
		$.ajax(
			{
				type : 'POST',
				url : 'cus_car_location.do',
				dataType : 'xml',	//json은 jsp파일 안에 있어서 안 읽힘 그래서 대신 text로 준다
				success : function(data){
					//alert("success");
					var order_hisotry_car_dtos= data.getElementsByTagName('order_hisotry_car_dto');
					for(var i=0; i<order_hisotry_car_dtos.length; i++){
						var car_id = order_hisotry_car_dtos[i].children[0].textContent;
						var order_no = order_hisotry_car_dtos[i].children[1].textContent;
						var car_x = order_hisotry_car_dtos[i].children[2].textContent;
						var car_y = order_hisotry_car_dtos[i].children[3].textContent;
						var car_date = order_hisotry_car_dtos[i].children[4].textContent;
						
						var car_location = new daum.maps.LatLng(car_y,car_x);
						
						var car_marker = new daum.maps.Marker({	//내 위치 마커
						    position: car_location,
						    title:"차량",
						});
						
						// 마커가 지도 위에 표시되도록 설정합니다
						car_marker.setMap(map);
						
						//지도 중심 설정
						map.setCenter(car_location);
						
					}
					
				},
				error : function(e){
					alert("error");
				}
			}
		);
	}		
);
//-->
</script>

