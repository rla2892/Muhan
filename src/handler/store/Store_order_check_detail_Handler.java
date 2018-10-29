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
import db.order_history.Order_history_DataBean_for_store2;
import db.store_member.Store_member_Dao;
import db.store_member.Store_member_coords_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Store_order_check_detail_Handler implements CommandHandler {
	@Resource
	private Order_history_Dao order_history_dao;
	@Resource
	private Store_member_Dao store_member_dao;
	
	@RequestMapping("/Store_order_check_detail")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today =  sdf.format(date);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("order_date", today);
		map.put("order_no", request.getParameter("order_no"));
		System.out.println( request.getParameter("order_no") );
		List <Order_history_DataBean_for_store2> orderdetails 
		= order_history_dao.selectOrderDetails(map);
		
		request.setAttribute("orderdetails", orderdetails);
		request.setAttribute("cus_address", request.getParameter("cus_address"));
		request.setAttribute("cus_address2", request.getParameter("cus_address2"));
		
		//지도변경
		List<Store_member_coords_DataBean> storeLonLat = store_member_dao.selectLonLat( (String) request.getSession().getAttribute("store_id") );
		request.setAttribute("storeLonLat", storeLonLat);

		return new ModelAndView("store/store_order_check_detail");
	}

}
