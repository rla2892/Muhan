package handler.cus.member;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean_for_Cuslist;
import handler.CommandHandler;
import handler.HandlerException;
@Controller
public class Cus_Order_History_Handler implements CommandHandler{
	@Resource
	private Order_history_Dao order_history_dao;
	
	@Override
	@RequestMapping("cus_order_history")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String cus_id = (String)request.getSession().getAttribute("cus_id");
		
		int result = order_history_dao.selectCountOrdersByCus(cus_id);
		
		if( result == 0 ) {
			request.setAttribute("result", result);
			
		} else {	
			List <Order_history_DataBean_for_Cuslist> cusorderlist 
			= order_history_dao.selectOrdersByCuslist(cus_id);
			
			List<Integer> counts = new ArrayList<Integer>();
			for(int i=0; i<cusorderlist.size(); i++) {
				counts.add( order_history_dao.selectCountOrder( cusorderlist.get(i).getOrder_no() ));
			}
			
			request.setAttribute("cusorderlist", cusorderlist);
			request.setAttribute("counts", counts);
		}	

		return new ModelAndView("/cus/cus_member/cus_order_history");
	}
}
