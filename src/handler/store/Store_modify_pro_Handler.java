package handler.store;

import java.io.UnsupportedEncodingException;

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
public class Store_modify_pro_Handler implements CommandHandler {
	@Resource
	private Store_member_Dao store_member_dao;
	@RequestMapping("/Store_modify_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Store_member_DataBean store_member_dto = new Store_member_DataBean();
		
		store_member_dto.setStore_id((String)request.getSession().getAttribute("store_id"));
		store_member_dto.setStore_pw(request.getParameter("store_pw"));
		store_member_dto.setStore_address(request.getParameter("store_address"));
		store_member_dto.setStore_name((String)request.getSession().getAttribute("store_name"));
		store_member_dto.setStore_tel(request.getParameter("store_tel"));
		
		String owner_name = request.getParameter("owner_name");
		store_member_dto.setOwner_name(owner_name);
		
		String owner_tel = request.getParameter("owner_tel");
		store_member_dto.setOwner_tel(owner_tel);
		
		String owner_email = request.getParameter("owner_email");
		store_member_dto.setOwner_email(owner_email);
		
		int result = store_member_dao.modifyStore(store_member_dto);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("store/store_modify_pro");
	}
}
