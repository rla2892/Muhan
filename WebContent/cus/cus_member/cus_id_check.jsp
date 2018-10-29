<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<script src="cus/cus_member/cus_join_checking_script.js"></script>
	
<html>
	<head>
		<%@include file="/cus/cus_head.jsp"%>
	</head>
	<body>
		<div class="container-fluid justify-content-center text-center mt-4">
			<c:if test="${result eq 0}">
				<div class="idCheckResult pt-4">
					<h6><strong>${cus_id}</strong>: &nbsp; 사용하실 수 있는 아이디입니다.</h6>
						<button type="button" class="btn btn-warning" onclick="setid('${cus_id}')">
							<span class="text-dark font-weight-bold">확인</span>
						</button>
						<button type="button" class="btn btn-warning" onclick="cancel()">
							<span class="text-dark font-weight-bold">취소</span>
						</button>
				</div>
			</c:if>
			<c:if test="${result eq 1}">
				<div class="idCheckResult">
					<h6><strong>${cus_id}</strong>: &nbsp; 이미 사용중인 아이디입니다.</h6>
					<form name="idcheckform" method="get" action="cus_id_check.do" onsubmit="retryIdCheck()">
						<div class="form-row justify-content-center">
							<input type="text" class="form-control w-75 text-center" name="id" maxlength="20" placeholder="다른 아이디를 입력해 주세요.">
						</div>
						<button type="submit" class="btn btn-warning mt-1">
							<span class="text-dark font-weight-bold">중복 확인</span>
						</button>
						<button type="button" class="btn btn-warning mt-1" onclick="cancel()">
							<span class="text-dark font-weight-bold">취소</span>
						</button>
					</form>
				</div>
			</c:if>
		</div>
	</body>
</html>