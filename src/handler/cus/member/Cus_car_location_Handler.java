package handler.cus.member;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean;
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
		int order_no; 
		if(request.getParameter("order_no") == null) {
			order_no =0;
		}else {
			order_no = Integer.parseInt(request.getParameter("order_no"));
		}
		List<Order_history_car_DataBean> order_hisotry_car_dtos = order_history_dao.selectCarLocations(order_no);
		request.setAttribute("order_hisotry_car_dtos", order_hisotry_car_dtos);
		
		int order_status = order_history_dao.getOrder_status(order_no).get(0);
		request.setAttribute("order_status", order_status);
		
		return new ModelAndView("/cus/cus_member/cus_car_location");
	}
}
