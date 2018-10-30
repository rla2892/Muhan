package handler.store;


import java.text.SimpleDateFormat;
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

import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean_for_graph;
import db.store_member.Store_member_Dao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Store_order_graph_cat_Handler implements CommandHandler{
	
	@Resource
	private Order_history_Dao order_histroy_dao;
	
	@Resource
	private Store_member_Dao store_member_dao;
	
	@RequestMapping("/Store_order_graph_cat")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException{ 
		
		String store_id= (String)request.getSession().getAttribute("store_id");
		
		String owner_reg_date=store_member_dao.getRegDate(store_id);
		String date[]=owner_reg_date.split("-");
	
		Map<String,String> owner_date=new HashMap<String,String>();
		owner_date.put("year",date[0]);
		owner_date.put("month",date[1]);
		owner_date.put("day",date[2]);
		request.setAttribute("owner_date", owner_date);
		
		Date today=new Date();
		SimpleDateFormat to_date=new SimpleDateFormat("yyyy-MM");
		
		String search_month=String.valueOf(to_date.format(today));

		Map<String, String>map=new HashMap<String, String>();
		map.put("store_id", store_id);
		map.put("search_month", search_month);
		
		List<Order_history_DataBean_for_graph>order_history_dto=order_histroy_dao.selectOrdersStatusByStore(map);
		request.setAttribute("order_history_dto",order_history_dto);
		
		return new ModelAndView("store/store_order_graph_cat");
	}
}
