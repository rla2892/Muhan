<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<script src="${project}script.js"></script>

<c:if test="${result eq 0}">
	<table class="table table-hover">
		<tr>
			<td align="center">
				<span>${id}</span>는 사용가능한 아이디입니다.
			</td>
		</tr>
		<tr>
			<td  align="center">
				<input class="btn btn-primary" type="button" value="확인"
					onclick="setid( '${id}' )">
			</td>
		</tr>
	</table>		
</c:if>
<c:if test="${result eq 1}">	
		<form name="confirmform" method="post" action="Admin_store_idcheck.do" 
			onsubmit="return confirmcheck()">
			<table class="table table-hover">
				<tr>
					<td colspan="2" align="center">
						<span>${id}</span>는 이미 존재합니다.	
					</td>
				</tr>
				<tr>
					<td align="center"> 아이디 </td>
					<td align="center">
						<input class="input" type="text" name="id" maxlength="15">
					</td>
				</tr>
				<tr>
					<td colspan="2"  align="center">
						<input class="btn btn-primary" type="submit" value="확인">
						<input class="btn btn-primary" type="button" value="취소"
							onclick="setcancel()">
					</td>
				</tr>
			</table>
		</form>		
</c:if>