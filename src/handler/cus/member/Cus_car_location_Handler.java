package handler.cus.member;

import java.util.List;

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
public class Cus_car_location_Handler implements CommandHandler{
	
	@Resource
	private Order_history_Dao order_history_dao;
	
	@RequestMapping("/cus_car_location")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		List<Order_history_car_DataBean> order_hisotry_car_dto = order_history_dao.selectCarLocations(1);
		System.out.println(order_hisotry_car_dto.get(0).getCar_x());
		System.out.println("test");
		
		return new ModelAndView("/cus/cus_member/cus_car_location");
	}
}
