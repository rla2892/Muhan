package handler.cus.review;

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
public class Cus_Content_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao reviewDao;
	
	@Override
	@RequestMapping("/cus_content")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int contentType=Integer.parseInt(request.getParameter("contentType"));
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		
		if(contentType==0) {
			int review_no=Integer.parseInt(request.getParameter("content_no"));
			int number=Integer.parseInt(request.getParameter("number"));
			
			reviewDao.addHits(review_no);
			Review_DataBean review=reviewDao.selectReview(review_no);
			
			request.setAttribute("content", review);
			request.setAttribute("number", number);
			
		} else if(contentType==1){
			
			int notice_no=Integer.parseInt(request.getParameter("content_no"));
			
			reviewDao.addHitsNotice(notice_no);
			Notice_DataBean notice=reviewDao.selectNotice(notice_no);
			
			request.setAttribute("content", notice);
			
		}

		request.setAttribute("contentType", contentType);
		request.setAttribute("pageNum", pageNum);
		
		return new ModelAndView("/cus/cus_review/cus_content");
	}
}
