package handler.admin.data;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Random;


public class Admin_data_gen_one_file {
	//함수:랜덤
	public static int randombetween(int a,int b){
		return (int) (Math.random()*(b+1-a)+a);
	}
	//함수:랜덤 주소
	public static String randomlocation(){
		String[] locations= {"서울","인천","경기","대전","충청","세종","강원","부산","대구","울산","경상","광주","전라","제주"};
		int random_number= randombetween(0,13);
		return locations[random_number];
	}
	//함수:랜덤고객
	public static Cus_for_random random_cus(String cus_id,int age_group){
		int age=20;
		if(age_group==2){
			age=randombetween(20, 29);
		}else if(age_group==3) {
			age=randombetween(30, 39);
		}else if(age_group==4) {
			age=randombetween(40, 49);
		}else {
			age=randombetween(50, 65);
		}
		Cus_for_random cus = new Cus_for_random();
		cus.setAge(age);
		cus.setCus_id(cus_id);
		cus.setGender(randombetween(0, 1)); //여자 0 남자 1
		cus.setCus_location(randomlocation());
		return cus;
	}
	//함수:해당 메뉴 가격 환산
	public static int menu_to_price(int menu){
		int[] prices= {8100,9500,7700,8400,7500
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
			,2000,2400,2400,2500};
		return prices[menu-1];
	}
	public static void main(String[] args) throws IOException {
		//시작시간
		long start = System.currentTimeMillis();
		
		//메뉴들
		ArrayList menu_ids = new ArrayList();
		for(int i=1; i<=69;i++) {
			menu_ids.add(i);
		}
		
		//고객들
		ArrayList<Cus_for_random> cus_objects_20 = new ArrayList<Cus_for_random>();
		ArrayList<Cus_for_random> cus_objects_30 = new ArrayList<Cus_for_random>();
		ArrayList<Cus_for_random> cus_objects_40 = new ArrayList<Cus_for_random>();
		ArrayList<Cus_for_random> cus_objects_50 = new ArrayList<Cus_for_random>();
		for(int i=1; i<=9999; i++) {
			String cus_id="cus"+i;
			cus_objects_20.add(random_cus(cus_id,2));
		}
		for(int i=10000; i<=19999; i++) {
			String cus_id="cus"+i;
			cus_objects_30.add(random_cus(cus_id,3));
		}
		for(int i=20000; i<=29999; i++) {
			String cus_id="cus"+i;
			cus_objects_40.add(random_cus(cus_id,4));
		}
		for(int i=30000; i<=39999; i++) {
			String cus_id="cus"+i;
			cus_objects_50.add(random_cus(cus_id,5));
		}
		
		//랜덤객체
		Random normal_random = new Random();
		int normal_random_int;
		
		//객체 생성
		String cus_id;
		int age;
		int gender;
		String cus_location;
		int menu;
		int price;
		int quantity;
		String store_id;
		String new_data;
		
		//시간 객체 생성
		int minute;
		//int end_minute;
		int second;
		
		
		//새 시간별 로그
		Date now = new Date();
		int now_year = now.getYear()+1900;
		int now_month= now.getMonth()+1;
		int now_date= now.getDate();
		int now_hour= now.getHours();
		int now_minute= now.getMinutes();

		//주문번호 시작 번호
		int order_no=1;
		
		FileOutputStream output = null; //파일
		output = new FileOutputStream("c:/home/one_log.txt");
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////							
			//로그 파일 열기
			
			//로그 만들 반복 실행
			//년 단위 : 2015~2018
			for(int year=2016; year<=now_year; year++){
				int end_month=0;
				if(year==now_year){end_month=now_month;}else{end_month=12;}
				//월 단위 : 1~12
				for(int month=1; month<= end_month;month++){

					StringBuffer data =new StringBuffer(""); //파일에 쓸 로그
					int end_date=0;
					int end_of_month=0;
					if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
						end_of_month=31;
					}else{
						if(month == 2){
							end_of_month=28;
						}else{
							end_of_month=30;
						}
					}
					if(month==now_month && year==now_year){end_date=now_date;}else{end_date=end_of_month;}
					//일 단위 : 1~31
					for(int date=1; date<= end_date;date++){
						int end_hour=0;
						if(month==now_month && year==now_year && date==now_date){end_hour=now_hour;}else{end_hour=23;}
						for(int hour=0; hour<= end_hour;hour++){
//							end_minute=0;
//							if(month==now_month && year==now_year && date==now_date && hour==now_hour){end_minute=now_minute;}else{end_minute=59;}
//							for(int minute=0; minute<=end_minute;minute++) {
///////////////////////////////////////////////////////////////////////////////////
//로그 쓰기 시작							
normal_random_int= (int) (normal_random.nextGaussian()*3+12);
if(year>=2017) {
	normal_random_int+=2;
	if(year>=2018) {
		normal_random_int+=2;
	}
}
if( hour==12 || hour==13 || hour==18 || hour==19 || hour==20 ) {
	normal_random_int+=5;
}
if(normal_random_int<0) {
	normal_random_int=0;
}
int reps=normal_random_int;

int[] minute_select = new int[reps];
for(int minute_i=0;minute_i<reps;minute_i++) {
	minute_select[minute_i]=randombetween(0, 59);
}
Arrays.sort(minute_select);

for(int rep=0;rep<reps;rep++) {

minute=minute_select[rep];
second=randombetween(0,59);

//랜덤 매장
int store_no=randombetween(1,1312);
store_id="store"+store_no;
int store_group=(store_no%3)+1;

//랜덤고객유형
int[] cus_groups = {2, 2, 2, 2, 2, 2, 3, 3, 4, 5};
if(store_group==1) {
}else if(store_group==2) {
	cus_groups[1] =3;
	cus_groups[2] =3;
	cus_groups[3] =3;
	cus_groups[4] =3;
	cus_groups[5] =4;
	cus_groups[6] =4;
	cus_groups[7] =4;
	cus_groups[8] =4;
}else {
	cus_groups[3] =3;
	cus_groups[4] =3;
	cus_groups[5] =3;
	cus_groups[6] =4;
	cus_groups[7] =4;
	cus_groups[8] =5;
}
Random random_cus_group = new Random();
int cus_group = cus_groups[random_cus_group.nextInt(cus_groups.length)];

//랜덤 고객 생성
Cus_for_random cus_random=null;
if(cus_group==2) {
	cus_random=cus_objects_20.get(randombetween(0, 9998));
}else if(cus_group==3) {
	cus_random=cus_objects_30.get(randombetween(0, 9998));
}else if(cus_group==4) {
	cus_random=cus_objects_40.get(randombetween(0, 9998));
}else {
	cus_random=cus_objects_50.get(randombetween(0, 9998));
}
cus_id=cus_random.getCus_id();
age=cus_random.getAge();
gender=cus_random.getGender();
cus_location=cus_random.getCus_location();

	// 메뉴 정보.
	int menu_count=1;
	menu_count=randombetween(1, 3);
	Collections.shuffle(menu_ids);
	ArrayList menu_select = new ArrayList();
	for(int select=0;select<menu_count;select++) {
		menu_select.add(menu_ids.get(select));
	}
	if(age>=20 && age<30 && gender==1) {
		menu_select.set(0, 1);
	}
	for(int menu_index=0;menu_index<menu_count;menu_index++ ) {
	
	menu=(int)menu_select.get(menu_index);
	
	price=menu_to_price(menu);
	quantity=randombetween(1,3);
	
	//로그 출력
	//년,월,일,시,분,초,주문번호,아이디,나이,성별,지역,메뉴명,가격,수량,매장명
	new_data= year+","+month+","+ date+","+hour+","+minute+","+second+","+order_no+","+cus_id
	+","+age+","+gender+","+cus_location+","+menu+","+price+","+quantity+","+store_id+"\r\n";
	//System.out.println(new_data);
	data.append(new_data);
	
	}//menu_count
order_no++;//주문번호 1 증가
}//rep

////////////////////////////////////////////////////////////////////////////////////
//						}//분
					}//시간
				}//일
				output.write(data.toString().getBytes());
			}//월
		}//년
					
		output.close();
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////							
		
		// 끝에 아래와 같이 삽입
		long end = System.currentTimeMillis();
		System.out.println( "실행 시간 : " + ( end - start )/1000.0 );
	}//main
}//class

