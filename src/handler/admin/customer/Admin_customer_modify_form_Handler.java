package handler.admin.customer;

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
public class Admin_customer_modify_form_Handler implements CommandHandler {
	
	@Resource
	private Customer_member_Dao customer_member_dao;
	
	@RequestMapping("/Admin_customer_modify_form")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String cus_id = request.getParameter("cus_id");
		//System.out.println(cus_id);
		Customer_member_DataBean customer_member_dto = customer_member_dao.selectCustomer(cus_id);
		request.setAttribute("customer_member_dto", customer_member_dto);
		
		return new ModelAndView("admin/admin_customer/admin_customer_modify_form");
	}

}
