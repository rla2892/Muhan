<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>
<script>
	function move(){
		opener.document.location.href="cus_login_form.do" //자식창 닫고 부모창 이동
		self.close();
		
	}
</script>

<center>


	<br><br>
	<h5>아이디 찾기 이메일을 확인하세요.</h5>
	
		<div class="container">
			<form method="post" name="authenform" onSubmit="return check()">
				<input type="button" value="확인" onclick="move()">
				
			</form>
		</div>

</center>