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
public class Cus_Store_Handler implements CommandHandler {
	@Resource
	private Store_member_Dao dao;
	
	@RequestMapping("cus_store")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String keyword=null;
		String keyword1=null;
		keyword = request.getParameter("keyword");//매장이름
		keyword1 = request.getParameter("keyword1");//동이름

		//System.out.println("매장 :"+keyword);
		//System.out.println("동 :"+keyword1);
	
		int pageSize = 20;
		int pageBlock = 10;

		int count = 0;
		int start = 0;
		int end = 0;
		String pageNum = null;
		int currentPage = 0;
		int number = 0;
		
		int startPage = 0;
		int endPage = 0;
		int pageCount = 0;		
		
		//count=dao.getCount();
		System.out.println("-------");
		if((keyword==null && keyword1==null)||("".equals(keyword) && "".equals(keyword1)) ) {
			//검색 없음
			System.out.println("검색 없음");
			count=dao.getCount();
		}else{
			if(keyword != null && !("".equals(keyword))) {
				//매장검색
				System.out.println("매장검색");
				count=dao.getCountByName(keyword);
			}else {
				//주소검색
				System.out.println("주소검색");
				count=dao.getCountByText(keyword1);
			}
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
		
		pageCount = count/pageSize + (count % pageSize>0 ? 1:0 );
		startPage = (currentPage / pageBlock)*pageBlock+1;  		//(5/10)*10+1 = 1
		if(currentPage % pageBlock == 0) startPage-=pageBlock;
		endPage =startPage + pageBlock - 1;							//11+10-1	=20
		if(endPage > pageCount ) endPage = pageCount;
		
		
		if(count>0) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "start", start);
		map.put( "end", end);
		
		//map.put("keyword1", keyword1);
		
		//selectStomers2= dao.selectStores2(map2);
		List<Store_member_DataBean> selectStomers2;
		
		System.out.println("--데이터빈--");
		if((keyword==null && keyword1==null)||("".equals(keyword) && "".equals(keyword1)) ) {
			//검색 없음
			System.out.println("검색없음2");
			selectStomers2= dao.selectStores2(map);
		}else{
			if(keyword != null && !("".equals(keyword))) {
				//매장검색
				System.out.println("매장검색2");
				map.put("keyword", keyword);
				selectStomers2= dao.selectStoresByName(map);
			}else {
				//주소검색
				System.out.println("주소검색2");
				map.put("keyword", keyword1);
				selectStomers2= dao.selectStoresByText3(map);
			}
		}
		
		request.setAttribute("selectStomers2", selectStomers2);
		}
		
		
		request.setAttribute( "count", count );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "currentPage", currentPage );
		request.setAttribute( "number", number );
		request.setAttribute( "startPage", startPage );
		request.setAttribute( "endPage", endPage );
		request.setAttribute( "pageCount", pageCount );
		request.setAttribute( "pageBlock", pageBlock );

		request.setAttribute( "keyword", request.getParameter("keyword"));
		request.setAttribute( "keyword1", request.getParameter("keyword1"));

		return new ModelAndView("cus/cus_store/cus_store");
	}

}
