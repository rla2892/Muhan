package handler.admin.customer;

import java.io.UnsupportedEncodingException;

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
public class Admin_customer_modify_pro_Handler implements CommandHandler {
	@Resource
	private Customer_member_Dao customer_member_dao;
	
	@RequestMapping("/Admin_customer_modify_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String cus_id = request.getParameter("cus_id");
		Customer_member_DataBean customer_member_dto = customer_member_dao.selectCustomer(cus_id);
		customer_member_dto.setCus_pw(request.getParameter("cus_pw"));
		customer_member_dto.setCus_nickname(request.getParameter("cus_nickname"));
		customer_member_dto.setCus_address(request.getParameter("cus_address"));
		customer_member_dto.setCus_address2(request.getParameter("cus_address2"));
		customer_member_dto.setCus_email(request.getParameter("cus_email"));
		customer_member_dto.setCus_tel(request.getParameter("cus_tel"));
		
		int result = customer_member_dao.modifyCustomer(customer_member_dto);
		request.setAttribute("result", result);
		
		return new ModelAndView("admin/admin_customer/admin_customer_modify_pro");
	}

}
