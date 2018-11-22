<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
//함수 기본
function randombetween(a,b){
	var random_number;
	random_number = Math.floor( Math.random()*(b+1-a)+a );
	return random_number;
}

function random_year(){
	return randombetween(2015,2018);
}
function random_month(){
	return randombetween(1,12);
}
function random_day(month){
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
	return day;
}
function random_hour(){
	return randombetween(0,23);
}
function random_minute(){
	return randombetween(0,59);
}
function random_second(){
	return randombetween(0,59);
}
function random_timestamp(){
	var timestamp;
	timestamp = ""+random_year()+"-"+random_month()+"-"+random_day()+"-"+random_hour()+"-"+random_minute()+"-"+random_second()
	return timestamp
}
function random_timestamp_to_date(){
	var timestamp_to_date;
	timestamp_to_date = "to_date('";
	timestamp_to_date += random_timestamp();
	timestamp_to_date += "'";
	timestamp_to_date +=", 'YYYY-MM-DD-HH24-mi-ss')";
	return timestamp_to_date;
}

function random_cus_id(){
	return "cus"+randombetween(1,1000);
}
function random_store_id(){
	return "store"+randombetween(1,1309);
}
function random_quantity(){
	return randombetween(1,3);
}
function random_menu(){
	return randombetween(1,69);
}


// random : order_history
function random_order_history(order_no){
	var order_history="";
	order_history +="insert into mh_order_history values("
	order_history +=order_no
	order_history +=","
	order_history +=random_quantity()
	order_history +=","
	order_history +=random_timestamp_to_date()
	order_history +=","
	order_history +=random_menu()
	order_history +=",'"
	order_history +=random_cus_id()
	order_history +="','"
	order_history +=random_store_id()
	order_history +="',"
	order_history +=3
	order_history +=");"
	return order_history;
	
}

</script>