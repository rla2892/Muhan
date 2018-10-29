<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>

<input type="text" id="authNum" value="${authNum}">

<center>
	<br><br>
	<h5>인증번호를 입력하세요</h5>
	
		<div class="container">
			<form method="post" name="authenform" onSubmit="return check()">
				<input type="text" name="authnum"><br><br>
				<input type="submit" class="btn btn=info" value="Submit">
			</form>
		</div>

</center>

<script>
	function check(){
		
		var form =document.authenform;
		var authNum=document.getElementById("authNum").value;
		//alert(authNum);
		//alert(form.authnum.value);
		
		if(!form.authnum.value){
			alert("인증번호를 입력하세요");
			return false;
		}
		if(form.authnum.value !=authNum){
			alert("틀린 인증번호 입니다. 인증번호를 다시 입력해주세여");
			return false;
		}
		if(form.authnum.value ==authNum){
			alert("인증완료");
			opener.document.joinform.confirm.value=1;
			self.close();
		}
	}
</script>




