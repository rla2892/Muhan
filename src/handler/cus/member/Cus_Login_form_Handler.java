package handler.cus.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
@Controller
public class Cus_Login_form_Handler implements CommandHandler{
	
	@Override
	@RequestMapping("/cus_login_form")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
				
		if(request.getParameter("identifier") != null) {
			String identifier=request.getParameter("identifier");
			request.setAttribute("identifier", identifier);			
		} else {
			String identifier="0";
			request.setAttribute("identifier", identifier);
		}
		
		return new ModelAndView("/cus/cus_member/cus_login_form");
	}
}
