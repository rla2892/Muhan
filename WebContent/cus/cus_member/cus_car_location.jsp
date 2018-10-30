<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<c:forEach var="order_hisotry_car_dto" items="${order_hisotry_car_dtos}">
<br>
${order_hisotry_car_dto.car_id}
<br>
${order_hisotry_car_dto.order_no}
<br>
${order_hisotry_car_dto.car_x}
<br>
${order_hisotry_car_dto.car_y}
<br>
${order_hisotry_car_dto.car_date}
</c:forEach>
