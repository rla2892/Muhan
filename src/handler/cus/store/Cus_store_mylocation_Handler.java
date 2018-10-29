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
import db.store_member.Store_member_coords_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_store_mylocation_Handler implements CommandHandler{
	
	@Resource
	private Store_member_Dao store_member_dao;
	
	@RequestMapping("/Cus_store_mylocation")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		Map<String, Object> map = new HashMap<String,Object>();
		List<Store_member_coords_DataBean> store_member_dtos = store_member_dao.selectStoresWithCoords(map);
		request.setAttribute("store_member_dtos", store_member_dtos);
		
		return new ModelAndView("cus/cus_store/cus_store_mylocation");
	}
}
