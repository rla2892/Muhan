package handler.cus.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
@Controller
public class Cus_Logout_Handler implements CommandHandler{
	
	@Override
	@RequestMapping("/cus_logout")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		request.getSession().removeAttribute("cus_id");
		request.getSession().removeAttribute("black");
		
		return new ModelAndView("/cus/cus_member/cus_logout");
	}
}
