<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="/Muhan/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>

<c:set var="project" value="/Muhan/store/"/>

<c:set var="str_maintitle" value="롯데리아 점주 페이지"/>
<c:set var="str_ordercheckmain" value="주문확인"/>
<c:set var="str_myinfomodifymain" value="내정보수정"/>

<c:set var="str_storelogin" value="로그인"/>
<c:set var="str_storepasswd" value="비밀번호"/>

<c:set var="msg_passwdform" value="비밀번호를 입력해주세요"/>
<c:set var="msg_modify" value="수정할 정보를 입력해주세요"/>
<c:set var="msg_welcome" value="점주님 환영합니다"/>
<c:set var="msg_noorder" value="진행중인 주문이 없습니다"/>

<c:set var="btn_mod" value="수정"/>
<c:set var="btn_cancel" value="취소"/>
<c:set var="btn_mod_cancel" value="수정 취소"/>
<c:set var="btn_logout" value="로그아웃"/>

<c:set var="str_store_name" value="점포명"/>
<c:set var="str_store_id" value="점포아이디"/>
<c:set var="str_store_address" value="점포 주소"/>
<c:set var="str_store_tel" value="점포 전화번호"/>
<c:set var="str_owner_email" value="점주이메일"/>
<c:set var="str_owner_name" value="점주명"/>
<c:set var="str_owner_tel" value="점주 전화번호"/>
<c:set var="str_owner_reg_date" value="점주 정보 작성일"/>