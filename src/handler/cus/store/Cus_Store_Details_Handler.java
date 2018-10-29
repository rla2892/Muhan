package handler.cus.store;



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
public class Cus_Store_Details_Handler implements CommandHandler{
	@Resource
		private Store_member_Dao dao;
	@RequestMapping("cus_store_details")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		
		String store_id=request.getParameter("store_id");
	
		
		Store_member_DataBean std=dao.selectStore(store_id);
		
		request.setAttribute("std",std );
		
	
		
		return new ModelAndView("/cus/cus_store/cus_store_details");
	}

}

