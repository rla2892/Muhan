<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>
<script src="${project}script.js"></script>
<script src="./jquery-3.3.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_store.jsp" %>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="container">
	<form class="form-vertical" name="inputform" method="post" action="Admin_store_add_pro.do" onsubmit="return submitCheck();">
			<h3>사업자 정보를 입력하세요</h3>
			<div class="form-group row">
				<div class="col-xs-2">
					<label for="store_id">아이디</label>
				</div>
				<input class="btn btn-primary" type="button" value="중복확인" onclick="idCheck()">
				<div class="col-xs-2">
					<input class="form-control" type="text" name="store_id" id="store_id" maxlength="15">
				</div>
				<input type="hidden" name="confirm" value="0">
				<%-- 
				<input class="btn btn-primary" id="idck" type="button" value="중복확인2" onclick="idCheck2()">
				--%>
				<div id="divInputId"></div>
			</div>
			<div class="form-group row">
				<div class="col-xs-2">
					<label for="store_pw">비밀번호</label>
				</div>
				<div class="col-xs-2">
					<input class="form-control" type="password" name="store_pw" id="store_pw" maxlength="15">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-xs-2">
					<label for="store_repw">비밀번호 재입력</label>
				</div>
				<div class="col-xs-2">
					<input class="form-control" type="password" name="store_repw" id="store_repw" maxlength="15">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-xs-2">
					<label for="store_address">매장 주소</label>
				</div>
				<input class="btn btn-primary" type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기">
				<div class="col-xs-4">
					<input class="form-control" type="text" name="store_address" id="store_address" maxlength="20" style="width: 270px">
					<input type="hidden" name="store_lat" id="store_lat">
					<input type="hidden" name="store_lon" id="store_lon">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-xs-2">
					<label for="store_name">매장명</label>
				</div>
				<div class="col-xs-2">
					<input class="form-control" type="text" name="store_name" id="store_name" maxlength="20">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-xs-2">
					<label for="store_tel1">매장 전화번호</label>
				</div>
				<div class="col-xs-6">
					<div class="form-group row">
						<div class="col-xs-2">
							<input class="form-control" type="text" name="store_tel1" id="store_tel1" maxlength="3" >
						</div>
						<div class="col-xs-1">
							-
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="store_tel2" maxlength="4" >
						</div>
						<div class="col-xs-1">
							-
						</div>
						<div class="col-xs-2">
						<input class="form-control" type="text" name="store_tel3" maxlength="4" >
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-xs-2">
					<label for="owner_name">점주명</label>
				</div>
				<div class="col-xs-2">
					<input class="form-control" type="text" name="owner_name" id="owner_name" maxlength="20">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-xs-2">
					<label for="owner_tel1">점주 전화번호</label>
				</div>
				<div class="col-xs-6">
					<div class="form-group row">
						<div class="col-xs-2">
							<input class="form-control" type="text" name="owner_tel1" id="owner_tel1" maxlength="3">
						</div>
						<div class="col-xs-1">
							-
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="owner_tel2" maxlength="4">
						</div>
						<div class="col-xs-1">
							-
						</div>
						<div class="col-xs-2">
							<input class="form-control" type="text" name="owner_tel3" maxlength="4">
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-xs-2">
					<label for="owner_email1">점주 이메일</label>
				</div>
				<div class="col-xs-9">
					<div class="form-group row">
						<div class="col-xs-3">
							<input class="input" type="text" name="owner_email1" id="owner_email1" maxlength="15">
						</div>
						<div class="col-xs-1">
							@
						</div>
						<div class="col-xs-3">
							<input class="input" type="text" name="owner_email3" id="owner_email3" maxlength="15">
						</div>
						<div class="col-xs-3">
							<select class="form-control" name="owner_email2" id="owner_email2">
								<option value="0"> 직접 입력 </option>
								<option value="naver.com"> naver.com </option>
								<option value="daum.net"> daum.net </option>
								<option value="nate.com"> nate.com </option>
								<option value="gmail.com"> google.com </option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<input class="btn btn-primary" type="submit" value="등록">
				<input class="btn btn-primary" type="reset" value="취소">
			</div>
	</form>
</div>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>

<%--///////////////////////////////////////////////////////// --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84ade146f4c88c0cf4ae826cc2f4eec8&libraries=services"></script>
<script>
function loadDoc() {
	 jQuery.ajax({
         type:"GET",
         url:"/Muhan/xxx.do",
         dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
         success : function(data) {
      	   alert("성공");
      	   alert(data.a);
               // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
               // TODO
         },
         complete : function(data) {
               // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
               // TODO
         },
         error : function(xhr, status, error) {
               alert("에러발생");
         }
   });
}
</script>

<script>
$("#store_id").keyup(function(){
	 jQuery.ajax({
         type:"GET",
         url:"/Muhan/Admin_store_idcheck2.do?id="+$("#store_id").val(),
         dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
         success : function(data) {
			if(data.result>0){
      			$("#divInputId").html("중복된 아이디입니다.");
			}else{
				$("#divInputId").html("사용 가능한 아이디입니다.");
			}
         },
         complete : function(data) {
               // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
               // TODO
         },
         error : function(xhr, status, error) {
               alert("에러발생");
         }
   });
});

//이메일 입력방식 선택
$('#owner_email2').change(function(){
   $("#owner_email2 option:selected").each(function () {
		
		if($(this).val()== '0'){ //직접입력일 경우
			 $("#owner_email3").val('');                        //값 초기화
			 $("#owner_email3").attr("disabled",false); //활성화
		}else{ //직접입력이 아닐경우
			 $("#owner_email3").val($(this).text());      //선택값 입력
			 $("#owner_email3").attr("disabled",true); //비활성화
		}
   });
});

//좌표 넣기
$('#store_address').click(function(){
	//alert("굿");
	var store_address = $('#store_address').val();
	var geocoder = new daum.maps.services.Geocoder();

	var callback = function(result, status) {
	    if (status === daum.maps.services.Status.OK) {
	        var lon = result[0].x;
	        var lat = result[0].y;
	        $('#store_lon').val(lon);
	        $('#store_lat').val(lat);
	        //alert($('#store_lon').val());
	    }
	};

	geocoder.addressSearch(store_address, callback);
});

$('#store_address').change(function(){
	//alert("굿");
	var store_address = $('#store_address').val();
	var geocoder = new daum.maps.services.Geocoder();

	var callback = function(result, status) {
	    if (status === daum.maps.services.Status.OK) {
	        var lon = result[0].x;
	        var lat = result[0].y;
	        $('#store_lon').val(lon);
	        $('#store_lat').val(lat);
	        //alert($('#store_lon').val());
	    }
	};

	geocoder.addressSearch(store_address, callback);
});
</script>


