<%@page import="db.order_history.Order_history_DataBean_for_store1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="/Muhan/jquery-3.3.1.js"></script>
<%@ include file="store_setting.jsp"%>
<script src="${project}script.js"></script>
<script type="text/javascript">
//<!--
var jsonorders = '';

function crunchifyAjax() {
        $.ajax({
            url : 'ajaxtest.do',
            cache : false,
            contentType: "application/json; charset=UTF-8", 
 			success : function (data) {
				if(data == '') {
					var myHTMLStr = '${msg_noorder}';
					$('#result').html(myHTMLStr);
					
				} else if ( data != ''){
					
 				jsonorders = JSON.parse(data);
				var myHTMLStr=	 '<table class="table table-striped"><tr> <th>주문번호</th> <th>주문시간</th>'
						+ '<th>고객ID</th> <th>고객주소</th> <th>고객 상세주소</th>'
						+ '<th>고객 전화번호</th> <th>고객 이메일</th> <th>주문상태</th>'
				 		+ '<th colspan="3" class="text-center">확인</th> </tr>'
				 for(var i in jsonorders) {
						
				 myHTMLStr+='<tr><td class="text-center">' + jsonorders[i]['order_no'] + '</td><td>' + jsonorders[i]['order_date'] + 
						 '</td><td>' + jsonorders[i]['cus_id'] + '</td><td>' + jsonorders[i]['cus_address'] + 
						 '</td><td>' + jsonorders[i]['cus_address2'] + '</td><td>' + jsonorders[i]['cus_tel'] +
						 '</td><td>' + jsonorders[i]['cus_email'] + '</td><td class="text-center"><b class="orderalarm">' + jsonorders[i]['order_status']
				 		+'</b></td>'		
					+'<td><input type="button" id="detailbutton" class="btn btn-primary btn-sm" value="상세보기" name="'+ jsonorders[i]['order_no'] +', '+ jsonorders[i]['cus_address'] +', '+ jsonorders[i]['cus_address2'] +'"></td>'
					+'<td><input type="button" id="confirmbutton" class="btn btn-primary btn-sm" value="확인" name="'+ jsonorders[i]['order_no'] +'"></td>'
					+'<td><input type="button" id="completebutton" class="btn btn-primary btn-sm" value="완료" name="'+ jsonorders[i]['order_no'] +'"></td></tr>'
				}
				myHTMLStr+='</table>';
				
				$('#result').html(myHTMLStr);
				
				for(var i=0; i<$('b').length; i++ ) {
					if ($('b').eq(i).text() === '1' ){
						$('b').eq(i).html('<img src="/Muhan/store/bell.png" width="30" height="30"><audio src="/Muhan/store/alarm.mp3" autoplay="autoplay">');
					} 
					if ($('b').eq(i).text() === '2') {
						$('b').eq(i).html('<img src="/Muhan/store/success.png" width="30" height="30">');
					}
				}
				
				}
			}         
        });    
    }

$(document).ready(
		crunchifyAjax()
);
		
var intervalId = 0;
intervalId = setInterval(crunchifyAjax, 3000);	 

$(document).on("click","#detailbutton", function(e){ 
		var orderdetailstr = e.target.name;
		var orderdetailarr = orderdetailstr.split(",", 3);
		checkorderdetails( orderdetailarr[0], orderdetailarr[1], orderdetailarr[2] );
	 });

$(document).on("click","#confirmbutton", function(e){
		location="Store_order_confirm_pro.do?order_no="+e.target.name
	 });

$(document).on("click","#completebutton", function(e){ 
		location="Store_order_complete_pro.do?order_no="+e.target.name
 });
/* 	
 
 	$('*').on(
		'click',
		function(){
			alert( ' 이 태그는 : ' + $(this).prop('tagName') + ', 값은 : ' + $(this).val() );
		}
	); 
*/

//-->
</script>

<body>
	<jsp:include page="store_topNav.jsp" flush="false"/>
	<h2><a href="Store_main.do" title="누르시면 메인화면으로 돌아갑니다.">주문 확인</a></h2>
	<div id="result" class="table-responsive"></div>
</body>
