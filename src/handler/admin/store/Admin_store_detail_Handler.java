package handler.admin.store;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.customer_member.Customer_member_DataBean;
import db.store_member.Store_member_Dao;
import db.store_member.Store_member_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_store_detail_Handler implements CommandHandler {
	
	@Resource
	private Store_member_Dao store_member_dao;
	
	@RequestMapping("/Admin_store_detail")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String store_id = request.getParameter("store_id");
		System.out.println(store_id);
		Store_member_DataBean store_member_dto = store_member_dao.selectStore(store_id);
		System.out.println(store_member_dto);
		List<String> age_sujm = store_member_dao.selectCustomer_age(store_id);
		System.out.println(age_sujm);
		
		for(int i=0; i<age_sujm.size(); i++) {
			String str = age_sujm.get(i);
			String[] reuslt = str.split("-");
			System.out.println(reuslt);
			Calendar current = Calendar.getInstance();
//        	int currentYear  = current.get(Calendar.YEAR);
//        	int age = currentYear - str.getYear()+1900;
		}
		request.setAttribute("store_member_dto", store_member_dto);
		
		return new ModelAndView("admin/admin_store/admin_store_detail");
	}

}
