package handler.admin.menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.menu.Menu_DBBean;
import db.menu.Menu_Dao;
import db.menu.Menu_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_menu_find_Handler implements CommandHandler {
	
	@Resource
	private Menu_Dao menu_dao;
	
	@RequestMapping("/Admin_menu_find")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int category;
		
		if(request.getParameter("category")==null || request.getParameter("category").equals("")){
			category = 0;
		}else {
			category = Integer.parseInt(request.getParameter("category"));
		}
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		Map<String, Integer> map2 = new HashMap<String, Integer>();
		Map<String, Integer> map3 = new HashMap<String, Integer>();
		
		if(category==0) {
			map.put( "menu_category", 0 );
			List<Menu_DataBean> menus = menu_dao.selectMenus();
			request.setAttribute("menus", menus);
		}else {
			if(category==1) {
				map.put( "menu_category", 1 );
				map2.put( "menu_category", 4 );
			}else if(category==2){
				map.put( "menu_category", 2 );
				map2.put( "menu_category", 5 );
			}else if(category==3){
				map.put( "menu_category", 3 );
				map2.put( "menu_category", 6 );
			}else if(category==4){
				map.put( "menu_category", 4 );
				map2.put( "menu_category", 5 );
			}
			
			List<Menu_DataBean> menus = menu_dao.selectMenusByCategory(map);
			request.setAttribute("menus", menus);
			List<Menu_DataBean> menus2 = menu_dao.selectMenusByCategory(map2);
			request.setAttribute("menus2", menus2);
		}
		
		return new ModelAndView("admin/admin_menu/admin_menu_find");
	}

}
