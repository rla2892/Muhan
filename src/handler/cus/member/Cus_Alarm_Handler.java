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
import com.google.gson.GsonBuilder;

import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean_for_Alarm;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Alarm_Handler implements CommandHandler{

	@Resource
	private Order_history_Dao order_history_dao;	
	
	@RequestMapping(value="/cus_alarmResponse.do", method=RequestMethod.GET)
	@ResponseBody
	public String ajaxResponse(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String jsonFromJavaArrayList = "";
		String cus_id=(String)request.getSession().getAttribute("cus_id");
		List<Order_history_DataBean_for_Alarm> alarms = order_history_dao.checkOrderStatus(cus_id);
		Gson gsonBuilder = new GsonBuilder().create();
		jsonFromJavaArrayList = gsonBuilder.toJson(alarms);
			
		return jsonFromJavaArrayList;
	}
	
	@RequestMapping(value="/cus_ajaxOrderStatusUpdate", method=RequestMethod.GET)
	@ResponseBody
	public int ajaxUpdateResponse(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int order_no=Integer.parseInt(request.getParameter("order_no"));
		int result = order_history_dao.ajaxUpdateOrderStatus(order_no);
		
		return result;
	}
	
	@Override
	@RequestMapping("/cus_alarm")
	@ResponseBody
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		return new ModelAndView("/cus/cus_member/cus_alarm");
	}
}