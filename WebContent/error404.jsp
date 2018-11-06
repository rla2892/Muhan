<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<%
    response.setStatus(200);
%>
<form>
<table>
<tr>
	<td>
		<img src="/Muhan/error404.gif" width="300" height="300" >
	</td>
	<td><h3>((404에러입니다))</h3><br>
		<h3>경로를 확인하세요</h3>
	</td>
	</tr>
</table>
</form>