<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp"%>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		erroralert('오류 발생: 잠시 후 다시 시도해 주세요.');
		window.location.reload(false);
	</script>
</c:if>

<c:if test="${result eq 1}">
	<script type="text/javascript">
		alert('리뷰가 삭제되었습니다.');
		window.history.go(-2);
	</script>
</c:if>