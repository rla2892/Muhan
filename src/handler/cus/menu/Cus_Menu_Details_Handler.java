package handler.cus.menu;

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
public class Cus_Menu_Details_Handler implements CommandHandler{
	
	@Resource
	private Menu_Dao menuDao;
	
	@Override
	@RequestMapping("/cus_menu_details")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int menu_id=Integer.parseInt(request.getParameter("menu_id"));
		Menu_DataBean menuItem=menuDao.selectMenu(menu_id);
		request.setAttribute("menuItem", menuItem);
		
		return new ModelAndView("/cus/cus_menu/cus_menu_details");
	}
}