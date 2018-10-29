package handler.admin.store;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.store_member.Store_member_Dao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_store_delete_pro_Handler implements CommandHandler {
	
	@Resource
	private Store_member_Dao store_member_dao;
	
	@RequestMapping("/Admin_store_delete_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String store_id = request.getParameter("store_id");
		
		int result = store_member_dao.deleteStore(store_id);
		request.setAttribute( "result", result );
		
		return new ModelAndView("admin/admin_store/admin_store_delete_pro");
	}

}
