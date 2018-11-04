/* 점주 javascript */

var iderror = "아이디를 입력하세요";
var passwderror = "비밀번호를 입력하세요";

var loginiderror = "입력하신 아이디가 없습니다\n 아이디를 다시 확인하세요.";
var loginpasswderror = "입력하신 비밀번호가 다릅니다.\n 비밀번호를 다시 확인하세요."
var repasswderror = "비밀번호가 다릅니다";
var noemailerror = "이메일은 필수 입력사항입니다";
var emailerror= "이메일 형식에 맞지 않습니다";
var notelerror = "전화번호는 필수 입력사항입니다";
var nonameerror = "점주명을 입력해주세요";
var telerror= "전화번호 형식에 맞지 않습니다";
var loginfirsterror = "로그인 후 이용 가능 한 서비스입니다.";
var modifyerror = "수정에 실패했습니다. \n잠시후 다시 시도하세요";
var completeerror = "상태변경에 실패했습니다. \n잠시후 다시 시도하세요";


function erroralert( msg ) {
	alert( msg );
	//이전페이지로 돌려줌.
	history.back();
}

function logincheck() {
	if( ! storeloginform.store_id.value ) {
		alert( iderror );
		storeloginform.store_id.focus();
		return false;
	} else if ( ! storeloginform.store_pw.value ) {
		alert( passwderror );
		storeloginform.store_pw.focus();
		return false;
	}
}

function passwdcheck() {
	if( ! storepasswdform.store_pw.value ){
		alert( passwderror );
		storepasswdform.store_pw.focus();
		return false;
	}
}

function modifycheck() {
	if( ! storemodifyform.store_pw.value ) {
		alert( passwderror );
		storemodifyform.store_pw.focus();
		return false;
	} else if ( ! storemodifyform.store_repasswd.value) {
		alert( passwderror );
		storemodifyform.store_repasswd.focus();		
		return false;
	} else if ( storemodifyform.store_pw.value != storemodifyform.store_repasswd.value ) {
		alert( repasswderror );
		storemodifyform.store_pw.focus();
		return false;
	} else if ( ! storemodifyform.owner_email.value ){
		alert( noemailerror );
		storemodifyform.owner_email.focus();
		return false;
	} else if ( storemodifyform.owner_email.value.indexOf("@") == -1 ){
		alert( emailerror );
		storemodifyform.owner_email.focus();
		return false;
	} else if ( ! storemodifyform.owner_name.value ) {
		alert( nonameerror );
		storemodifyform.owner_name.focus();
		return false;		
	} else if ( ! storemodifyform.owner_tel.value ){
		alert( notelerror );
		storemodifyform.owner_tel.focus();
		return false;
	} else if ( storemodifyform.owner_tel.value.indexOf("-") == -1 ){
		alert( telerror );
		storemodifyform.owner_tel.focus();
		return false;
	}
}

function loginfirst() {
	alert( loginfirsterror );
	return false;
}

//memberConfirmId.do?id=zzz
function checkorderdetails( order_no, cus_address, cus_address2 ) {
	var url = "/Muhan/Store_order_check_detail.do?order_no="+order_no+"&cus_address="+cus_address+"&cus_address2="+cus_address2;
	open( url, "confirm window", "toolbar=no, scrollbars=yes, status=no, menubar=no width=650px, height=800px" );
}

function updateGraph(){
	var year=$("select[name=yearGroup]").val();
	var month=$("select[name=monthGroup]").val();
	var menu_category=$("select[name=itemGroup]").val();
	
	$('#chartArea').empty();
	var page="Store_order_graph_update.do?menu_category="+menu_category+"&year="+year+"&month="+month;
	$('#chartArea').load(page);	
}

function updateGraphAll(){
	var year=$("select[name=yearGroup]").val();
	var month=$("select[name=monthGroup]").val();
	var day=$("select[name=dayGroup]").val();
	var menu_category=$("select[name=itemGroup]").val();
	
	$('#chartArea').empty();
	var page="Store_order_graph_cat_now_Update.do?menu_category="+menu_category+"&year="+year+"&month="+month+"&day="+day;
	$('#chartArea').load(page);	
}
function setCategory(menu_category){
	var category;
	switch(menu_category){
		case 0:
			return "";break;
		case 1:
			return "세트 ";break;
		case 2:
			return "버거 ";break;
		case 3:
			return "사이드와 음료 ";break;
		case 4:
			return "신제품-세트 ";break;
		case 5:
			return "신제품-버거 ";break;	
	}
}
/*function changeCategory(){
	var categorySelect = document.getElementById("category");
    
    // select element에서 선택된 option의 value가 저장된다.
    var category = categorySelect.options[categorySelect.selectedIndex].value;
 
}*/
function setHeight(itemNum){
	if(itemNum<3){
		return 200*itemNum;
	}else{
		return 100*itemNum;
	}
}
/*
//베낀것수정해야 함
function updateTodayCat(category){
	 $.ajax({
         url : 'ajaxtest.do',
         cache : false,
         data: category,//?
         contentType: "application/json; charset=UTF-8", 
			success : function (data) {
				if(data == '') {
					var myHTMLStr = '${msg_noorder}';
					$('#result').html(myHTMLStr);
					
				} else if ( data != ''){
					
					jsonorders = JSON.parse(data);
					var myHTMLStr=	 '<table class="table table-striped"><tr> <th>주문번호</th> <th>주문시간</th>'
							+ '<th>고객ID</th> <th>고객주소</th> <th>고객 상세주소</th>'
							+ '<th>고객 전화번호</th> <th>고객 이메일</th> <th>주문상태</th>'
					 		+ '<th colspan="3" class="text-center">확인</th> </tr>'
					 for(var i in jsonorders) {
		
					 }
				}        
			}
     });    
}*/
