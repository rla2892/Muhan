package handler.store;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

/*import java.io.IOException;*/

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean_for_store1;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Store_orders_location_Handler implements CommandHandler {
	@Resource
	private Order_history_Dao order_history_dao;	
	
	@RequestMapping("/Store_orders_location")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("store_id", (String)request.getSession().getAttribute("store_id"));
		map.put("order_date", today);
		
		int result = order_history_dao.checkOrders(map);
		request.setAttribute("result", result);
		
		if( result !=0 ) {
			List<Order_history_DataBean_for_store1> orders = order_history_dao.selectOrdersByDate(map);
			request.setAttribute("orders", orders);
		}
		
		return new ModelAndView("store/store_orders_location");
	}

}
