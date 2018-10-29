<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp" %>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		erroralert('입력하신 아이디가 없습니다. 아이디를 다시 확인해 주세요.');
	</script>
</c:if>
<c:if test="${result eq -1}">
	<script type="text/javascript">
		erroralert('입력하신 패스워드가 틀렸습니다. 패스워드를 다시 확인해 주세요.');
	</script>
</c:if>
<c:if test="${result eq 1}">
	<c:set var="cus_id" value="${cus_id}" scope="session"/>
	<c:if test="${black eq 1}">
		<!-- Black member일 경우 보이지 않도록 sessionScope에 black 값을 1로 올린다 -->
		<c:set var="black" value="1" scope="session"/>
	</c:if>
	
	<script type="text/javascript">
		var cus_id='${cus_id}';
		var rememberMe='${rememberMe}';
		sessionStorage.setItem('msgCount',0);
		
		if(rememberMe=='checked') {
			rememberMyId(cus_id);
		} else {
			if(localStorage.getItem('cus_id')) {
				forgetMyId(cus_id);
				storeId(cus_id);
			} else {
				storeId(cus_id);
			}
		}
		
		var identifier='${identifier}';

		if(identifier=='1') {
			window.location.href='cus_pay.do';	
		} else if(identifier=='2') {
			window.location.href='cus_review.do';
		} else if(identifier=='3') {
			if('${sessionScope.black}'=='1') {
				alert('회원님께서는 리뷰 게시판 이용 위반으로 더 이상 리뷰를 작성하실 수 없습니다.');
				window.location.href='cus_review.do';
			} else {
				window.location.href='cus_review.do';
			}
		} else if(identifier=='4') {
			window.location.href='cus_my_review_list.do';
		} else {
			window.location.replace('cus_user_main.do');
		}
	</script>
</c:if>