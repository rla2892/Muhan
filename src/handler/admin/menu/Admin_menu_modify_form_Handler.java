package handler.admin.menu;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.menu.Menu_Dao;
import db.menu.Menu_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_menu_modify_form_Handler implements CommandHandler {
	
	@Resource
	private Menu_Dao menu_dao;
	
	@RequestMapping("/Admin_menu_modify_form")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int menu_id = Integer.parseInt(request.getParameter("menu_id"));
		
		Menu_DataBean menu_dto = menu_dao.selectMenu(menu_id);
		
		request.setAttribute("menu_dto", menu_dto);
		
		return new ModelAndView("admin/admin_menu/admin_menu_modify_form");
	}

}
