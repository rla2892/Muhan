<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/Muhan/jquery-3.3.1.js"></script>

<!-- ****************jQuery/Ajax 처리**************** -->
<script type="text/javascript">
	$(document).ready(
		function() {
			/* 브라우저의 '뒤로가기' 버튼을 눌렀을 때 자동 새로고침. 화면 깜빡임이 싫다면 disable 시킬 것. */
/* 			if(performance.navigation.type == 2){
				   location.reload(true);
			} */
			
			$('.newTrex').on(
				'click',
				function(event) {
					window.location.href='cus_menu_details.do?menu_id=13';
				}
			);
			
			$('.navbar-toggler-icon').on(
				'click', 
				function(event) {
				    $('#collapsibleNavbar').collapse('hide');
				}
			);
			
			$('#joinButton').on(
				'click',
				function(event) {
					window.location.href='cus_join.do';
				}
			);
			
			$('#findIdPwButton').on(
				'click',
				function(event) {
					window.location.href='cus_find_id_pw.do';
				}
			);
			
			$('.clickableRow').on(
				'click',
				function(event) {
					window.location=$(this).data('href');
				}
			);
			
			$('.currentPageBottom').on(
				'click',
				function(event) {
					event.preventDefault();
				}
			);
			
			$('#loginCartNavbar').on(
				'click',
				function(event) {
					if(!sessionStorage.getItem('cus_id')) {
						event.preventDefault();
						$('#loginCartNavbar').prop('disabled', true);
						window.location.href='cus_login_form.do';
					}
				}
			);
			
			$('.submitOrder').on(
				'click',
				function(event) {
					if(!sessionStorage.getItem('cus_id')) {
						event.preventDefault();
						alert('로그인 먼저 해 주세요.');
						window.location.href='cus_login_form.do?identifier=1';
					}
				}
			);
			
			$('.replyToContent').on(
					'click',
					function(event) {
						if(!sessionStorage.getItem('cus_id')) {
							event.preventDefault();
							alert('로그인 후 답글을 작성하실 수 있습니다.');
							window.location.href='cus_login_form.do?identifier=2';
						}
					}
				);
			
			$('.reportContent').on(
				'click',
				function(event) {
					if(!sessionStorage.getItem('cus_id')) {
						event.preventDefault();
						alert('로그인 후 신고하실 수 있습니다.');
						window.location.href='cus_login_form.do?identifier=2';
					}
				}
			);
			
			$('#writeReview').on(
				'click',
				function(event) {
					if(!sessionStorage.getItem('cus_id')) {
						event.preventDefault();
						alert('로그인 후 리뷰를 작성하실 수 있습니다.');
						window.location.href='cus_login_form.do?identifier=3';
					}
				}
			);
			
			$('.myReviews').on(
				'click',
				function(event) {
					if(!sessionStorage.getItem('cus_id')) {
						event.preventDefault();
						alert('로그인 후 이용해 주세요.')
						window.location.href='cus_login_form.do?identifier=4';
					}
				}
			);
			
			$('.msgCheck').on(
				'click',
				function(event) {
					sessionStorage.setItem('msgCount', eval(sessionStorage.getItem('msgCount'))-1);
					$('.msgCheck').attr('disabled', true);
					$('.message').html('새 메세지가 없습니다.');
				}
			);
			
			$('#review_image_file').change(
				function(event) {
					var fileName=$('#review_image_file')[0].files[0].name;
					$('.custom-file-label').text(fileName);
				}		
			);
		}
	);
	
	$(window).on(
		'load',
		function(event) {
			var cus_id=sessionStorage.getItem('cus_id');
			if(cus_id) {
				$('.showCusId').html(cus_id+'님');
			}
			
			if(localStorage.getItem('order')) {
	 			var cartItems=(JSON.parse(localStorage.getItem('order'))).length;
	 			$('.numberOfItems').html(cartItems);	
			}
		}
	);

	
 	$(window).on(
		'load',
		function(event) {
			if(sessionStorage.getItem('cus_id')) {
				function updateMsg() {
					$.ajax({
						url: 'cus_alarmResponse.do',
						contentType: 'application/json; charset="UTF-8"',
						cache: false,
						success: function(data) {
							var jsonalarms = JSON.parse(data);
							var newmessage = '';
							if (data == '') {
								$('.message').html('새 메세지가 없습니다.');
							} else if ( data != '') {
								for(var i in jsonalarms) {
									if( jsonalarms[i]['order_status'] == 2 ) {
										newmessage += '주문번호 '+jsonalarms[i]['order_no']+':<br>주문이 접수되었습니다.<br>';
										newmessage += '<button class="btn btn-sm btn-warning ml-2 msgCheck" name='+jsonalarms[i]['order_no']+'>확인</button> <br><br>';
									} else if (jsonalarms[i]['order_status'] == 3) {
										newmessage += '주문번호 '+jsonalarms[i]['order_no']+':<br>주문이 배달되었습니다.<br>';
									}
								}
								$('.message').html(newmessage);
							}
						},
						error:function(e) {
							console.log('ajaxResponse 수신 실패');
						}
					});
				}	
				var ajaxIntervalSetter=setInterval(updateMsg, 3000);
			}
		}
	); 
 	
 	$(document).on("click",".msgCheck", function(e){ 
		var updatealarm = e.target.name;
		$.ajax({
			url: 'cus_ajaxOrderStatusUpdate.do',
			contentType: 'application/json; charset="UTF-8"',
			data: {
				order_no: updatealarm
			},
			cache: false,
			success: function(data) {
				if ( data == 1 ) {
					$('.message').html('새 메세지가 없습니다.');
				}			
			},
			error: function(e) {
				console.log('orderStatus Update 실패');
			}
		});
	 });	
 	
	$(window).on(
		'load',
		function(event) {
			if ($('#topNavbar').height()>72) {
				$('.sticky-top').css({
			        top: $('#topNavbar').height()+10
			    });
				$('.jumbotron').css({
					top: $('#topNavbar').height()
			    });
			} else {
				$('.sticky-top').css({
			        top: 72
			    });
			}
		}
	);
	
	$(window).on(
		'resize',	
		function (event) {
			if ($('#topNavbar').height()>72) {
				$('.sticky-top').css({
			        top: $('#topNavbar').height()+10
			    });
				$('.jumbotron').css({
					top: $('#topNavbar').height()
			    });
			} else {
				$(".sticky-top").css({
			        top: 72
			    });
			}
		}
	);	
</script>

<!-- ****************Javascript 처리**************** -->
<script type="text/javascript">
/*------------General Functions------------*/
function erroralert(msg) {
	alert(msg);
	history.back();
}

function returnToList() {
	history.back();
}

/*------------Member Login Functions------------*/
function loginfocus() {
	loginform.cus_id.focus();
}

function logincheck() {
	if(! loginform.cus_id.value) {
		alert('아이디를 입력해 주세요.');
		loginform.cus_id.focus();
		return false;
	} else if(! loginform.cus_pw.value) {
		alert('패스워드를 입력해 주세요.');
		loginform.cus_pw.focus();
		return false;
	}
}

function storeId(cus_id) {
	sessionStorage.setItem('cus_id', cus_id);
}

function rememberMyId(cus_id) {
	localStorage.setItem('cus_id', cus_id);
	sessionStorage.setItem('cus_id', cus_id);
}

function forgetMyId(cus_id) {
	localStorage.removeItem('cus_id');
}

/*------------Review Functions------------*/
function enterKeyword() {
	if(! searchform.searchbar.value) {
		alert('검색 키워드를 입력해 주세요.');
		return false;
	}
}

function editorFocus() {
	textEditorForm.editorContainer.focus();
}	/* 작동 안함..! 수정 필요 */

/*------------Menu Functions------------*/
function moveItemsToCart(menu_id) {
	var menu_id=menuform.menu_id.value;
	var menu_name=menuform.menu_name.value;
	var menu_price=menuform.menu_price.value;
	var menu_image=menuform.menu_image.value;
	var order_qnt=menuform.qty.value;
	
	var order={'menu_id':menu_id, 'menu_name':menu_name, 'menu_price':menu_price, 'order_qnt':order_qnt, 'menu_image':menu_image};

	if (!localStorage.getItem('order')) {
		order='['+JSON.stringify(order)+']';
		localStorage.setItem('order', order);
	
	} else {
		var existingMenu=localStorage.getItem('order');
		existingMenu=existingMenu.replace('[', '');
		existingMenu=existingMenu.replace(']', '');
		order='['+existingMenu+', '+JSON.stringify(order)+']';
		localStorage.setItem('order', order);
	}
	
	alert('해당 상품을 카트에 담았습니다.');
	history.back();
}

function orderNow(menu_id) {
	var menu_id=menuform.menu_id.value;
	var menu_name=menuform.menu_name.value;
	var menu_price=menuform.menu_price.value;
	var menu_image=menuform.menu_image.value;
	var order_qnt=menuform.qty.value;
	var order=[{'menu_id':menu_id, 'menu_name':menu_name, 'menu_price':menu_price, 'order_qnt':order_qnt, 'menu_image':menu_image},];
	
	sessionStorage.setItem('order', JSON.stringify(order));
	
	if(!sessionStorage.getItem('cus_id')) {			
		alert('로그인 먼저 해 주세요.');
		window.location.href='cus_login_form.do?identifier=1';
	} else {
		window.location.href='cus_pay.do';
	}
}
</script>