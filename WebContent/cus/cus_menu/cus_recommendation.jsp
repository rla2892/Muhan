<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/cus/cus_setting.jsp"%>
<%@include file="/cus/cus_script.jsp"%>

<script type="text/javascript">
//<!--
$(window).on(
		'load',
		function(event) {
			$.ajax({
				url: 'cus_checkRecommended.do',
				contentType: 'application/json; charset="UTF-8"',
				cache: false,
				success: function(data) {
					if(data == '주문이력없음') {
						alert('주문이력이 있는 회원만 사용가능한 서비스입니다.');
						location.href="cus_menu.do?menu_category=4,5";
					} else {
					var jsonmenus = JSON.parse(data);
					var myHTMLStr = '';
 					for(var i in jsonmenus){
 						myHTMLStr += '<a class="menuListItem" href="cus_menu_details.do?menu_id='+jsonmenus[i]['menu_id']+'" ><div class="card mt-4 mb-4">'
 								+ '<img class="card-img-top img-fluid" src="/Muhan/menu_images/'+jsonmenus[i]['menu_image']+'"alt="Menu Img" width="150" height="100">'
 								+ '<div class="card-body text-center font-weight-bold flex-fill"><b class="card-title text-danger">'+([i]) +'위 '+jsonmenus[i]['menu_name']+ '</b>'
 								+ '<p class="card-text text-dark">' + jsonmenus[i]['menu_price'] + '원</p></div></div></a>'
 					}
					$('#menu_card').html(myHTMLStr); 
					}
				},
 				beforeSend: function(){
 					$('.wrap-loading').removeClass('display-none');
				},
				complete:function(){
			        $('.wrap-loading').addClass('display-none');
			    },
				error:function(e) {
					console.log('ajaxResponse 수신 실패');
				}
			});
		}
	); 
//-->
</script>

<html>
	<head>
		<%@include file="/cus/cus_head.jsp"%>

<style>
.jumbotron{
    background: url("/Muhan/cus/cus_images/menu1.jpg") no-repeat center center; 
    -webkit-background-size: 100% 100%;
    -moz-background-size: 100% 100%;
    -o-background-size: 100% 100%;
    background-size: 100% 100%;
}
/* jumbotron image */

	/* .wrap-loading{ /*화면 전체를 어둡게 합니다.*/
	    position: fixed;
	    left:0;
	    right:0;
	    top:0;
	    bottom:0;
	    background: rgba(0,0,0,0.2); /*not in ie */
	    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
	} */
    .wrap-loading div{ /*로딩 이미지*/
        position: fixed;
        top:50%;
        left:50%;
        margin-left: -21px;
        margin-top: -21px;
    }
    .display-none{ /*감추기*/
        display:none;
    }

</style>
	</head>
	<body>
		<%@include file="/cus/cus_topNav.jsp"%>
		
		<!-- Descriptor Jumbotron -->
		<div class="jumbotron mt-1">
			<h1 class="display-5 text-center font-weight-bold pt-4"></h1>
			
		</div>
		
		<%@include file="/cus/cus_menu/cus_menu_subNav.jsp"%>
		
		<!-- Container -->
		<div class="container">
			
			<!-- Menu List shown in Cards -->
			<div class="card-deck mt-4 mb-4" id="menu_card">
				<div class="wrap-loading display-none">
				    <div><img src="/Muhan/review_images/loading.gif"/>
				    	당신을 위한 추천 메뉴 분석 중입니다.
				    	<br>
				    	<br>
				    	<br>
				    	<br>
				    	<br>
				    	<br>
				    	<br>
				    	
				    </div>
				</div> 
			</div>
			
		</div>
		
		<%@include file="/cus/cus_scrollableFooter.jsp"%>
		<!-- Scrollable Footer: 붙이는 위치가 Fixed Footer와는 다릅니다! Scollable Footer는 중단 Container 밖에 넣어주셔야 합니다. -->
		
	</body>
</html>

