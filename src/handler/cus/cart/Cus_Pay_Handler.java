package handler.cus.cart;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.customer_member.Customer_member_Dao;
import db.customer_member.Customer_member_DataBean;
import handler.CommandHandler;
import handler.HandlerException;
@Controller
public class Cus_Pay_Handler implements CommandHandler {
	
	@Resource
	private Customer_member_Dao customer_member_dao;
	
	@RequestMapping("/cus_pay")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String cus_id = (String) request.getSession().getAttribute("cus_id");
		System.out.println(cus_id);
		
		Customer_member_DataBean customer_member_dto = customer_member_dao.selectCustomer(cus_id);	//신상정보
		request.setAttribute("customer_member_dto", customer_member_dto);
		
		return new  ModelAndView("cus/cus_cart/cus_pay");
	}

}
