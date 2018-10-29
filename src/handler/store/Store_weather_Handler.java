package handler.store;

import java.util.List;

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
public class Store_weather_Handler implements CommandHandler {
	@Resource
	private Store_member_Dao store_member_dao;
	
	@RequestMapping("/Store_weather")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String store_id = (String) request.getSession().getAttribute("store_id");
		
		if(store_id != null) {
			List<Store_member_coords_DataBean> storeLonLat = store_member_dao.selectLonLat(store_id);
			request.setAttribute("storeLonLat", storeLonLat);
		}
		return new ModelAndView("store/store_weather");
	}

}
