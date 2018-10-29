<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${result eq 1}">
	<result>
		<message><div style="color:red;">${id}는 사용할 수 없습니다.</div></message>
	</result>
</c:if>
<c:if test="${result eq 0}">
	<result>
		<message><div style="color:blue;">${id}는 사용할 수 있습니다.</div></message>
		<allow>1</allow>
	</result>
</c:if>
