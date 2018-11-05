package handler.admin.order;

import java.util.ArrayList;
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
import db.store_member.Store_member_Dao;
import db.store_member.Store_member_DataBean;
import db.store_member.Store_member_DataBean_for_sales;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_order_graph_store implements CommandHandler{
	@Resource
	private Order_history_Dao order_history_dao;
	
	@Resource
	private Store_member_Dao store_member_dao;
	
	@Resource
	private Menu_Dao menu_dao;
	
	@RequestMapping("/Admin_order_graph_store")
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
		
		//모든 스토어 불러오기
		List<Store_member_DataBean> store_member_dtos = store_member_dao.selectStoresAll();
		//System.out.println(store_member_dtos.size());
		
		//데이터 만들기 위한 맵 만들기 <매장, 매출액>
		//Map<String,Integer> store_sales = new HashMap<String,Integer>();
		List<Store_member_DataBean_for_sales> store_sales = new ArrayList<Store_member_DataBean_for_sales>();
		for(int i=0; i<store_member_dtos.size(); i++) {
			Store_member_DataBean_for_sales store_member_dto_for_sale = new Store_member_DataBean_for_sales();
			String store_name = store_member_dtos.get(i).getStore_name();
			String store_id = store_member_dtos.get(i).getStore_id();
			store_member_dto_for_sale.setStore_name(store_name);
			store_member_dto_for_sale.setStore_id(store_id);
			
			int sales=0;
			for(int j=0; j<order_history_dtos.size(); j++) {
				if(store_id.equals( order_history_dtos.get(j).getStore_id() ) ) {
					int menu_price = menu_dao.selectMenu( order_history_dtos.get(j).getMenu_id() ).getMenu_price();
					sales += order_history_dtos.get(j).getOrder_qnt() * menu_price;
				}
			}
			store_member_dto_for_sale.setStore_sale(sales);
			
			store_sales.add(store_member_dto_for_sale);
			//store_sales.set(i, store_member_dto_for_sale);
		}
		//System.out.println(store_sales.size());
		request.setAttribute("store_sales", store_sales);
		return new ModelAndView("admin/admin_order/admin_order_graph_store");
	}

}
