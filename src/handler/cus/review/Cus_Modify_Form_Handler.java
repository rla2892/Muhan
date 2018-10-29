package handler.cus.review;

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
public class Cus_Modify_Form_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao review_dao;
	
	@Override
	@RequestMapping("cus_modify_form")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		Review_DataBean review_dto = review_dao.selectReview(review_no);
		request.setAttribute("review_dto", review_dto);
		
		return new ModelAndView("/cus/cus_review/cus_modify_form");
	}
}