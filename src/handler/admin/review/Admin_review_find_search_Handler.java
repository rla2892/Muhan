package handler.admin.review;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.review.Review_Dao;
import db.review.Review_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_review_find_search_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao review_dao;
	
	@RequestMapping("/Admin_review_find_search")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String keyword = request.getParameter("keyword");
		request.setAttribute("keyword", keyword);
		request.setAttribute("how", request.getParameter("how"));
		
		Map<String, String> map = new HashMap<String, String>();
		map.put( "keyword", keyword );
		
		
		int pageSize = 5;
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
		
		count= review_dao.getCount();
		
		if(Integer.parseInt(request.getParameter("how"))==1) {
			count= review_dao.getSearchBySubjectCount(map);
			
			List<Review_DataBean> reviews = review_dao.searchReviewBySubject(map);
			request.setAttribute("reviews", reviews);
		}else if(Integer.parseInt(request.getParameter("how"))==2) {
			List<Review_DataBean> reviews = review_dao.searchReviewByContent(map);
			request.setAttribute("reviews", reviews);
		}else {
			List<Review_DataBean> reviews = review_dao.searchReviewBySubCon(map);
			request.setAttribute("reviews", reviews);
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
		
		map.put( "start", String.valueOf(start) );
		map.put( "end", String.valueOf(end) );
		
		if(Integer.parseInt(request.getParameter("how"))==1) {
			List<Review_DataBean> reviews = review_dao.searchReviewBySubject(map);
			request.setAttribute("reviews", reviews);
		}else if(Integer.parseInt(request.getParameter("how"))==2) {
			List<Review_DataBean> reviews = review_dao.searchReviewByContent(map);
			request.setAttribute("reviews", reviews);
		}else {
			List<Review_DataBean> reviews = review_dao.searchReviewBySubCon(map);
			request.setAttribute("reviews", reviews);
		}
		
		
		
		return new ModelAndView("admin/admin_review/admin_review_find_search");
	}
}
