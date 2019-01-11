package handler.admin.data;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Random;

public class Admin_data_gen_sql_insert_all_today {
	//함수:랜덤
	public static int randombetween(int a,int b){
		return (int) (Math.random()*(b+1-a)+a);
	}
	public static String timestamp_to_date(String timestamp){
		String timestamp_to_date = "to_date('";
		timestamp_to_date += timestamp;
		timestamp_to_date += "'";
		timestamp_to_date +=", 'YYYY-MM-DD-HH24-mi-ss')";
		return timestamp_to_date;
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
	public static void main(String[] args) throws IOException {
		//시작시간
		long start = System.currentTimeMillis();
		
		//메뉴들
		ArrayList<Integer> menu_ids = new ArrayList<Integer>();
		for(int i=1; i<=69;i++) {
			menu_ids.add(i);
		}
		
		//객체
		int age;
		int gender;
		String cus_location;
		
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
		int menu;
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
		output = new FileOutputStream("c:/home/mh_order_history_today.sql");
		
		//output.write("delete from mh_order_history;\n".getBytes());
		//output.write("commit;\n".getBytes());
		output.write("select count(*) from mh_order_history;\n".getBytes());
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////							
		//로그 파일 열기
		
		int year = now_year;
		int month = now_month;
		int date = now_date;
		
		StringBuffer data =new StringBuffer(""); //파일에 쓸 로그
		String delete_today_order="delete from mh_order_history where to_char( ORDER_DATE, 'yyyymmdd' ) = to_char( sysdate, 'yyyymmdd');\n";
		data.append(delete_today_order);
		data.append("insert all\n");
		int end_hour=now_hour;
		for(int hour=0; hour<= end_hour;hour++){
//////////////////////////////////////////////////////////////////////////////////
//로그 쓰기 시작							
normal_random_int= (int) (normal_random.nextGaussian()*3+12);
if(year>=2017) {
	normal_random_int+=2;
	if(year>=2018) {
		normal_random_int+=2;
	}
}
if( hour==12 || hour==13 || hour==18 || hour==19 || hour==20 ) {
	normal_random_int+=10;
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

int cus_number_group=Integer.parseInt(cus_id.substring(3, cus_id.length()));

//메뉴 정보.
int menu_count=1;
menu_count=randombetween(1, 3);

ArrayList<Integer> new_menu_ids = (ArrayList<Integer>) menu_ids.clone();
if(cus_number_group%2==1) {
	new_menu_ids.removeIf(id -> id%2 == 1);
}else {
	new_menu_ids.removeIf(id -> id%2 == 0);
}

Collections.shuffle(new_menu_ids);
ArrayList menu_select = new ArrayList();
for(int select=0;select<menu_count;select++) {
	menu_select.add(new_menu_ids.get(select));
}

	for(int menu_index=0;menu_index<menu_count;menu_index++ ) {
	
		menu=(int) menu_select.get(menu_index);
		
		quantity=randombetween(1,3);
		
		//로그 출력
		//년,월,일,시,분,초,주문번호,아이디,나이,성별,지역,메뉴명,가격,수량,매장명
		
		new_data="into mh_order_history(order_no,order_qnt,order_date,menu_id,cus_id,store_id,order_status) values("+order_no+","+quantity+","
				+timestamp_to_date(year+"-"+month+"-"+date+"-"+hour+"-"+minute+"-"+second)+","+menu
				+",'"+cus_id+"','"+store_id+"',"+3+")"+"\n";
		//System.out.println(new_data);
		data.append(new_data);
	
	}//menu_count
order_no++;//주문번호 1 증가
}//rep

////////////////////////////////////////////////////////////////////////////////////
//					}//분
		}//시간
		data.append("select * from dual;\n");
		data.append("select count(*) from mh_order_history;\n");
		data.append("commit;\n");
		output.write(data.toString().getBytes());
		
		output.close();
					
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////							
		
		// 끝에 아래와 같이 삽입
		long end = System.currentTimeMillis();
		System.out.println( "실행 시간 : " + ( end - start )/1000.0 );
	}//main
}//class

