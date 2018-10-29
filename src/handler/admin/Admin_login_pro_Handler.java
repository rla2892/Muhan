package handler.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.admin.Admin_Dao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_login_pro_Handler implements CommandHandler {
	
	@Resource
	private Admin_Dao admin_dao;
	
	@RequestMapping("/Admin_login_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String id = request.getParameter( "id" );
		String passwd = request.getParameter( "passwd" );
		
		int result = admin_dao.check(id, passwd);
		
		request.setAttribute( "result", result );
		request.setAttribute( "id", id );
		
		
		return new ModelAndView("admin/admin_login_pro");
	}

}
