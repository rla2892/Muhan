package handler.cus.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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
public class Cus_Menu_Handler implements CommandHandler{
	
	@Resource
	private Menu_Dao menuDao;
	
	@Override
	@RequestMapping("/cus_menu")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String menu_category=request.getParameter("menu_category");
		
		if(menu_category.contains(",")) {
			String[] menuCat=menu_category.split(",");
			int menuCat1=Integer.parseInt(menuCat[0]);
			int menuCat2=Integer.parseInt(menuCat[1]);
			
			Map<String, Integer> map1=new HashMap<String, Integer>();
			map1.put("menu_category", menuCat1);
			List<Menu_DataBean> menus1=menuDao.selectMenusByCategory(map1);
			
			Map<String, Integer> map2=new HashMap<String, Integer>();
			map2.put("menu_category", menuCat2);
			List<Menu_DataBean> menus2=menuDao.selectMenusByCategory(map2);
			
			List<Menu_DataBean> menus=Stream.of(menus1, menus2).flatMap(x->x.stream()).collect(Collectors.toList());
			request.setAttribute("menus", menus);
			
		} else {
			int menuCat=Integer.parseInt(menu_category);
			
			if(menuCat==0) {
				// 메뉴카테고리 0: 전체메뉴 (웹으로 처리하는 사항)
				
				List<Menu_DataBean> menus=menuDao.selectMenus();
				request.setAttribute("menus", menus);
				
			} else {
				// 세트(1), 버거(2), 사이드와 음료(3)
				Map<String, Integer> map=new HashMap<String, Integer>();
				map.put("menu_category", menuCat);
				
				List<Menu_DataBean> menus=menuDao.selectMenusByCategory(map);
				request.setAttribute("menus", menus);
			}
		}
		return new ModelAndView("/cus/cus_menu/cus_menu");
	}
}