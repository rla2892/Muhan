package handler.store;

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
import db.order_history.Order_history_DataBean_for_graph;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Store_order_graph_cat_now_Update_Handler implements CommandHandler{
	@Resource
	private Order_history_Dao order_histroy_dao;
	
	@RequestMapping("Store_order_graph_cat_now_Update")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException{ 	

		String store_id= (String)request.getSession().getAttribute("store_id");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String day=request.getParameter("day");
		String menu_category=request.getParameter("menu_category");

		List<Order_history_DataBean_for_graph>order_history_dto;
		
		Map<String, String>map=new HashMap<String, String>();
		map.put("store_id", store_id);
		map.put("search_month",year+"-"+month+"-"+day);
		
		if(menu_category.equals("0")) {//전체
			order_history_dto=order_histroy_dao.selectOrdersStatusByAllStore(map);
		}else {//카테고리별
			map.put("menu_category", menu_category);
			order_history_dto=order_histroy_dao.selectMonthSalesbyAllCat(map);
		}
		request.setAttribute("order_history_dto", order_history_dto);
		request.setAttribute("year",year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("menu_category", menu_category);
		return new ModelAndView("store/store_order_graph_cat_now_Update");
	}
}
