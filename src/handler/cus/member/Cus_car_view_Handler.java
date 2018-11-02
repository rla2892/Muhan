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
public class Cus_car_view_Handler implements CommandHandler{
	@Resource
	private Customer_member_Dao cus_member_dao;
	
	@RequestMapping("/cus_car_view")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String cus_id = (String) request.getSession().getAttribute("cus_id");
		//System.out.println("아이디는 : "+cus_id);
		Customer_member_DataBean customer_member_dto = cus_member_dao.selectCustomer(cus_id);
		String cus_address= customer_member_dto.getCus_address()+" "+customer_member_dto.getCus_address2();
		request.setAttribute("cus_address", cus_address);
		
		return new ModelAndView("/cus/cus_member/cus_car_view");
	}
}
