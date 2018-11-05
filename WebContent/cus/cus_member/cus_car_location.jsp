<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<order_hisotry_car_dtos>
<c:forEach var="order_hisotry_car_dto" items="${order_hisotry_car_dtos}">
<order_hisotry_car_dto>
				<car_id>${order_hisotry_car_dto.car_id}</car_id>
				<order_no>${order_hisotry_car_dto.order_no}</order_no>
				<car_x>${order_hisotry_car_dto.car_x}</car_x>
				<car_y>${order_hisotry_car_dto.car_y}</car_y>
				<car_date>${order_hisotry_car_dto.car_date}</car_date>
</order_hisotry_car_dto>
</c:forEach>
</order_hisotry_car_dtos>
