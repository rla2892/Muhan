package handler.cus.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.customer_member.Customer_member_Dao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Id_Check_Handler implements CommandHandler{
	
	@Resource
	private Customer_member_Dao cusMemberDao;
	
	@Override
	@RequestMapping("cus_id_check")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String cus_id=request.getParameter("id");
		
		int result=cusMemberDao.check(cus_id);
		request.setAttribute("result", result);
		request.setAttribute("cus_id", cus_id);
		
		return new ModelAndView("/cus/cus_member/cus_id_check");
	}
}
