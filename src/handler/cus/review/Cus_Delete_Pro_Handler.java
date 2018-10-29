package handler.cus.review;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.review.Review_Dao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Delete_Pro_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao reviewDao;
	
	@Override
	@RequestMapping("/cus_delete_pro")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		int review_no=Integer.parseInt(request.getParameter("review_no"));

		int result=reviewDao.deleteReview(review_no);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("/cus/cus_review/cus_delete_pro");
	}
}
