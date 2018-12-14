package handler.admin;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_data implements CommandHandler{
	
	//함수:랜덤
	public int randombetween(int a,int b){
		int random_number;
		random_number = (int) Math.floor( Math.random()*(b+1-a)+a );
		return random_number;
	}
	//함수:랜덤 주소
	public String randomlocation(){
		String[] locations= {"서울","인천","경기","대전","충청","세종","강원","부산","대구","울산","경상","광주","전라","제주"};
		int random_number= randombetween(0,13);
		return locations[random_number];
	}
	//함수:해당 메뉴 가격 환산
	public int menu_to_price(int menu){
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
	
	
	@RequestMapping("/Admin_data")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//새 시간별 로그
		Date now = new Date();
		int now_year = now.getYear()+1900;
		int now_month= now.getMonth()+1;
		int now_date= now.getDate();
		int now_hour= now.getHours();

		//주문번호 시작 번호
		int order_no=1;
		
		FileOutputStream output = null; //파일
		String data =""; //파일에 쓸 로그
		try {
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////					
			//로그 파일 열기
			output = new FileOutputStream("c:/home/out.txt");
			
			//로그 만들 반복 실행
			//년 단위 : 2015~2018
			for(int year=2015; year<=now_year; year++){
				int end_month=0;
				if(year==now_year){end_month=now_month;}else{end_month=12;}
				//월 단위 : 1~12
				for(int month=1; month<= end_month;month++){
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
////////////////////////////////////////////////////////////////////////////////////
							
//로그 쓰기 시작							

//			data += now_year;
//			data += "\r\n";
//			data += now_month;
//			data += "\r\n";
//			data += now_date;
//			data += "\r\n";
//			data += now_hour;
//			data += "\r\n";
//int my_random = randombetween(1, 100);
//data += my_random + "\r\n";

int minute=randombetween(0,59);
int second=randombetween(0,59);
//order_no 존재
String cus_id="cus"+randombetween(1,1000);
int age=randombetween(20,65);
int gender=randombetween(0,1);//0 여자 , 1 남자
String cus_location=randomlocation();
int menu=randombetween(1,69);
int price=menu_to_price(menu);
int quantity=randombetween(1,3);
String store_id="store"+randombetween(1,1312);
				
//로그 출력
//년,월,일,시,분,초,주문번호,아이디,나이,성별,지역,메뉴명,가격,수량 
data += year+","+month
+ ","
+ date
+ ","
+ hour
+ ","
+ minute
+ ","
+ second
+ ","
+ order_no
+ ","
+ cus_id
+ ","
+ age
+ ","
+ gender
+ ","
+ cus_location
+ ","
+ menu
+ ","
+ price
+ ","
+ quantity
+ ","
+ store_id
+ "\r\n";

order_no++;//주문번호 1 증가
////////////////////////////////////////////////////////////////////////////////////
//}//분
						}//시간
					}//일
				}//월
			}//년

				
			output.write(data.getBytes());
			
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////					
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				output.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return new ModelAndView("admin/admin_data_view");
	}
}
