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
public class Cus_Modify_Info_Form_Handler implements CommandHandler{
	@Resource
	private Customer_member_Dao dao;
	@Override
	@RequestMapping("cus_modify_info_form")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//정보 얻어오기
		
		String cus_id=(String)request.getSession().getAttribute("cus_id");
		/*System.out.println(cus_id);//출력 확인*/
		
		Customer_member_DataBean memberDto = dao.selectCustomer(cus_id);
		request.setAttribute("memberDto", memberDto);
		
		
		
		
		return new ModelAndView("/cus/cus_member/cus_modify_info_form");
	}
}
