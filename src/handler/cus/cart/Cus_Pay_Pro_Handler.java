package handler.cus.cart;

import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.customer_member.Customer_member_Dao;
import db.customer_member.Customer_member_DataBean;
import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean;
import db.order_history.Order_history_DataBean_for_recieve;
import handler.CommandHandler;
import handler.HandlerException;
@Controller
public class Cus_Pay_Pro_Handler implements CommandHandler{
	
	@Resource
	private Order_history_Dao order_hisotry_dao;
	
	@Resource
	private Customer_member_Dao customer_member_dao;
	
	@RequestMapping("cus_pay_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		//필수 정보 cus_id, store_id, menu_id들, qnt들 (insert 문) + order_no + order_date
		//부가기능 정보(주소 업데이트) cus_id, address, address2

		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		Order_history_DataBean_for_recieve order_history_dto = new Order_history_DataBean_for_recieve();
		
		//order_no
		int order_no = order_hisotry_dao.getMaxOrder_no()+1; //주문번호
		order_history_dto.setOrder_no(order_no);
		System.out.println(order_no);
		
		//order_date
		Timestamp order_date = new Timestamp( System.currentTimeMillis() ); //주문날짜
		order_history_dto.setOrder_date(order_date);
		
		//cus_id
		String cus_id = request.getParameter("cus_id");
		order_history_dto.setCus_id(cus_id);
		System.out.println(cus_id);
		
		//store_id
		String store_id = request.getParameter("store_id");
		order_history_dto.setStore_id(store_id);
		System.out.println(store_id);
		
		//cus_address
		String cus_address = request.getParameter("cus_address");
		String cus_address2 = request.getParameter("cus_address2");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cus_id", cus_id);
		map.put("cus_address", cus_address);
		map.put("cus_address2", cus_address2);
		
		customer_member_dao.updateCus_address(map);
		
		//menu_id들 + qnt들
		String menu_ids[] =request.getParameterValues("menu_id");
		String order_qnts[] =request.getParameterValues("order_qnt");
		for(int i=0; i<menu_ids.length; i++) {
			int menu_id = Integer.parseInt(menu_ids[i]);
			int order_qnt = Integer.parseInt(order_qnts[i]);
			System.out.println(menu_id+" : "+order_qnt);
			
			order_history_dto.setMenu_id(menu_id);
			order_history_dto.setOrder_qnt(order_qnt);
			
			order_hisotry_dao.insertOrder(order_history_dto);
		}
		
		
		FileWriter fw;
		String new_order_log="";
		try {
			fw = new FileWriter("C:/home/encore/flume/spool/out.txt");
			new_order_log+=order_no;
			new_order_log+=",";
			new_order_log+=order_date.getYear()+1900;
			new_order_log+=",";
			new_order_log+=order_date.getMonth()+1;
			new_order_log+=",";
			new_order_log+=order_date.getDate();
			new_order_log+=",";
			new_order_log+=order_date.getHours();
			new_order_log+=",";
			new_order_log+=order_date.getMinutes();
			new_order_log+=",";
			new_order_log+=order_date.getSeconds();
			
			Customer_member_DataBean cus_member_dto = customer_member_dao.selectCustomer(cus_id);
			int cus_age = order_date.getYear()-cus_member_dto.getCus_birth().getYear();
			System.out.println(order_date.getYear());
			System.out.println(cus_member_dto.getCus_birth().getYear());
			new_order_log+=",";
			new_order_log+=cus_age;
			
			fw.write(new_order_log);
			System.out.println("파일출력성공");
			fw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new ModelAndView("cus/cus_cart/cus_pay_pro");
	}

}
