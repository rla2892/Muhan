<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>
<%@include file="/cus/cus_head.jsp" %>
<%@include file="/cus/cus_topNav.jsp" %>

<script>
  function searchId(){
	  var data=searchForm.cus_email.value;
	  var url="cus_find_id.do?cus_email="+data;
	  window.open(url, "b", "width=600,height=300,scrollbars=yes,resizeable=no,left=150,top=150");
  }
  
  function searchPw(){

	  var data1=searchForm.search_id.value;
	  var data2=searchForm.search_email.value;
	  var url="cus_find_pw.do?search_id="+data1+"&search_email="+data2;
	  window.open(url, "b", "width=600,height=300,scrollbars=yes,resizeable=no,left=150,top=150");
  }
 
  
</script>

									<!-- ===============main=========================  -->
									
	<div class="container-fluid w-25 pt-5">
			<form class="pt-5" name="searchForm" method="get" role="form" onsubmit="searchValidate();" action="cus_login_form.do" >
				<div class="form-group mt-5 pt-5">
					<label for="cus_id">1.아이디 찾기</label>
					<input type="text" class="form-control" id="checkEmail" name="cus_email"  maxlength="50" placeholder="등록된 이메일을 입력하세요" >
				</div>
				<label>
						
						<!-- <input id="btn_submit1" type="button" value="아이디 찾기" onclick="search(1)"> -->
						<input class="btn btn-warning" id="btn_submit1" type="button" value="아이디 찾기" onclick="searchId();"> 
						<!-- <input id="btn_submit1" type="submit" value="아이디 찾기" >  -->
				</label>
				
				
				
				
	            <div class="form-group">
					<label for="cus_pw">2.비밀번호 찾기</label>
					
				</div>
				
				 <div class="form-group">
					
					 <input type="text" class="form-control" id="checkId" name="search_id"  maxlength="20" placeholder="아이디를  입력하세요" >
				</div>
				
	            <div class="form-group">
					
				 <input type="text" class="form-control" id="checkEmail1" name="search_email"   maxlength="50" placeholder="등록된 이메일을 입력하세요" >
				</div>
				
				<label>
						
					<input class="btn btn-warning" type="button" id="find_pw_btn"   value="비밀번호 찾기" onclick="searchPw()">
				</label>
				
			</form>
		</div>

<%@include file="/cus/cus_fixedFooter.jsp" %>
</body>
</html>
