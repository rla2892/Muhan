package handler.cus.member;

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
public class Cus_Customer_Info_Handler implements CommandHandler{
	
	@Resource
	private Customer_member_Dao customer_member_dao;
	
	@Override	
	@RequestMapping("cus_customer_info")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String cus_id = (String) request.getSession().getAttribute("cus_id");
		Customer_member_DataBean customer_member_dto = customer_member_dao.selectCustomer(cus_id);
		
		request.setAttribute("customer_member_dto", customer_member_dto);
		return new ModelAndView("/cus/cus_member/cus_customer_info");
	}
}
