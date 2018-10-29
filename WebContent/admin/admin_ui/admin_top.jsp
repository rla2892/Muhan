<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Admin_main.do">Home</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="Admin_customer_management.do">고객관리</a></li>
      <li><a href="Admin_store_management.do">매장관리</a></li>
      <li><a href="Admin_review_management.do">리뷰관리</a></li>
      <li><a href="Admin_menu_management.do">메뉴관리</a></li>
      <li><a href="Admin_order_management.do">매출관리</a></li>
      <%-- 
      <li><a href="Admin_order_management.do">주문관리</a></li>
      --%>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Admin_logout.do"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
  </div>
</nav>

<%-- 
<input class="btn btn-info" type="button" value="홈" onclick="location='Admin_main.do'">
<input class="btn btn-info" type="button" value="로그아웃" onclick="location='Admin_logout.do'">

<input class="btn btn-info" type="button" value="고객관리" onclick="location='Admin_customer_management.do'">
<input class="btn btn-info" type="button" value="매장관리" onclick="location='Admin_store_management.do'">
<input class="btn btn-info" type="button" value="리뷰관리" onclick="location='Admin_review_management.do'">
<input class="btn btn-info" type="button" value="메뉴관리" onclick="location='Admin_menu_management.do'">
<input class="btn btn-info" type="button" value="주문관리" onclick="location='Admin_order_management.do'">
--%>