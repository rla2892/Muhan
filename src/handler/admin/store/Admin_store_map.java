package handler.admin.store;

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
public class Admin_store_map implements CommandHandler{
	
	@Resource
	private Store_member_Dao store_member_dao;
	
	@RequestMapping("/Admin_store_map")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String location1 = request.getParameter("location1");
		String locationKeyword ="";
		
		if(location1==null || "".equals(location1)) {
			location1="0";
		}
		
		if(location1=="0") {
		}else {
			
			switch (location1) {
			case "1": 
				locationKeyword="서울";
				break;
			case "2":
				locationKeyword="인천";
				break;
			case "3":
				locationKeyword="경기도";
				break;
			case "4":
				locationKeyword="대전";
				break;
			case "5":
				locationKeyword="세종";
				break;
			case "6":
				locationKeyword="충청";
				break;
			case "7":
				locationKeyword="강원도";
				break;
			case "8":
				locationKeyword="부산";
				break;
			case "9":
				locationKeyword="울산";
				break;
			case "14":
				locationKeyword="대구광역시";
				break;
			case "10":
				locationKeyword="경상";
				break;
			case "11":
				locationKeyword="광주광역시";
				break;
			case "12":
				locationKeyword="전라";
				break;
			case "13":
				locationKeyword="제주";
				break;
			}
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "start", 0 );
		map.put( "end", 2000 );
		
		List <Store_member_DataBean> stores;
		
		if(location1=="0") {
			stores = store_member_dao.selectStores2( map );
		}else {
			map.put("keyword", locationKeyword);
			stores = store_member_dao.selectStoresByText3(map);
		}
		
		request.setAttribute( "stores", stores );
		request.setAttribute( "location1", location1);
		request.setAttribute( "locationKeyword", locationKeyword);
		
		return new ModelAndView("admin/admin_store/admin_store_map");
	}
}
