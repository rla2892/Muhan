package handler.cus.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
//test중
@Controller
public class Cus_Delivery_info_Handler implements CommandHandler {
	
	@RequestMapping("/cus_order_check")
	public void androidTest(HttpServletRequest request) { 
		//int order_no=Integer.parseInt(request.getParameter("order_no"));
		System.out.println("주문번호:"+request.getParameter("order_no"));
		
		
		System.out.println("위도:"+request.getParameter("lat")+"경도"+request.getParameter("lng"));
	}
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		return null;
	} 

}