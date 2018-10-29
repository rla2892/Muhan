package handler.cus.review;

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
public class Cus_My_review_list_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao reviewDao;
	
	@Override
	@RequestMapping("/cus_my_review_list")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String cus_id=(String)request.getSession().getAttribute("cus_id");
		
		int pageSize=7; // 고정값
		int pageBlock=3;
		
		int count=0;
		int start=0;
		int end=0;
		
		String pageNum=null;
		int currentPage=0;
		int number=0;
		
		int startPage=0;
		int endPage=0;
		int pageCount=0;
		
		Map<String, String> idMap=new HashMap<String, String>();
		idMap.put("cus_id", cus_id);
		
		count=reviewDao.getMyReviewCount(idMap);
		pageNum=request.getParameter("pageNum");
		
		if(pageNum==null || pageNum.equals("")) {
			pageNum="1";
		}
		
		currentPage=Integer.parseInt(pageNum);
		pageCount=count/pageSize+(count%pageSize>0? 1:0);
		
		if(currentPage>pageCount) {
			currentPage=pageCount;
		}
		
		start=(currentPage-1)*pageSize+1;
		end=start+pageSize-1;
		
		if(end>count) {
			end=count;
		}
		
		number=count-(currentPage-1)*pageSize;
		startPage=(currentPage/pageBlock)*pageBlock+1;
		
		if(currentPage%pageBlock==0) {
			startPage-=pageBlock;
		}
		
		endPage=startPage+pageBlock-1;
		
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("number", number);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("cus_id", cus_id);
		
		if(count>0) {
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("cus_id", cus_id);
			map.put("start", start);
			map.put("end", end);
		
			List<Review_DataBean> articles=reviewDao.selectMyReviews(map);
			request.setAttribute("articles", articles);
		}
		
		return new ModelAndView("/cus/cus_review/cus_my_review_list");
	}
}