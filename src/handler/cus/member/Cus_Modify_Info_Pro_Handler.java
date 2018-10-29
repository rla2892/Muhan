package handler.cus.member;

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
public class Cus_Modify_Info_Pro_Handler implements CommandHandler{
	
	@Resource
	private Customer_member_Dao dao;
	@RequestMapping("cus_modify_info_pro")
	
	
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
				
//		Customer_member_DataBean customer_member_dto=new Customer_member_DataBean();
		String cus_id = (String) request.getSession().getAttribute("cus_id");
		Customer_member_DataBean customer_member_dto=dao.selectCustomer(cus_id);
		
		customer_member_dto.setCus_nickname(request.getParameter("nickname"));
		customer_member_dto.setCus_pw(request.getParameter("passwd"));
		customer_member_dto.setCus_address(request.getParameter("address"));
		customer_member_dto.setCus_address2(request.getParameter("address2"));
		// 전화번호
		String tel = null;
		String tel1 = request.getParameter( "tel1" );
		String tel2 = request.getParameter( "tel2" );
		String tel3 = request.getParameter( "tel3" );
		if( ! tel1.equals( "" ) && ! tel2.equals( "" ) && ! tel3.equals( "" ) ) {
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}
		customer_member_dto.setCus_tel( tel );
		
		int result=dao.modifyCustomer(customer_member_dto);
		request.setAttribute("result", result);
		
		
		return new ModelAndView("/cus/cus_member/cus_modify_info_pro");
	}
}
