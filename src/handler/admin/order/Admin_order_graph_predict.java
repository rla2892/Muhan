package handler.admin.order;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.menu.Menu_Dao;
import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean_for_recieve;
import db.order_history.Order_history_regression_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_order_graph_predict implements CommandHandler{

	@Resource
	private Order_history_Dao order_history_dao;

	@Resource
	private Menu_Dao menu_dao;
	
	@RequestMapping("/Admin_order_graph_predict")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		//금일, 이번달, 이번해
		//1 금일-시간별
		//2 이번달-일별
		//3 이번해-월별
		//4 전체-연도별
		int time_scale;
		if(  request.getParameter("time_scale") != null) {
			time_scale=Integer.parseInt(request.getParameter("time_scale"));
		}else {
			time_scale=1;
		}
		//오늘날짜
		Calendar today = Calendar.getInstance();
		int this_year = today.get(Calendar.YEAR);
		int this_hour = today.get(Calendar.HOUR_OF_DAY);
		//System.out.println(this_hour);
		
		//all 모든 주문 불러오기
		List<Order_history_DataBean_for_recieve> order_history_dtos;
		int start_time;
		int last_time;
		switch(time_scale) {
		case 1: order_history_dtos=order_history_dao.selectOrdersAllToday();//오늘, 시간별
				start_time=0;//고정
				last_time=23;//고정
				break;
		case 2: order_history_dtos=order_history_dao.selectOrdersAllMonth();//이번달, 일별
				start_time=1;//고정
				last_time=31;
				break;
		case 3: order_history_dtos=order_history_dao.selectOrdersAllYear();//이번해, 월별
				start_time=1;//고정
				last_time=12;//고정
				break;
		case 4: order_history_dtos=order_history_dao.selectOrdersAll();//모든, 연도별
				start_time=this_year-2;//변동
				last_time=this_year;//변동
				break;
		default:order_history_dtos=order_history_dao.selectOrdersAllToday();
				start_time=0;//고정
				last_time=23;//고정
				break;
		}
		//마지막 시간
		
		
		//데이터 만들기 위한 맵 만들기 <시간, 매출액>
		Map<Integer,Long> time_sales = new HashMap<Integer,Long>();
		//for(int i=start_time; i<=last_time; i++) {
		for(int i=start_time; i<=this_hour; i++) {
			time_sales.put(i, 0l);
		}
		//데이터 만들기
		for(int i=0; i<order_history_dtos.size();i++) {
			Date dto_timestamp = order_history_dtos.get(i).getOrder_date();
			int dto_time;
			
			switch(time_scale) {
			case 1:dto_time= dto_timestamp.getHours();
					break;
			case 2:dto_time= dto_timestamp.getDate();
					break;
			case 3:dto_time= dto_timestamp.getMonth()+1;
					break;
			case 4:dto_time= dto_timestamp.getYear()+1900;
					break;
			default:dto_time= dto_timestamp.getHours();
					break;
			}
			
			int price = menu_dao.selectMenu(order_history_dtos.get(i).getMenu_id()).getMenu_price();
			int qnt = order_history_dtos.get(i).getOrder_qnt();
			int all_pay = price*qnt;
			Long old_pay = time_sales.get(dto_time);
			time_sales.put(dto_time, old_pay+all_pay );
		}
		//데이터 보내기
		request.setAttribute("time_sales", time_sales);
/////////////////////////////////////////////////////////////////////////////////////////////////////
		//누적데이터 만들기 위한 맵 만들기 <시간, 매출액>
		Map<Integer,Long> time_sales_cumul = new HashMap<Integer,Long>();
		//for(int i=start_time; i<=last_time; i++) {
		for(int i=start_time; i<=this_hour; i++) {
			time_sales_cumul.put(i, time_sales.get(i));
		}
		
		//누적 데이터 만들기
		//for(int i=start_time; i<=last_time; i++) {
		for(int i=start_time; i<=this_hour; i++) {
			Long new_sales = time_sales_cumul.get(i);
			if(i != start_time ){
				new_sales += time_sales_cumul.get(i-1);
			}
			time_sales_cumul.put(i, new_sales);
		}
		//누적 데이터 보내기
		request.setAttribute("time_sales_cumul", time_sales_cumul);
/////////////////////////////////////////////////////////////////////////////////////////////////////
		//예상 매출액 가져오기
		//모델
		List<Order_history_regression_DataBean > order_history_regression_dto=order_history_dao.selectRegression();
		List<Double> regression_model = new ArrayList<Double>();
		for(int i=0;i<order_history_regression_dto.size();i++) {
			double weight = order_history_regression_dto.get(i).getWeight();
			regression_model.add(weight);
		}
		//예상 매출액 계산
		Map<Integer,Long> time_sales_predicted = new HashMap<Integer,Long>();
		for(int i=start_time; i<=last_time; i++) {
			Long predicted_sales=0l;
			predicted_sales+= regression_model.get(regression_model.size()-1).longValue();//절편 더하기
			predicted_sales+= regression_model.get(1).longValue();//2018년 더하기
			predicted_sales+= regression_model.get(i+1).longValue();//2018년 더하기
			
			time_sales_predicted.put(i, predicted_sales);
		}
		//데이터 보내기
		request.setAttribute("time_sales_predicted", time_sales_predicted);
		
		//예상 누적 매출액 계산
		Map<Integer,Long> time_sales_cumul_predicted = new HashMap<Integer,Long>();
		for(int i=start_time; i<=last_time; i++) {
			time_sales_cumul_predicted.put(i, time_sales_predicted.get(i));
		}
		//누적 
		for(int i=start_time; i<=last_time; i++) {
			Long new_sales = time_sales_cumul_predicted.get(i);
			if(i != start_time ){
				new_sales += time_sales_cumul_predicted.get(i-1);
			}
			time_sales_cumul_predicted.put(i, new_sales);
		}
		//데이터 보내기
		request.setAttribute("time_sales_cumul_predicted", time_sales_cumul_predicted);
		return new ModelAndView("admin/admin_order/admin_order_graph_predict");
	}
}
