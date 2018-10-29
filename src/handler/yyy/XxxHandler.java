package handler.yyy;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class XxxHandler implements CommandHandler {
	
	@Resource
	private Menu_Dao menu_dao;
	
	@RequestMapping("/xxx")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<Menu_DataBean> menu_dtos = menu_dao.selectMenus();
		String test = menu_dtos.get(0).getMenu_name();
		request.setAttribute("test", test);
		request.setAttribute("menu_dtos", menu_dtos);
		
		int ressr = 1+1;
		return new ModelAndView( "yyy/xxx" );
	}


}
