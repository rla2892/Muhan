package handler.admin.data;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Random;

public class Admin_data_gen_sql {
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
	public static void main(String[] args) throws IOException {
		//시작시간
		long start = System.currentTimeMillis();
		
		//메뉴들
		ArrayList<Integer> menu_ids = new ArrayList<Integer>();
		for(int i=1; i<=69;i++) {
			menu_ids.add(i);
		}
		
		//고객들
		ArrayList<String> cus_ids = new ArrayList<String>();
		for(int i=1; i<=50000; i++) {
			String cus_id="cus"+i;
			cus_ids.add(cus_id);
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
		output = new FileOutputStream("c:/home/mh_order_history.sql");
		output.write("delete from mh_order_history;\n".getBytes());
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
//						end_minute=0;
//						if(month==now_month && year==now_year && date==now_date && hour==now_hour){end_minute=now_minute;}else{end_minute=59;}
//						for(int minute=0; minute<=end_minute;minute++) {
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
//order_no 존재
//랜덤 고객 생성
String cus_random=cus_ids.get(randombetween(1, 50000-1));
cus_id=cus_random;
store_id="store"+randombetween(1,1312);

	// 메뉴 정보.
	int menu_count=1;
	menu_count=randombetween(1, 3);
	Collections.shuffle(menu_ids);
	ArrayList<Integer> menu_select = new ArrayList<Integer>();
	for(int select=0;select<menu_count;select++) {
		menu_select.add(menu_ids.get(select));
	}
	for(int menu_index=0;menu_index<menu_count;menu_index++ ) {
	
		menu=menu_select.get(menu_index);
		
		quantity=randombetween(1,3);
		
		//로그 출력
		//년,월,일,시,분,초,주문번호,아이디,나이,성별,지역,메뉴명,가격,수량,매장명
		
		new_data="insert into mh_order_history values("+order_no+","+quantity+","
				+timestamp_to_date(year+"-"+month+"-"+date+"-"+hour+"-"+minute+"-"+second)+","+menu
				+",'"+cus_id+"','"+store_id+"',"+3+");"+"\n";
		//System.out.println(new_data);
		data.append(new_data);
	
	}//menu_count
order_no++;//주문번호 1 증가
}//rep

////////////////////////////////////////////////////////////////////////////////////
//					}//분
				}//시간
			}//일
				output.write(data.toString().getBytes());
		}//월
	}//년
		output.write("commit;".getBytes());
		output.close();
					
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////							
		
		// 끝에 아래와 같이 삽입
		long end = System.currentTimeMillis();
		System.out.println( "실행 시간 : " + ( end - start )/1000.0 );
	}//main
}//class

