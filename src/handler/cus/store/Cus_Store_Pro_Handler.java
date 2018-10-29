package handler.cus.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class Cus_Store_Pro_Handler implements CommandHandler{
	@Resource
		private   Store_member_Dao dao;
	@RequestMapping("cus_store_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		Map<String,String> map1 =new  HashMap<String,String>();
		map1.put("keyword", request.getParameter("keyword"));
		map1.put("keyword1", request.getParameter("keyword1"));
		
		List<Store_member_DataBean> selectStoresByText = dao.selectStoresByText(map1);
		request.setAttribute("selectStoresByText", selectStoresByText);
		

		return new ModelAndView("cus/cus_store/cus_store_pro");
	}

}
