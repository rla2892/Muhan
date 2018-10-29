package handler.store;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.store_member.Store_member_Dao;
import db.store_member.Store_member_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Store_login_pro_Handler implements CommandHandler {
	@Resource
	private Store_member_Dao store_member_dao;
	
	@RequestMapping("/Store_login_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String store_id = request.getParameter("store_id");
		String store_pw = request.getParameter("store_pw");
		
		int result = store_member_dao.check( store_id, store_pw );
		
		request.setAttribute("result", result);
		request.setAttribute("store_id", store_id);
		
		Store_member_DataBean store_member_dto = store_member_dao.selectStore(store_id);
		
		request.setAttribute("store_member_dto", store_member_dto);
		
		
		return new ModelAndView("store/store_login_pro");
	}

}
