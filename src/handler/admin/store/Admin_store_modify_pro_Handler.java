package handler.admin.store;

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
public class Admin_store_modify_pro_Handler implements CommandHandler {
	
	@Resource
	private Store_member_Dao store_member_dao;
	
	@RequestMapping("/Admin_store_modify_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String store_id = request.getParameter("store_id");
		
		Store_member_DataBean store_member_dto = store_member_dao.selectStore(store_id);
		store_member_dto.setStore_pw(request.getParameter("store_pw"));
		store_member_dto.setStore_address(request.getParameter("store_address"));
		store_member_dto.setStore_name(request.getParameter("store_name"));
		
		String store_tel = null;
		String store_tel1 = request.getParameter( "store_tel1" );
		String store_tel2 = request.getParameter( "store_tel2" );
		String store_tel3 = request.getParameter( "store_tel3" );
		if( ! store_tel1.equals( "" ) && ! store_tel2.equals( "" ) && ! store_tel3.equals( "" ) ) {
			store_tel = store_tel1 + "-" + store_tel2 + "-" + store_tel3;
		}
		store_member_dto.setStore_tel(store_tel);
		
		
		store_member_dto.setOwner_name(request.getParameter("owner_name"));
		
		String owner_tel = null;
		String owner_tel1 = request.getParameter( "owner_tel1" );
		String owner_tel2 = request.getParameter( "owner_tel2" );
		String owner_tel3 = request.getParameter( "owner_tel3" );
		if( ! owner_tel1.equals( "" ) && ! owner_tel2.equals( "" ) && ! owner_tel3.equals( "" ) ) {
			owner_tel = owner_tel1 + "-" + owner_tel2 + "-" + owner_tel3;
		}
		store_member_dto.setOwner_tel(owner_tel);
		
		store_member_dto.setOwner_email(request.getParameter("owner_email"));
		
		int result = store_member_dao.modifyStore(store_member_dto);
		request.setAttribute("result", result);
		
		return new ModelAndView("admin/admin_store/admin_store_modify_pro");
	}

}
