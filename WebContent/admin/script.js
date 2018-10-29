
function erroralert( msg ) {
	alert( msg );
	history.back();
} 
////////////////////////////////////////////////////////////////////////////////////
//로그인
function loginfocus() {
	loginform.id.focus();
}

function logincheck() {
	if( ! loginform.id.value ) {
		alert( "아이디를 입력하세요" );
		loginform.id.focus();
		return false;
	} else if( ! loginform.passwd.value ) {
		alert( "비밀번호를 입력하세요" );
		loginform.passwd.focus();
		return false;
	}
}
////////////////////////////////////////////////////////////////////////////////////
////// review //유효성 검사
function noticeCheck(){
	var notice_subject = inputform.notice_subject.value;
	var notice_content = inputform.notice_content.value;
	
	if (notice_subject == "" || notice_subject == null) {
        alert("제목을 입력하지 않았습니다.");
        inputform.notice_subject.focus();
        return false;
    }
	
	if (notice_content == "" || notice_content == null) {
        alert("내용을 입력하지 않았습니다.");
        inputform.notice_content.focus();
        return false;
    }
}

//////////////////////////////////////////////////////////////////////////////////////
/////// store //중복확인
function idCheck() {
	if( ! inputform.store_id.value ) {
		alert( "아이디를 입력하지 않았습니다." );
	} else {
		var url = "Admin_store_idcheck.do?id=" + inputform.store_id.value;
		open( url, "confirm window", "toolbar=no, scrollbar=no, status=no, menubar=no, width=500px, height=300px" );
	}
}
function setid( id ) {
	opener.document.inputform.store_id.value = id;
	opener.document.inputform.store_pw.focus();
	opener.document.inputform.confirm.value = 1;
	self.close();
}
function setcancel() {
	opener.document.inputform.store_id.focus();
	opener.document.inputform.store_id.value = "";
	self.close();	
}
function confirmfocus() {
	confirmform.id.focus();	
}
function confirmcheck() {
	if( ! confirmform.id.value ) {
		alert( iderror );
		confirmform.id.focus();
		return false;
	}
}
// 유효성 검사
function submitCheck(){
	var store_id = inputform.store_id.value;
	var store_pw = inputform.store_pw.value;
	var store_repw = inputform.store_repw.value;
	var store_address = inputform.store_address.value;
	var store_name = inputform.store_name.value;
	var store_tel1 = inputform.store_tel1.value;
	var store_tel2 = inputform.store_tel2.value;
	var store_tel3 = inputform.store_tel3.value;
	var owner_name = inputform.owner_name.value;
	var owner_tel1 = inputform.owner_tel1.value;
	var owner_tel2 = inputform.owner_tel2.value;
	var owner_tel3 = inputform.owner_tel3.value;
	var owner_email1 = inputform.owner_email1.value;
	
	//아이디 입력
	if (store_id == "" || store_id == null) {
        alert("아이디를 입력하지 않았습니다.");
        inputform.store_id.focus();
        return false;
    }
	
	//중복확인
	if( inputform.confirm.value == 0 ) {
		alert( "중복확인을 해주세요." );
		inputform.store_id.focus();
		return false;
	}
	
	//비밀번호 입력
	if (store_pw == "" || store_pw == null) {
        alert("비밀번호를 입력하지 않았습니다.");
        inputform.store_pw.focus();
        return false;
    }
	//비밀번호 재입력
	if (store_repw == "" || store_repw == null) {
		alert("비밀번호를 다시 입력해주세요.");
		inputform.store_repw.focus();
		return false;
	}
	//비밀번호 동일 확인
	if (store_pw != store_repw) {
		alert("비밀번호가 다릅니다.");
		inputform.store_repw.focus();
		return false;
	}
	
	//주소 입력
	if (store_address == "" || store_address == null) {
		alert("주소를 입력하지 않았습니다.");
		inputform.store_address.focus();
		return false;
	}
	
	//매장명 입력
	if (store_name == "" || store_name == null) {
		alert("매장명을 입력하지 않았습니다.");
		inputform.store_name.focus();
		return false;
	}
	
	//전화번호1 입력
	if (store_tel1 == "" || store_tel1 == null) {
		alert("전화번호를 입력하지 않았습니다.");
		inputform.store_tel1.focus();
		return false;
	}
	//전화번호2 입력
	if (store_tel2 == "" || store_tel2 == null) {
		alert("전화번호를 입력하지 않았습니다.");
		inputform.store_tel2.focus();
		return false;
	}
	//전화번호3 입력
	if (store_tel3 == "" || store_tel3 == null) {
		alert("전화번호를 입력하지 않았습니다.");
		inputform.store_tel3.focus();
		return false;
	}
	
	//점주명 입력
	if (owner_name == "" || owner_name == null) {
		alert("점주명을 입력하지 않았습니다.");
		inputform.owner_name.focus();
		return false;
	}
	
	//점주 전화번호1 입력
	if (owner_tel1 == "" || owner_tel1 == null) {
		alert("전화번호를 입력하지 않았습니다.");
		inputform.owner_tel1.focus();
		return false;
	}
	//점주 전화번호2 입력
	if (owner_tel2 == "" || owner_tel2 == null) {
		alert("전화번호를 입력하지 않았습니다.");
		inputform.owner_tel2.focus();
		return false;
	}
	//점주 전화번호3 입력
	if (owner_tel3 == "" || owner_tel3 == null) {
		alert("전화번호를 입력하지 않았습니다.");
		inputform.owner_tel3.focus();
		return false;
	}
	
	//점주 이메일 입력
	if (owner_email1 == "" || owner_email1 == null) {
		alert("이메일을 입력하지 않았습니다.");
		inputform.owner_email1.focus();
		return false;
	}
}

//유효성 검사 (수정)
function submitModify(){
	var store_pw = inputform.store_pw.value;
	var store_repw = inputform.store_repw.value;
	var store_address = inputform.store_address.value;
	var store_name = inputform.store_name.value;
	var store_tel1 = inputform.store_tel1.value;
	var store_tel2 = inputform.store_tel2.value;
	var store_tel3 = inputform.store_tel3.value;
	var owner_name = inputform.owner_name.value;
	var owner_tel1 = inputform.owner_tel1.value;
	var owner_tel2 = inputform.owner_tel2.value;
	var owner_tel3 = inputform.owner_tel3.value;
	var owner_email1 = inputform.owner_email1.value;
	
	//비밀번호 입력
	if (store_pw == "" || store_pw == null) {
        alert("비밀번호를 입력하지 않았습니다.");
        inputform.store_pw.focus();
        return false;
    }
	//비밀번호 재입력
	if (store_repw == "" || store_repw == null) {
		alert("비밀번호를 다시 입력해주세요.");
		inputform.store_repw.focus();
		return false;
	}
	//비밀번호 동일 확인
	if (store_pw != store_repw) {
		alert("비밀번호가 다릅니다.");
		inputform.store_repw.focus();
		return false;
	}
	
	//주소 입력
	if (store_address == "" || store_address == null) {
		alert("주소를 입력하지 않았습니다.");
		inputform.store_address.focus();
		return false;
	}
	
	//매장명 입력
	if (store_name == "" || store_name == null) {
		alert("매장명을 입력하지 않았습니다.");
		inputform.store_name.focus();
		return false;
	}
	
	//전화번호1 입력
	if (store_tel1 == "" || store_tel1 == null) {
		alert("전화번호를 입력하지 않았습니다.");
		inputform.store_tel1.focus();
		return false;
	}
	//전화번호2 입력
	if (store_tel2 == "" || store_tel2 == null) {
		alert("전화번호를 입력하지 않았습니다.");
		inputform.store_tel2.focus();
		return false;
	}
	//전화번호3 입력
	if (store_tel3 == "" || store_tel3 == null) {
		alert("전화번호를 입력하지 않았습니다.");
		inputform.store_tel3.focus();
		return false;
	}
	
	//점주명 입력
	if (owner_name == "" || owner_name == null) {
		alert("점주명을 입력하지 않았습니다.");
		inputform.owner_name.focus();
		return false;
	}
	
	//점주 전화번호1 입력
	if (owner_tel1 == "" || owner_tel1 == null) {
		alert("전화번호를 입력하지 않았습니다.");
		inputform.owner_tel1.focus();
		return false;
	}
	//점주 전화번호2 입력
	if (owner_tel2 == "" || owner_tel2 == null) {
		alert("전화번호를 입력하지 않았습니다.");
		inputform.owner_tel2.focus();
		return false;
	}
	//점주 전화번호3 입력
	if (owner_tel3 == "" || owner_tel3 == null) {
		alert("전화번호를 입력하지 않았습니다.");
		inputform.owner_tel3.focus();
		return false;
	}
	
	//점주 이메일 입력
	if (owner_email1 == "" || owner_email1 == null) {
		alert("이메일을 입력하지 않았습니다.");
		inputform.owner_email1.focus();
		return false;
	}
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

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('store_address').value = data.jibunAddress;
            document.getElementById('store_address').click();
            self.close();

        }
    }).open();
    
}

