<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<script src="cus/cus_member/cus_join_checking_script.js"></script>

<%@include file="/cus/cus_setting.jsp"%>

<%@include file="/cus/cus_script.jsp" %>
<%@include file="/cus/cus_head.jsp" %>
<%@include file="/cus/cus_topNav.jsp" %>
<%@include file="/cus/cus_member/cus_member_subNav.jsp" %>


<style>
	#a{
		margin-top:50px;
	}
</style>
</head>
<article class="container">
      
        <div class="mx-auto" style="width: 800px" id="a">
      

     <form class="form-horizontal" name="joinform" method="post" action="cus_modify_info_pro.do" onsubmit="return modifyCheck()">
     			
        		<h2 class="text-center" >내 정보수정</h2>
        		<br>
		        <div class="form-group row">
					<label for="nickname" class="col-sm-3 col-form-label">아이디</label>
					<div class="col-sm-8"><input class="form-control" type="text" value="${memberDto.cus_id}" readonly></div>
					
				</div>
		        
		         <div class="form-group row">
					<label for="nickname" class="col-sm-3 col-form-label">닉네임</label>
					<div class="col-sm-8"><input class="form-control" name="nickname" type="text" value="${memberDto.cus_nickname}"></div>
				</div>
		        
		        
		        <div class="form-group row">
		         	 <label class="col-sm-3 col-form-label">비밀번호</label>   <!--    password     -->
		         	 
		        		<div class="col-sm-8">
		         		 <input class="form-control" name="passwd" id="password" type="password" value="${memberDto.cus_pw }" placeholder="비밀번호">
		        		</div>
		        </div>
		        
		        
		     	<div class="form-group row">
		              <div class="col-sm-3"></div>
		             	<div class="col-sm-8">
		             		 <input class="form-control"  type="password"  id="repasswd" name="password1" value="${memberDto.cus_pw }" placeholder="비밀번호 재입력">
		             	</div>
		          </div>
		          
		          
		          
		        <div class="form-group row">
		           <label for="inputNickname" class="col-sm-3 col-form-label">배달지 주소</label>   <!--    Address     -->
		           
		          	<div class="col-sm-8">
		            	<input class="form-control col-sm-12" name="address" id="cus_address" type="text" placeholder="이름" value="${memberDto.cus_address}">
						<div>		            	
		            	<span style="float:right">
		            	<button class="btn btn-md btn-secondary" type="button" onclick="sample4_execDaumPostcode()" >주소검색</button>
		            	</span>
		            	</div>
		            </div>
		            
		        </div>
		         
		        
		          <div class="form-group row">
		          	<label  for="inputNickname" class="col-sm-3 col-form-label">상세주소</label>
		       			<div class="col-sm-8 text-right">
		         		 <input class="form-control" name="address2" id="cus_address2" type="text"  placeholder="상세주소를 입력하세요" value="${memberDto.cus_address2 }" >
		        		</div>
		         </div>
		        
		        		     
            	<div class="form-group row">
					<label class="col-sm-3 col-form-label">이메일
					</label>
					<div class="col-sm-8">
					 <input class="form-control" name="email" type="text" value="${memberDto.cus_email}" readonly>
					 </div>
				</div>
		        
		      		             
		        <div class="form-group row">                                        
		            <label class="col-sm-3 col-form-label" for="inputNumber">휴대폰번호</label>           <!--    Telephone     -->
		              <div class="col-sm-6">
		                <div class="input-group">
		                
							 <c:if test="${memberDto.cus_tel == null eq null or membeDto.cus_tel eq ''}">
								<input class="form-control" type="text" name="tel1" maxlength="3" style="width: 27px">
								- <input class="form-control" type="text" name="tel2" maxlength="4" style="width: 33px">
								- <input class="form-control" type="text" name="tel3" maxlength="4" style="width: 33px">
							</c:if>
							<c:if test="${memberDto.cus_tel ne null and memberDto.cus_tel ne ''}">
								<c:set var="t" value="${fn:split(memberDto.cus_tel, '-')}"/>
								<input class="form-control" type="text" name="tel1" maxlength="3" style="width: 27px"
									value="${t[0]}">
								- <input class="form-control" type="text" name="tel2" maxlength="4" style="width: 33px"
									value="${t[1]}">
								- <input class="form-control" type="text" name="tel3" maxlength="4" style="width: 33px"
									value="${t[2]}">
							</c:if> 
								
		                </div>
		              </div>
		        </div>
		        
		        <div class="form-group">
		          <div class="col-sm-12 text-center">
		            <button class="btn btn-md btn-secondary" type="submit">정보수정<i class="fa fa-check spaceLeft"></i></button>
		            <button class="btn btn-md btn-secondary" onClick='location="cus_user_main.do"' >취소<i class="fa fa-times spaceLeft"></i></button>
		          </div>
		        </div>
		        
        </form>
     
          <hr>
        </div>
        
      </article>
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

</html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function sample4_execDaumPostcode() {  //다음 주소 api
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
            //document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            //document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('cus_address').value = data.jibunAddress;
            self.close();

            
        }
    }).open();
}

</script>
<script>
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
function modifyCheck(){
	if(! joinform.nickname.value){
		alert("닉네임을  입력하세요")
		return false;
	}
	if((!joinform.passwd.value)||(!joinform.password1.value)){
		alert("비밀번호를 입력하세요")
		return false;
	}
	if((joinform.passwd.value) !=(joinform.password1.value)){
		alert("비밀번호가 다릅니다 다시 입력하세요")
		return false;
	}
	if(! joinform.address.value){
		alert("주소검색을 이용하세요")
		return false;
	}

	if(! joinform.address2.value){
		alert("상세주소를 입력하세요")
		return false;
	}
	if((! joinform.cus_email1.value)||(! joinform.cus_email3.value)){
		alert("이메일을 입력하고 인증하세요")
		return false;
	} 
	
	if( (!joinform.tel1.value)||(!joinform.tel1.value)||(!joinform.tel1.value)){
		alert("전화번호를 입력하세요")
		return false;
	}
	
}
</script>