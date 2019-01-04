package handler.cus.member;

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
public class Cus_Logout_Handler implements CommandHandler{
	@Resource
	private Menu_Dao menuDao;
	
	@Override
	@RequestMapping("/cus_logout")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String cus_id = (String)request.getSession().getAttribute("cus_id");
		System.out.println(cus_id);
		if(cus_id != null) menuDao.deleteRecommended(cus_id);
		
		request.getSession().removeAttribute("cus_id");
		request.getSession().removeAttribute("black");
		
		return new ModelAndView("/cus/cus_member/cus_logout");
	}
}
