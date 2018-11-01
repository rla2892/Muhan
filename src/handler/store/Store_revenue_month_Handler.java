package handler.store;

import java.util.Calendar;
import java.util.HashMap;
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
public class Store_revenue_month_Handler implements CommandHandler {
	@Resource
	private Order_history_Dao order_history_dao;
	
	@RequestMapping("/Store_revenue_month")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//추후에 Integer.parseInt(request.getParameter("month")); 로 값 받아서 하는 걸로 수정!
		String select = request.getParameter("month");
		System.out.println(select);
		String month = "09";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("store_id", (String) request.getSession().getAttribute("store_id"));
		map.put("month", month);
		List<Order_history_DataBean_for_store_Timegraph> order_history_month_dtos = order_history_dao.selectOrdersForMonthByStore(map);
		Calendar calendar = Calendar.getInstance();
		System.out.println(calendar.get(Calendar.MONTH)+1);
		Map<Integer, Integer> monthmap = new TreeMap<Integer, Integer>();
		Gson gson = new Gson();
		String jsonmonthmap = "";
		
		for(int i=0; i<order_history_month_dtos.size(); i++) {
			calendar.setTime(order_history_month_dtos.get(i).getOrder_date());
			int day = calendar.get(Calendar.DAY_OF_MONTH);
			for(int j=0; j<32; j++) {
				int old_pay = monthmap.get(j) == null ? 0 : monthmap.get(j);
				monthmap.put(j, old_pay);
				if( day==j ) {
					monthmap.put(j, old_pay + (order_history_month_dtos.get(i).getOrder_qnt()*order_history_month_dtos.get(i).getMenu_price()));
				}
			}		
		}
		
		jsonmonthmap = gson.toJson(monthmap);
		//System.out.println(jsonmonthmap);
		request.setAttribute("jsonmonthmap", jsonmonthmap);
		return new ModelAndView("store/store_revenue_month");
	}

}
