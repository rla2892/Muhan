package handler.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_logout_Handler implements CommandHandler {
	@RequestMapping("/Admin_logout")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		request.getSession().removeAttribute( "memid" );
		return new ModelAndView("admin/admin_login");
	}

}
