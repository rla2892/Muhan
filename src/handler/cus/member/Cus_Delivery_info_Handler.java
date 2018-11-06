package handler.cus.member;

import java.util.HashMap;
import java.util.Map;

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
//test중
@Controller
public class Cus_Delivery_info_Handler implements CommandHandler {
	private static final int DELIVERY_START=5;
	private static final int DELIVERY_END=6;
	
	@Resource
	private Order_history_Dao order_history_dao;
	
	@RequestMapping("/cus_delivery_check")
	public void androidTest(HttpServletRequest request) { 
		String s_order_no=request.getParameter("order_no");	
		String delivery_status=request.getParameter("delivery_status");
		
		int order_no=(s_order_no==null?0:Integer.parseInt(s_order_no));
		int order_status=0;
		
		if(delivery_status.equals("start")) {
			order_status=DELIVERY_START;
		}else if (delivery_status.equals("end")) {
			order_status=DELIVERY_END;
			//order_history_dao.deleteCarLocations(order_no);//좌표 삭제
		}
		
		Map<String, Integer>map=new HashMap<String,Integer>();
		map.put("order_no", order_no);
		map.put("order_status", order_status);
		
		order_history_dao.updateDeliveryStatus(map);
		
		System.out.print("주문번호:"+order_no+" ");
		System.out.println("배달 상태:"+delivery_status);	
	}
	@RequestMapping("/cus_delivery_tracker")
	public void delivery_tracker(HttpServletRequest request) {
		String car_id="car1";//나중에 변경
		
		int order_no=Integer.parseInt(request.getParameter("order_no"));
		String lat=request.getParameter("lat");
		String lng=request.getParameter("lng");
		
		Order_history_car_DataBean order_history_car_dto=new Order_history_car_DataBean();
		order_history_car_dto.setOrder_no(order_no);
		order_history_car_dto.setCar_id(car_id);
		order_history_car_dto.setCar_x(lng);
		order_history_car_dto.setCar_y(lat);
		
		order_history_dao.insertCarLocation(order_history_car_dto);
		
		System.out.print("주문번호:"+ order_no+" ");//나중에 지우기
		System.out.println("lat:"+lat+" lng:"+lng);//나중에 지우기
	}
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		return null;
	} 

}