<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
//장바구니 아이템 결제 페이지로 이동
function orderCartItems() {
	sessionStorage.setItem('order',localStorage.getItem('order'));
}

//유효성검사
function cus_pay_check(){
	var store_id = cus_pay_form.store_id.value;
	
	if (store_id == "" || store_id == null) {
     alert("매장을 입력하지 않았습니다.");
     cus_pay_form.store_name.focus();
     return false;
 }
	
}
/////// store 검색

function searchStore() {
	if( ! document.getElementById("keyword").value ) {
		alert( "매장 검색을 위한 주소를 입력하세요" );
		return false;
	} else {
		var url = "Cus_pay_store_search.do?keyword="+document.getElementById("keyword").value;
		open( url, "confirm window", "toolbar=no, scrollbar=no, status=no, menubar=no, width=500px, height=300px" );
	}
}

function searchStoreByName() {
	if( ! document.getElementById("keywordName").value ) {
		alert( "매장 검색을 위한 매장명을 입력하세요" );
		return false;
	} else {
		var url = "Cus_pay_store_search_name.do?keyword="+document.getElementById("keywordName").value;
		open( url, "confirm window", "toolbar=no, scrollbar=no, status=no, menubar=no, width=500px, height=300px" );
	}
}

function searchStoreByLocation() {
	var url = "Cus_pay_store_search_location.do";
	open( url, "confirm window", "toolbar=no, scrollbar=no, status=no, menubar=no, width=1200px, height=500px" );
}
function searchStoreByAddress() {
	var url = "Cus_pay_store_search_address.do";
	open( url, "confirm window", "toolbar=no, scrollbar=no, status=no, menubar=no, width=1200px, height=500px" );
}



function setStore( id,name ) {
	opener.document.getElementById("store_name").value = name;
	opener.document.getElementById("store_id").value = id;
	self.close();
}

function setcancel() {
	opener.document.inputform.store_id.focus();
	opener.document.inputform.store_id.value = "";
	self.close();	
}


//우편번호
function sample4_execDaumPostcode() {
 new daum.Postcode({
     oncomplete: function(data) {
         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

         // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
         var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
         var extraRoadAddr = ''; // 도로명 조합형 주소 변수

         // 법정동명이 있을 경우 추가한다. (법정리는 제외)
         // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
         if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
             extraRoadAddr += data.bname;
         }
         // 건물명이 있고, 공동주택일 경우 추가한다.
         if(data.buildingName !== '' && data.apartment === 'Y'){
            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
         }
         // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
         if(extraRoadAddr !== ''){
             extraRoadAddr = ' (' + extraRoadAddr + ')';
         }
         // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
         if(fullRoadAddr !== ''){
             fullRoadAddr += extraRoadAddr;
         }

         document.getElementById('cus_address').value = data.jibunAddress;
         self.close();

     }
 }).open();
 
 
}

function setCurrentLocation() {
	//현재 위치 찾기
	function success(pos) {
	  var crd = pos.coords;

	  //console.log('Your current position is:');
	  //console.log('Latitude : ' + crd.latitude);
	  //console.log('Longitude: ' + crd.longitude);
	  //console.log('More or less ' + crd.accuracy + ' meters.');
	  
	  var geocoder = new daum.maps.services.Geocoder();

	  var coord = new daum.maps.LatLng(crd.latitude, crd.longitude);
	  var callback = function(result, status) {
	      if (status === daum.maps.services.Status.OK) {
	          document.getElementById('cus_address').value = result[0].address.address_name;
	      }
	  };

	  geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	  
	};

	function error(err) {
	  console.warn('ERROR(' + err.code + '): ' + err.message);
	};

	navigator.geolocation.getCurrentPosition(success, error);
		
	
}

//주문표 출력
function setMenus(storageLocation){
	var storageLoc=eval(storageLocation);
	var orderDetail = JSON.parse(storageLoc.getItem("order"));
	
	var total_pay = 0;
 
 var x = "";
 x+=	'<div class="container">';
 x+= 	'<table class="table table-sm table-hover text-center">';
 x+=			'<thead>'
 x+= 			'<tr>';
 x+=					'<th scope="col">';
 x+=						'제품명';
 x+=					'</th>';
 x+=					'<th scope="col">';
 x+=						'가격';
 x+=					'</th>';
 x+=					'<th scope="col">';
 x+=						'수량';
 x+=					'</th>';
 x+=					'<th scope="col">';
 x+=						'삭제';
 x+=					'</th>';
 x+= 			'</tr>';
 x+= 		'</thead>';
 x+= 		'<tbody>';    
 
 for(i in orderDetail){
 	x+= 		'<tr>';
 	x+=				'<td>';
 	x+=					orderDetail[i].menu_name;
 	x+=				'</td>';
 	x+=				'<td>';
 	x+=					orderDetail[i].menu_price;
 	x+=				'</td>';
 	x+=				'<td>';
 	x+=					orderDetail[i].order_qnt;
 	x+=				'</td>';
 	x+=				'<td>';
 	x+=					'<button type="button" class="btn btn-warning btn-sm deleteItemFromCart" onclick="deleteMenu('+i+')">삭제</button>';
 	x+=				'</td>';
 	x += 			'<input type="hidden" id="menu_id" name="menu_id" value="'+orderDetail[i].menu_id+'">';
 	x += 			'<input type="hidden" id="order_qnt" name="order_qnt" value="'+orderDetail[i].order_qnt+'">';
 	x += 			'<input type="hidden" id="ordered_menus" name="ordered_menus" value="'+orderDetail+'">';
 	
 	total_pay +=orderDetail[i].menu_price*orderDetail[i].order_qnt;
 	x+= 		'</tr>';
 }
 x+= 		'</tbody>';
 x+=		'</table>';
 x+=	'</div>';
 x+="전체 가격 : "+ total_pay+"원<br>";
 
 document.getElementById("ordered_menus").innerHTML = x;
} 

//주문표 출력
function setMenusForPay(storageLocation){
	var storageLoc=eval('sessionStorage');
	var orderDetail = JSON.parse(storageLoc.getItem("order"));
	var total_pay = 0;
 var x = "";
 x+=	'<div class="container">';
 x+= 	'<table class="table table-sm table-hover text-center">';
 x+=			'<thead>'
 x+= 			'<tr>';
 x+=					'<th scope="col">';
 x+=						'제품명';
 x+=					'</th>';
 x+=					'<th scope="col">';
 x+=						'가격';
 x+=					'</th>';
 x+=					'<th scope="col">';
 x+=						'수량';
 x+=					'</th>';
 x+=					'<th scope="col">';
 x+=						'삭제';
 x+=					'</th>';
 x+= 			'</tr>';
 x+= 		'</thead>';
 x+= 		'<tbody>';    

 for(i in orderDetail){
 	x+=			'<tr>';
 	x+=		 		'<td>';
 	x+=					orderDetail[i].menu_name;
 	x+=		 		'</td>';
 	x+=		 		'<td>';
 	x+=					orderDetail[i].menu_price;
 	x+=					'원';
 	x+=		 		'</td>';
 	x+=		 		'<td>';
 	x+=					orderDetail[i].order_qnt;
 	x+=					'개';
 	x+=		 		'</td>';
 	x+=		 	'</tr>';
		
 	x += '<input type="hidden" id="menu_id" name="menu_id" value="'+orderDetail[i].menu_id+'">';
 	x += '<input type="hidden" id="order_qnt" name="order_qnt" value="'+orderDetail[i].order_qnt+'">';
 	x += '<input type="hidden" id="ordered_menus" name="ordered_menus" value="'+orderDetail+'">';
 	
 	total_pay +=orderDetail[i].menu_price*orderDetail[i].order_qnt;
 }
 x+= '</table>';
 x+="전체 가격 : "+ total_pay+"원<br>";
 document.getElementById("ordered_menus").innerHTML = x;
} 

//주문표 삭제
function deleteMenu(index){
	
	var order = JSON.parse(localStorage.getItem("order"));
	
	if(order.length==1){
		localStorage.removeItem("order")
	}else{
		delete order[index];
		//order = JSON.stringify(order);
		var neworder =[];
		for(var i=0; i<order.length;i++){
			if(i==index){
				
			}else{
				neworder.push(order[i]);
			}
		}
		
		neworder = JSON.stringify(neworder);
		
		localStorage.setItem("order",neworder);
	}
	
	setMenus('localStorage');
	window.location.reload();
}
</script>