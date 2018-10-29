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