
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br>
<br>
<br>
<br>
<br>
<div class="container" style="position: relative;
  display: inline-flex;
  align-self: center;
  padding: 60px 40px;
  background: #F7FFF7;
  border-radius: 4px;
  box-shadow: 0 26px 60px rgba(0,0,0,.1);">
<img src="/Muhan/store/approve.png">
<br>
<br>	
${sessionScope.store_name}${msg_welcome}
<br>
<br>
<input class="btn btn-primary" type="button" value="${btn_logout}" onclick="location='Store_logout.do'">
	
</div>