package handler.admin.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean;
import db.order_history.Order_history_DataBean_for_store2;
import db.order_history.Order_info_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_order_find_Handler implements CommandHandler{
	
	@Resource
	private Order_history_Dao order_history_dao;
	
	@RequestMapping("/Admin_order_find")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//all
		Map<String, String> map = new HashMap<String, String>();
		map.put( "start", "a" );
		map.put( "end", "b" );
		List<Order_history_DataBean> order_history_dtos =  order_history_dao.selectOrders(map);
		request.setAttribute("order_history_dtos", order_history_dtos);

		//cus_id
		if(request.getParameter("cus_id") != null) {
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put( "cus_id", request.getParameter("cus_id") );
		
		List<Order_history_DataBean> order_history_dtos2 =  order_history_dao.selectOrdersByCus(map2);
		request.setAttribute("order_history_dtos2", order_history_dtos2);
		}
		
		//store_id
		if(request.getParameter("store_id") != null) {
			Map<String, String> map3 = new HashMap<String, String>();
			map3.put( "store_id", request.getParameter("store_id") );
			
			List<Order_history_DataBean> order_history_dtos3 =  order_history_dao.selectOrdersByStore(map3);
			request.setAttribute("order_history_dtos3", order_history_dtos3);
		}

		//order_no
		if(request.getParameter("order_no") != null) {
			
			int order_no = Integer.parseInt(request.getParameter("order_no"));
			
			List<Order_history_DataBean> order_history_dtos4 =  order_history_dao.selectOrder(order_no);
			request.setAttribute("order_history_dtos4", order_history_dtos4);
		}
		
		//order_no >>> order_info
		if(request.getParameter("order_no") != null) {
			
			int order_no2 = Integer.parseInt(request.getParameter("order_no"));
			
			Order_info_DataBean order_history_dto5 =  order_history_dao.selectOrderInfo(order_no2);
			request.setAttribute("order_history_dto5", order_history_dto5);
		}
		
		//order_no >>> order_menu
		if(request.getParameter("order_no") != null) {
			
			int order_no3 = Integer.parseInt(request.getParameter("order_no"));
			
			List<Order_history_DataBean_for_store2> order_history_dtos6 =  order_history_dao.selectOrderDetail(order_no3);
			request.setAttribute("order_history_dtos6", order_history_dtos6);
		}
		
		//order_no >>> pay
		if(request.getParameter("order_no") != null) {
			
			int order_no4 = Integer.parseInt(request.getParameter("order_no"));
			
			int pay =  order_history_dao.selectPay(order_no4);
			request.setAttribute("pay", pay);
		}
		
		return new ModelAndView("admin/admin_order/admin_order_find");
	}
}
