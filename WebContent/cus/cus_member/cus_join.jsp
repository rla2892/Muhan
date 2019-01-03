<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_head.jsp"%>
<%@include file="/cus/cus_topNav.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="./jquery-3.3.1.js"></script>
<script src="/Muhan/cus/cus_member/cus_join_checking_script.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
</head>
	<body class="registration">
	
		<div class="container" style="width: 600px">
		<div class="text-center">
		<br><br>
			<h2>회원가입</h2>
			<br>
		</div>
		
		<!-- Container -->
	
			<!-- Join Form --> 
			<form class="form-horizontal" name="joinform" method="post" role="form" action="cus_join_pro.do" onsubmit="return joincheck()">
			<div class="form-group row">
				<label for="inputID" class="col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-8">
					<input type="text" name="id" maxlength="20" class="form-control"
						id="id_val" placeholder="ID" maxlength="20" required autofocus onkeyup="IdCheck()">
						<h6 style="color: red;" id="IdCheckMessagegg"></h6>
				</div>

			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="userPassword1" name="passwd" maxlength="20" placeholder="비밀번호" maxlength="30" required
						onkeyup="passwordCheckFunction()">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="userPassword2"
						placeholder="비밀번호 재입력" name="repasswd" maxlength="20" required 
							onkeyup="passwordCheckFunction()">
				<h6 style="color: red;" id="passwordCheckMessage"></h6>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputNickname" class="col-sm-2 col-form-label">닉네임</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="cus_nickname" id="cus_nickname" placeholder="Nickname" required>
					<h6 style="color: red;" id="NameCheckMessage"></h6>
				</div>
			</div>
			
			<fieldset class="form-group">
				<div class="row">
					<label class="col-form-label col-sm-2 pt-0">성별</label>
					<div class="col-sm-10">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender"
								id="gridRadios1" value="1" checked> <label
								class="form-check-label" for="gridRadios1">
								남자</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender"
								id="gridRadios2" value="2"> <label
								class="form-check-label" for="gridRadios2">
								여자 </label>
						</div>
					</div>
				</div>
			</fieldset>
			
			<div class="form-group row">
				<label for="inputNickname" class="col-sm-2 col-form-label">생일</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="testDatepicker" placeholder="생일" name="Birth" id="Birth" maxlength="10" autofocus autocomplete="off"/>
				</div>
			</div>
			
					<div class="form-group row">
								<label for="inputNickname" class="col-sm-2 col-form-label">주소</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="cus_address" id="cus_address" maxlength="20" placeholder="주소를 다시 입력해 주세요." required>
							</div>
							<div class="col-sm-2">
							<button class="btn btn-md btn-secondary" type="button" onclick="sample4_execDaumPostcode()">주소찾기</button>
							</div>
					</div>
						
					<div class="form-group row">
								<label for="inputNickname" class="col-sm-2 col-form-label">상세주소</label>							
							<div class="col-sm-8">
								<input type="text" class="form-control" name="cus_address2" id="cus_address2" maxlength="20" placeholder="주소를 다시 입력해 주세요." required>
							</div>
					</div>
					
					<div class="form-group row">						
						<label for="inputNickname" class="col-sm-2 col-form-label">이메일</label>&nbsp;
								&nbsp;<input type="text" style="width:110px;" class="form-control" name="cus_email1" id="cus_email1" maxlength="20" placeholder="이메일" required>
								@
								<input type="text" style="width:130px;" class="form-control" name="cus_email3" id="cus_email3" maxlength="20" placeholder="이메일" required>
								<select class="form-control" style="width:130px;" name="cus_email2" id="cus_email2">
									<option value="0"> 직접 입력 </option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
								</select>
							<div class="col-sm-2">
 								<button type="button" class="btn btn-md btn-secondary" onclick="emailAuthentic()">이메일인증</button>
								<input type="hidden" name="confirm" value="0">
							</div>
							
						</div>
						
						<div class="form-group row">
								<label for="inputNickname" class="col-sm-2 col-form-label">전화번호</label>&nbsp;
							
								&nbsp;<input type="text" style="width:100px;" class="form-control" name="cus_tel1" id="cus_tel1" maxlength="3" placeholder="번호" required>
								-
								<input type="text" style="width:130px;" class="form-control" name="cus_tel2" id="cus_tel2" maxlength="4" placeholder="번호" required>
								-
								<input type="text" style="width:130px;" class="form-control" name="cus_tel3" id="cus_tel3" maxlength="4" placeholder="번호" required>
						
						</div>
					
				<div class="col-lg-12 text-center mt-1 mb-1">
					<button type="submit" class="btn btn-md btn-secondary">
					회원 가입
					</button>
					<button type="button" class="btn btn-md btn-secondary" onclick="toMain()">
					가입 취소
					</button>
				</div>
				<br><br><br><br><br><br><br>
		</form>
		</div>
			<!-- 약관 -->
			
			<!-- Fixed Footer: 붙이는 위치가 Scrollable Footer와는 다릅니다! Fixed Footer는 중단 Container 안에 넣어주셔야 합니다. --> 
		<style>
		#footerJumbotron {
	position: relative !important;
	bottom: 0 !important;
}

#bottomContainer {
	position: relative !important;
	bottom: 0 !important;
}

.footer {
	position: fixed;
	height: 7rem;
}

.footer-info {
	margin-left: 2.8125rem;
	margin-right: 2.8125rem;
}

.bottomLink {
	font-size: 0.75rem !important;
}

#bottomInfo {
	font-size: 0.75rem !important;
}
		</style>
			<div class="footer bg-dark fixed-bottom pt-0">
	<nav class="navbar navbar-expand-lg bg-dark justify-content-center">
		<!-- Bottom Logo -->
		<a class="navbar-brand" href="cus_user_main.do">
			<img src="/Muhan/cus/cus_images/logo_white.png" class="mainWhiteLogo" alt="Lotteria White Main Logo">
		</a>
		
		<!-- Links -->
		<ul class="navbar-nav bottomLink">
			<li class="nav-item">
				<a class="nav-link ml-5 mr-5 text-white" href="https://mobilehome.lotteria.com/customer/agreement">이용약관</a>
			</li>
			<li class="nav-item">
				<a class="nav-link ml-5 mr-5 text-danger" href="https://mobilehome.lotteria.com/customer/policy">개인정보처리방침</a>
			</li>
			<li class="nav-item">
				<a class="nav-link ml-5 mr-5 text-white" href="https://www.instagram.com/lotteria_kr/">소셜미디어</a>
			</li>
		</ul>
	</nav>
	<div class="container text-white pb-2 mb-0" id="bottomInfo">
		<span class="footer-info" style="margin-left:160px">&emsp;&emsp;엔코아 플레이데이터 빅데이터/딥러닝 2기</span>
		<span class="footer-info">웹프로젝트</span>
		<span class="footer-info">무한(김)상사</span>
		<span class="footer-info">팀장: &emsp;김상진</span>
	</div>
	<div class="container pb-2">
		<p class="text-white" style="margin-left:500px">Copyright &copy; 2018</p>
	</div>
</div>

	</body>
</html>

<script>
$(function() {
    $( "#testDatepicker").datepicker({
    });
});
//이메일 입력방식 선택
$('#cus_email2').change(function(){
   $("#cus_email2 option:selected").each(function () {
		
		if($(this).val()== '0'){ //직접입력일 경우
			 $("#cus_email3").val('');                        //값 초기화
			 $("#cus_email3").attr("disabled",false); //활성화
		}else{ //직접입력이 아닐경우
			 $("#cus_email3").val($(this).text());      //선택값 입력
			 $("#cus_email3").attr("disabled",true); //비활성화
		}
   });
});
</script>

<script>
var idck = 0;
function IdCheck() {
	var id = $("#id_val").val();
	if (id) {
		$.ajax({
			async : true,
			type : 'POST',
			data : id,
			url : "idCheck.do",
			dataType : "json",
			success : function(data) {
				if (data.countId > 0) {
					$('#IdCheckMessagegg').html(
							"아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					idck = 1;
				} else {
					$('#IdCheckMessagegg').html("사용가능한 아이디입니다.");
					idck = 2;
				}
			},
			error : function(error) {
				alert("error : " + error);
			}
		});
	}
}
/* $(document).ready(function(){
	IdCheck()	
});
 */
var passwdck = 0;
function passwordCheckFunction() {
	var userPassword1 = $('#userPassword1').val();
	var userPassword2 = $('#userPassword2').val();

	if (userPassword1 != userPassword2) {
		$('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다");
	} else {
		$('#passwordCheckMessage').html("비밀번호가 일치합니다");
		passwdck = 1;
	}
}
</script>