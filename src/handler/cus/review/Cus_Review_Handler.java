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

import db.review.Notice_DataBean;
import db.review.Review_Dao;
import db.review.Review_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Review_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao reviewDao;
	
	@Override
	@RequestMapping("/cus_review")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		/*공지사항 수 부터 알아야함*/
		int noticeCount=reviewDao.getNoticeCount();
		
		if(noticeCount>0) {
			Map<String, Integer> noticeMap=new HashMap<String, Integer>();
			noticeMap.put("start", 0);
			noticeMap.put("end", 1); // 별 의미 없는 HashMap. 비워둘 수는 없어서 임의의 값을 넣어줌.
			
			List<Notice_DataBean> notices=reviewDao.selectNotices(noticeMap);
			request.setAttribute("notices", notices);
			request.setAttribute("noticeCount", noticeCount);
		}
		
		/*나머지 일반 리뷰 처리*/
		
		int pageSize=20; // 고정값
		int pageBlock=10;
		
		int count=0;
		int start=0;
		int end=0;
		
		String pageNum=null;
		int currentPage=0;
		int number=0;
		
		int startPage=0;
		int endPage=0;
		int pageCount=0;
		int searched=0;
		
		count=reviewDao.getCount();
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
		//새 부분
		end = start + pageSize - 1;									// 41+10-1		 =50
		if(end > count) end = count;
		//문제 부분
//		int remainingRows=pageSize-noticeCount;
//		
//		if(currentPage==1) {
//			if(remainingRows>count) {
//				end=count;
//			} else {
//				end=remainingRows;
//			}
//			
//		} else {
//			end=start+pageSize-1;
//		
//			if(end>count) {
//				end=count;
//			}
//		}
		
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
		request.setAttribute("searched", searched);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("number", number);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		
		if(count>0) {
			Map<String, Integer> map=new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
		
			List<Review_DataBean> articles=reviewDao.selectReviews(map);
			request.setAttribute("articles", articles);
		}

		return new ModelAndView("/cus/cus_review/cus_review");
	}
}