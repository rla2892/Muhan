package handler.admin.review;

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
public class Admin_review_detail_Handler implements CommandHandler {
	
	@Resource
	private Review_Dao review_dao;
	
	@RequestMapping("/Admin_review_detail")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int review_no = Integer.parseInt( request.getParameter("review_no") );
		Review_DataBean review_dto = review_dao.selectReview(review_no);
		request.setAttribute("review_dto", review_dto);
		
		review_dao.addHits(review_no);
		
		int countReport = review_dao.countReport(review_no);
		request.setAttribute("countReport", countReport);
		return new ModelAndView("admin/admin_review/admin_review_detail");
	}

}
