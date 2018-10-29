/*------------Member Join Functions------------*/
function cancel() {
	self.close();
}

function toMain() {
	window.location.href='cus_user_main.do';
}


function joincheck() {
	if (confirm("회원가입을 하시겠습니까?")) {
	if (idck == 0) {
		alert('아이디 중복체크를 해주세요');
		return false;
	}else if (joinform.confirm.value == 0){
		alert('이메일 인증을해주세요');
		return false;
	}else if (passwdck == 0){
		alert('비밀번호를 같도록 입력하세요');
		return false;
	} 
	}
}

/* emailAuthentic 체크 */
function emailAuthentic(){
	var email = joinform.cus_email1.value+"@" + joinform.cus_email3.value;
	alert(email);
	var url="cus_email_verification.do?email="+email;
	window.open(url, "b", "width=600,height=300,scrollbars=yes,resizeable=no,left=150,top=150") 
}
		
