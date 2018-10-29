package handler.admin.customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.customer_member.Customer_member_Dao;
import db.customer_member.Customer_member_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_customer_find_Handler implements CommandHandler {
	
	@Resource
	private Customer_member_Dao customer_member_dao;
	
	@RequestMapping("/Admin_customer_find")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String location1 = request.getParameter("location1");
		String locationKeyword ="";
		
		if(location1==null || "".equals(location1)) {
			location1="0";
		}
		
		request.setAttribute("location1", location1);
		
		int pageSize = 10;
		int pageBlock = 3;

		int count = 0;
		int start = 0;
		int end = 0;
		String pageNum = null;
		int currentPage = 0;
		int number = 0;
		
		int startPage = 0;
		int endPage = 0;
		int pageCount = 0;		
		
		
		if(location1=="0") {
			count = customer_member_dao.getCount();
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
			count = customer_member_dao.getCountByAddress(locationKeyword);
			System.out.println(count);
		}
		
		pageNum = request.getParameter("pageNum");
		if(pageNum==null || pageNum.equals("")){
			pageNum = "1";
		}	
		currentPage = Integer.parseInt(pageNum);
		pageCount = count/pageSize + (count % pageSize>0 ? 1:0 );
		if( currentPage > pageCount ) currentPage = pageCount;
			
		start = ( currentPage - 1 )*pageSize + 1;					// (5-1)*10 +1   =41
		end = start + pageSize - 1;									// 41+10-1		 =50
		if(end > count) end = count;
		
		number = count - (currentPage - 1) * pageSize;				//	50-(5-1)*10 
			
		startPage = (currentPage / pageBlock)*pageBlock+1;  		//(5/10)*10+1 = 1
		if(currentPage % pageBlock == 0) startPage-=pageBlock;
		endPage =startPage + pageBlock - 1;							//11+10-1	=20
		if(endPage > pageCount ) endPage = pageCount;
		
		request.setAttribute( "count", count );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "currentPage", currentPage );
		request.setAttribute( "number", number );
		request.setAttribute( "startPage", startPage );
		request.setAttribute( "endPage", endPage );
		request.setAttribute( "pageCount", pageCount );
		request.setAttribute( "pageBlock", pageBlock );
		
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put( "start", start );
		map.put( "end", end );
		
		List<Customer_member_DataBean> customers;
		
		if(location1=="0") {
			customers = customer_member_dao.selectCustomers2(map);
		}else {
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put( "start", start );
			map2.put( "end", end );
			map2.put( "keyword", locationKeyword);
			System.out.println(locationKeyword);
			customers = customer_member_dao.selectCustomersByAddress(map2);
		}
		request.setAttribute("customers", customers);
		
		List<Integer> reports = new ArrayList<Integer>();
		for(int i=0; i<customers.size(); i++) {
			reports.add( customer_member_dao.countReport(customers.get(i).getCus_id() ) );
		}
		System.out.println(customers.size());
		request.setAttribute("reports", reports);
		
		return new ModelAndView("admin/admin_customer/admin_customer_find");
	}

}
