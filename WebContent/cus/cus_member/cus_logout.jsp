<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	sessionStorage.removeItem('cus_id');
	sessionStorage.removeItem('msgCount');
	sessionStorage.removeItem('cartItems');
	sessionStorage.removeItem('order');
	window.location.replace('cus_user_main.do');
	clearInterval(ajaxIntervalSetter);
</script>