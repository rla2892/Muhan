<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="random_generator.jsp"%>
<script>
for(var i=1; i<10000; i++){
	document.write(random_customer(i));	
	document.write("<br>");	
}
</script>