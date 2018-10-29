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
public class Cus_Delete_Info_Pro_Handler implements CommandHandler{
	
	@Resource
	private Customer_member_Dao customer_member_dao;
	
	@Override
	@RequestMapping("/cus_delete_info_pro")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String cus_id = (String) request.getSession().getAttribute("cus_id");
		String cus_pw = request.getParameter("cus_pw");
		
		Customer_member_DataBean customer_member_dto = customer_member_dao.selectCustomer(cus_id);
		
		int result;
		
		//System.out.println(cus_pw);
		//System.out.println(customer_member_dto.getCus_pw());
		if(cus_pw.equals(customer_member_dto.getCus_pw()) ) {
			customer_member_dao.deleteCustomer(cus_id);
			result = 1;
		}else {
			result = 0;
		}
		
		System.out.println(result);
		request.setAttribute("result", result);
		return new ModelAndView("/cus/cus_member/cus_delete_info_pro");
	}
}
