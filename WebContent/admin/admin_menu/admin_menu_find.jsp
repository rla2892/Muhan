<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<%@ include file="../../admin/admin_ui/admin_top.jsp" %>
<script src="${project}script.js"></script>
<script src="./jquery-3.3.1.js"></script>

<%@ include file="../../admin/admin_ui/admin_aside_menu.jsp" %>
		
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="btn-group btn-group-justified">
  <a href="#" class="btn btn-primary" onclick="allMenus()">전체</a>
  <a href="#" class="btn btn-primary" onclick="setMenus()">세트</a>
  <a href="#" class="btn btn-primary" onclick="burgerMenus()">단품</a>
  <a href="#" class="btn btn-primary" onclick="sideMenus()">사이드와 음료</a>
  <a href="#" class="btn btn-primary" onclick="newMenus()">신제품</a>
</div>

<div id="printMenus"></div>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%@ include file="../../admin/admin_ui/admin_aside_end.jsp" %>

<script>

$(document).ready(function(){
	allMenus();
});

function allMenus() {
	 jQuery.ajax({
        type:"GET",
        url:"/Muhan/Admin_menu_find2.do",
        dataType:"html", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
        success : function(data) {
     	   $("#printMenus").html(data);
              // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
              // TODO
        },
        complete : function(data) {
              // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
              // TODO
        },
        error : function(xhr, status, error) {
              alert("에러발생");
        }
  });
}

function setMenus() {
	 jQuery.ajax({
        type:"GET",
        url:"/Muhan/Admin_menu_find2.do?category=1",
        dataType:"html", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
        success : function(data) {
     	   $("#printMenus").html(data);
              // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
              // TODO
        },
        complete : function(data) {
              // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
              // TODO
        },
        error : function(xhr, status, error) {
              alert("에러발생");
        }
  });
}

function burgerMenus() {
	 jQuery.ajax({
       type:"GET",
       url:"/Muhan/Admin_menu_find2.do?category=2",
       dataType:"html", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
       success : function(data) {
    	   $("#printMenus").html(data);
             // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
             // TODO
       },
       complete : function(data) {
             // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
             // TODO
       },
       error : function(xhr, status, error) {
             alert("에러발생");
       }
 });
}

function sideMenus() {
	 jQuery.ajax({
       type:"GET",
       url:"/Muhan/Admin_menu_find2.do?category=3",
       dataType:"html", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
       success : function(data) {
    	   $("#printMenus").html(data);
             // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
             // TODO
       },
       complete : function(data) {
             // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
             // TODO
       },
       error : function(xhr, status, error) {
             alert("에러발생");
       }
 });
}

function newMenus() {
	 jQuery.ajax({
       type:"GET",
       url:"/Muhan/Admin_menu_find2.do?category=4",
       dataType:"html", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
       success : function(data) {
    	   $("#printMenus").html(data);
             // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
             // TODO
       },
       complete : function(data) {
             // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
             // TODO
       },
       error : function(xhr, status, error) {
             alert("에러발생");
       }
 });
}
</script>
