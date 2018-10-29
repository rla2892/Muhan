package handler.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Store_logout_Handler implements CommandHandler {
	@RequestMapping("/Store_logout")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		request.getSession().removeAttribute("store_id");
		request.getSession().removeAttribute("store_name");
		return new ModelAndView("store/store_main");
	}

}
