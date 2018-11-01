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
public class Store_revenue_year_Handler implements CommandHandler {
	@Resource
	private Order_history_Dao order_history_dao;
	
	@RequestMapping("/Store_revenue_year")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//추후에 Integer.parseInt(request.getParameter("month")); 로 값 받아서 하는 걸로 수정!
		String year = "2018";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("store_id", (String) request.getSession().getAttribute("store_id"));
		map.put("year", year);
		List<Order_history_DataBean_for_store_Timegraph> order_history_year_dtos = order_history_dao.selectOrdersForYearByStore(map);
		Calendar calendar = Calendar.getInstance();
		Map<Integer, Integer> yearmap = new TreeMap<Integer, Integer>();
		Gson gson = new Gson();
		String jsonyearmap = "";
		
		for(int i=0; i<order_history_year_dtos.size(); i++ ) {
			calendar.setTime(order_history_year_dtos.get(i).getOrder_date());
			int month = calendar.get(Calendar.MONTH)+1;
/*			System.out.println(
					order_history_year_dtos.get(i).getOrder_date()
			+ " : " + month 
			+ " : " + order_history_year_dtos.get(i).getOrder_qnt()
			+ " : " + order_history_year_dtos.get(i).getMenu_price()
	);*/
			for(int j=0; j<13; j++) {
				int old_pay = yearmap.get(j) == null ? 0 : yearmap.get(j);
				yearmap.put(j, old_pay);
				if( month==j ) {
					yearmap.put(j, old_pay + (order_history_year_dtos.get(i).getOrder_qnt()*order_history_year_dtos.get(i).getMenu_price()));
				}
			}
		}
		jsonyearmap = gson.toJson(yearmap);
		request.setAttribute("jsonyearmap", jsonyearmap);
		//System.out.println(jsonyearmap);
		
		return new ModelAndView("store/store_revenue_year");
	}

}
