<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
번호,년,월,일,시,분,초,나이,성별,메뉴,수량,아이디

<script>
//함수
function randombetween(a,b){
	var random_number;
	random_number = Math.floor( Math.random()*(b+1-a)+a );
	return random_number;
}

for(var i=0; i<10000; i++){
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
</script>