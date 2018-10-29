package handler.cus.member;

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

import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean_for_Alarm;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Alarm_Handler implements CommandHandler{

	@Resource
	private Order_history_Dao orderHistoryDao;
	
	@RequestMapping(value="/cus_ajaxResponse", method=RequestMethod.GET)
	@ResponseBody
	public String ajaxResponse(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		String cus_id=(String)request.getSession().getAttribute("cus_id");
		
		Map<String, String> ajaxResponseData=new HashMap<String, String>();
//		List<Order_history_DataBean_for_Alarm> orderStatus=orderHistoryDao.checkOrderStatus(cus_id);
		Order_history_DataBean_for_Alarm orderStatus=orderHistoryDao.checkOrderStatus(cus_id);
		
		if (orderStatus==null) {
			ajaxResponseData.put("orderNo", "0");
			ajaxResponseData.put("orderStatus", "0");
		} else {
//			ajaxResponseData.put("orderNo", String.valueOf(orderStatus.get(0).getOrder_no()));
//			ajaxResponseData.put("orderStatus", String.valueOf(orderStatus.get(0).getOrder_status()));
			ajaxResponseData.put("orderNo", String.valueOf(orderStatus.getOrder_no()));
			ajaxResponseData.put("orderStatus", String.valueOf(orderStatus.getOrder_status()));
		}
		
		String ajaxResult=new Gson().toJson(ajaxResponseData);		
		return ajaxResult;
	}
	
	@RequestMapping(value="/cus_ajaxOrderStatusUpdate", method=RequestMethod.GET)
	@ResponseBody
	public String ajaxUpdateResponse(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int order_no=Integer.parseInt(request.getParameter("order_no"));
		String ajaxUpdateResult=String.valueOf(orderHistoryDao.ajaxUpdateOrderStatus(order_no));
		
		return ajaxUpdateResult;
	}
	
	@Override
	@RequestMapping("/cus_alarm")
	@ResponseBody
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		return new ModelAndView("/cus/cus_member/cus_alarm");
	}
}
