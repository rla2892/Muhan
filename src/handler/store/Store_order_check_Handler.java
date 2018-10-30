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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean_for_store1;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Store_order_check_Handler implements CommandHandler {
	@Resource
	private Order_history_Dao order_history_dao;	
	
	@RequestMapping("/Store_order_check")
	@Override
	@ResponseBody 
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		return new ModelAndView("store/store_order_check");
	}
	
	@RequestMapping(value = "/ajaxtest", method = RequestMethod.GET, produces = "application/text; charset=utf8")
    public @ResponseBody
    String getTime(HttpServletRequest request, HttpServletResponse response) {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("store_id", (String)request.getSession().getAttribute("store_id"));
		map.put("order_date", today);
		
		int result = order_history_dao.checkOrders(map);
		
		String jsonFromJavaArrayList = "";
		
		if( result !=0 ) {
			List<Order_history_DataBean_for_store1> orders = order_history_dao.selectOrdersByDate(map);
			Gson gsonBuilder = new GsonBuilder().create();
			jsonFromJavaArrayList = gsonBuilder.toJson(orders);
		}	
		
        return jsonFromJavaArrayList;
    }
}
