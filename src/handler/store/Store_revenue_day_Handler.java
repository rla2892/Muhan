package handler.store;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean_for_store_Timegraph;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Store_revenue_day_Handler implements CommandHandler {
	@Resource
	private Order_history_Dao order_history_dao;
	
	@RequestMapping("/Store_revenue_day")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String store_id = (String) request.getSession().getAttribute("store_id");
		List<Order_history_DataBean_for_store_Timegraph> order_history_day_dtos = order_history_dao.selectOrdersForDayByStore(store_id);
		Calendar calendar = Calendar.getInstance();
		Map<Integer, Integer> daymap = new TreeMap<Integer, Integer>();
		Gson gson = new Gson();
		String jsondaymap = "";
		
		for(int i=0; i<order_history_day_dtos.size(); i++) {
			calendar.setTime(order_history_day_dtos.get(i).getOrder_date());
			int hour = calendar.get(Calendar.HOUR_OF_DAY);
			for(int j=0; j<24; j++) {
				int old_pay = daymap.get(j) == null ? 0 : daymap.get(j);
				daymap.put(j, old_pay);
				if( hour==j ) {
					daymap.put(j, old_pay + (order_history_day_dtos.get(i).getOrder_qnt()*order_history_day_dtos.get(i).getMenu_price()));
				}
			}		
		}
		
		jsondaymap = gson.toJson(daymap);
		request.setAttribute("jsondaymap", jsondaymap);
		
		return new ModelAndView("store/store_revenue_day");
	}

}
