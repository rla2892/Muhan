package handler.cus.member;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean_for_store2;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Detailed_Order_History_Handler implements CommandHandler {
	@Resource
	private Order_history_Dao order_history_dao;
	
	@RequestMapping("/cus_detailed_order_history")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int order_no = Integer.parseInt(request.getParameter("order_no"));
		String order_date = request.getParameter("order_date");
		System.out.println( order_no );
		
		List <Order_history_DataBean_for_store2> orderdetailsbycus = 
				order_history_dao.selectDetailedOrdersByCuslist(order_no);
		for(int i=0; i<orderdetailsbycus.size(); i++ ) {
			System.out.println(orderdetailsbycus.get(i));
		}
		
		request.setAttribute("orderdetailsbycus", orderdetailsbycus);
		request.setAttribute("order_no", order_no);
		request.setAttribute("order_date", order_date);
		
		return new ModelAndView("/cus/cus_member/cus_detailed_order_history");
	}

}
