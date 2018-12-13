<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  년,월,일,시,분,초,주문번호,아이디,나이,성별,지역,메뉴명,가격,수량 -->
년,월,일,시,분,초,주문번호,아이디,나이,성별,지역,메뉴명,가격,수량
<br>

<script>
//함수:랜덤
function randombetween(a,b){
	var random_number;
	random_number = Math.floor( Math.random()*(b+1-a)+a );
	return random_number;
}
//함수:랜덤 주소
function randomlocation(){
	var locations=['서울','인천','경기','대전','충청','세종','강원','부산','대구','울산','경상','광주','전라','제주'];
	var random_number;
	random_number = randombetween(0,13)
	return locations[random_number];
}
//함수:해당 메뉴 가격 환산
function menu_to_price(menu){
	prices=[8100,9500,7700,8400,7500
		,12500,7200,7000,6500,13300
		,15100,5600,5600,6000,4700
		,7800,5800,6400,5500,4700
		,5200,4700,6700,3500,3600
		,3500,2000,4000,2000,2500
		,1700,1700,1000,2000,2000
		,1900,1000,2300,1700,1000
		,1500,1500,2500,2500,2500
		,2000,1500,2200,2200,2300
		,700,800,2000,2500,1000
		,1500,1000,2500,2500,1700
		,1000,2100,2100,2100,2000
		,2000,2400,2400,2500];
	return prices[menu-1];
}

//새 시간별 로그
var now = new Date();
var now_year = now.getYear()+1900;
var now_month= now.getMonth()+1;
var now_date= now.getDate();
var now_hour= now.getHours();

var order_no=1;
//var now_minute= now.getMinutes();
for(var year=2015; year<=now_year; year++){
	end_month=0;
	if(year==now_year){end_month=now_month}else{end_month=12}
	for(var month=1; month<= end_month;month++){
		end_date=0;
		end_of_month=0;
		if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
			end_of_month=31;
		}else{
			if(month == 2){
				end_of_month=28;
			}else{
				end_of_month=30;
			}
		}
		if(month==now_month && year==now_year){end_date=now_date}else{end_date=end_of_month}
		for(var date=1; date<= end_date;date++){
			end_hour=0;
			if(month==now_month && year==now_year && date==now_date){end_hour=now_hour}else{end_hour=23}
			for(var hour=0; hour<= end_hour;hour++){
				//end_minute=0;
				//if(month==now_month && year==now_year && date==now_date && hour==now_hour){end_minute=now_minute}else{end_minute=59}
				//for(var minute=0; minute<= end_minute;minute++){

////////////////////////////////////////////////////////////////////////////////////
var minute=randombetween(0,59);
var second=randombetween(0,59);
//order_no 존재
var cus_id="cus"+randombetween(1,1000);
var age=randombetween(20,65);
var gender=randombetween(0,1);//0 여자 , 1 남자
var cus_location=randomlocation();
var menu=randombetween(1,69);
var price=menu_to_price(menu);
var quantity=randombetween(1,3);
var store_id="store"+randombetween(1,1312);

//로그 출력
//  년,월,일,시,분,초,주문번호,아이디,나이,성별,지역,메뉴명,가격,수량 
document.write(year);
document.write(",");
document.write(month);
document.write(",");
document.write(date);
document.write(",");
document.write(hour);
document.write(",");
document.write(minute);
document.write(",");
document.write(second);
document.write(",");
document.write(order_no);
document.write(",");
document.write(cus_id);
document.write(",");
document.write(age);
document.write(",");
document.write(gender);
document.write(",");
document.write(cus_location);
document.write(",");
document.write(menu);
document.write(",");
document.write(price);
document.write(",");
document.write(quantity);
document.write(",");
document.write(store_id);
document.write("<br>");

order_no++//주문번호 1 증가
////////////////////////////////////////////////////////////////////////////////////
				//}//분
			}//시간
		}//일
	}//월
}//년

////

/* for(var i=0; i<10000; i++){
	document.write("<br>");
	document.write(i);
	document.write(",");
	
	var year = randombetween(2015,2018);
	var month = randombetween(1,12);
	var day;
	if(month == 1,month == 3,month == 5,month == 7,month == 8,month == 10,month == 12){
		day=randombetween(1,31);
	}else{
		if(month ==2){
			day=randombetween(1,30);
		}else{
		day=randombetween(1,30);
		}
	}
	var hour=randombetween(0,23);
	var minute=randombetween(0,59);
	var second=randombetween(0,59);
	var age=randombetween(20,65);
	var gender=randombetween(0,1);//0 여자 , 1 남자
	var menu=randombetween(1,69);
	var quantity=randombetween(1,3);
	var cus_id="cus"+randombetween(1,1000);
	
	day= Math.floor(Math.random()*12)+1;
	document.write(year);
	document.write(",");
	document.write(month);
	document.write(",");
	document.write(day);
	document.write(",");
	document.write(hour);
	document.write(",");
	document.write(minute);
	document.write(",");
	document.write(second);
	document.write(",");
	document.write(age);
	document.write(",");
	document.write(gender);
	document.write(",");
	document.write(menu);
	document.write(",");
	document.write(quantity);
	document.write(",");
	document.write(cus_id);
	
}
 */
 </script>