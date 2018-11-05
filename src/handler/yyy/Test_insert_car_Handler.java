package handler.yyy;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.order_history.Order_history_Dao;
import db.order_history.Order_history_car_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Test_insert_car_Handler implements CommandHandler{
	
	@Resource
	private Order_history_Dao order_history_dao;
	
	@RequestMapping("/test_insert_car")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int order_no;
		if(request.getParameter("order_no") == null || "".equals(request.getParameter("order_no"))) {
			order_no=1;
		}else{
			order_no=Integer.parseInt(request.getParameter("order_no"));
		}
		System.out.println(order_no);
		
		double car_x = 127.0305572 + Math.random()*0.006;
		double car_y = 37.49843089 + Math.random()*0.006;
		
		Order_history_car_DataBean order_history_car_dto = new Order_history_car_DataBean();
		order_history_car_dto.setCar_id("car1");
		order_history_car_dto.setOrder_no(order_no);
		order_history_car_dto.setCar_x(""+car_x);
		order_history_car_dto.setCar_y(""+car_y);
		
		Timestamp car_date = new Timestamp( System.currentTimeMillis() );
		
		order_history_car_dto.setCar_date(car_date);
		
		if(request.getParameter("order_no") == null || "".equals(request.getParameter("order_no"))) {
		}else{
			int result = order_history_dao.insertCarLocation(order_history_car_dto);
		}
		return new ModelAndView( "yyy/test_insert_car" );
	}
}
