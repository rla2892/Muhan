package handler.store;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.order_history.Order_history_Dao;
import handler.CommandHandler;
import handler.HandlerException;
@Controller
public class Store_order_confirm_pro_Handler implements CommandHandler {
	@Resource
	private Order_history_Dao order_history_dao;
	@RequestMapping("/Store_order_confirm_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("store_id", (String)request.getSession().getAttribute("store_id"));
		map.put("order_no", (String)request.getParameter("order_no"));
		int result = order_history_dao.confirmOrderStatus(map);
		
		request.setAttribute("result", result);
		request.setAttribute("order_no", Integer.parseInt(request.getParameter("order_no")));
		
		return new ModelAndView("store/store_order_confirm_pro");
	}

}
