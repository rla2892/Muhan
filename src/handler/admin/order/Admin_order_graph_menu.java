package handler.admin.order;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.menu.Menu_Dao;
import db.menu.Menu_DataBean;
import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean_for_recieve;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_order_graph_menu implements CommandHandler{
	
	@Resource
	private Order_history_Dao order_history_dao;
	
	@Resource
	private Menu_Dao menu_dao;
	
	@RequestMapping("/Admin_order_graph_menu")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//금일, 이번달, 이번해
		//1 금일-시간별
		//2 이번달-일별
		//3 이번해-월별
		//4 전체-연도별
		int time_scale;
		if(  request.getParameter("time_scale") != null) {
			time_scale=Integer.parseInt(request.getParameter("time_scale"));
		}else {
			time_scale=1;
		}
		//오늘날짜
		Calendar today = Calendar.getInstance();
		int this_year = today.get(Calendar.YEAR);
		
		//all 모든 주문 불러오기
		List<Order_history_DataBean_for_recieve> order_history_dtos;
		switch(time_scale) {
		case 1: order_history_dtos=order_history_dao.selectOrdersAllToday();//오늘, 시간별
				break;
		case 2: order_history_dtos=order_history_dao.selectOrdersAllMonth();//이번달, 일별
				break;
		case 3: order_history_dtos=order_history_dao.selectOrdersAllYear();//이번해, 월별
				break;
		case 4: order_history_dtos=order_history_dao.selectOrdersAll();//모든, 연도별
				break;
		default:order_history_dtos=order_history_dao.selectOrdersAllToday();
				break;
		}
		
		//모든 메뉴 불러오기
		List<Menu_DataBean> menu_dtos = menu_dao.selectMenus();
		
		//데이터 만들기 위한 맵 만들기 <시간, 매출액>
		Map<String,Integer> menu_sales = new HashMap<String,Integer>();
		for(int i=0; i<menu_dtos.size(); i++) {
			String menu_name = menu_dtos.get(i).getMenu_name();
			int menu_id = menu_dtos.get(i).getMenu_id();
			int menu_price = menu_dtos.get(i).getMenu_price();
			int sales=0;
			for(int j=0; j<order_history_dtos.size(); j++) {
				if(menu_id == order_history_dtos.get(j).getMenu_id()) {
					sales += order_history_dtos.get(j).getOrder_qnt() * menu_price;
				}
			}
			
			menu_sales.put(menu_name , sales);
		}
		System.out.println(menu_sales.size());
		request.setAttribute("menu_sales", menu_sales);
		return new ModelAndView("admin/admin_order/admin_order_graph_menu");
	}
}
