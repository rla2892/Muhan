package handler.admin.menu;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.menu.Menu_Dao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_menu_delete_Handler implements CommandHandler{
	@Resource
	private Menu_Dao menu_dao;
	
	@RequestMapping("/Admin_menu_delete")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int menu_id = Integer.parseInt(request.getParameter("menu_id"));
		int result = menu_dao.deleteMenu(menu_id);
		request.setAttribute("result", result);
		return new ModelAndView("admin/admin_menu/admin_menu_delete_pro");
	}
}
