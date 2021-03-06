package handler.admin.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_order_management_Handler implements CommandHandler{
	
	@RequestMapping("/Admin_order_management")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		return new ModelAndView("admin/admin_order/admin_order_management");
	}
}
