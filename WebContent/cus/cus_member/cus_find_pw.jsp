<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div>${member_db.getCus_pw()}</div>
<script>
function move(){
	opener.document.location.href="cus_login_form.do" //자식창 닫고 부모창 이동
	self.close();
	
}
</script>
<center>

	<br><br>
	<h5>비밀번호 찾기 이메일을 보냈습니다.</h5>
	
		<div class="container">
			<form method="post" name="authenform" onSubmit="return check()">
				
				<input  type="button" value="확인"  onclick="move()">
			</form>
		</div>

</center>
