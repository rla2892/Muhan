package handler.admin.review;

import java.io.UnsupportedEncodingException;

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
public class Admin_review_modify_pro_Handler implements CommandHandler {
	
	@Resource
	private Review_Dao review_dao;
	
	@RequestMapping("/Admin_review_modify_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		
		Review_DataBean review_dto = review_dao.selectReview(review_no);
		review_dto.setReview_subject(request.getParameter("review_subject"));
		review_dto.setReview_content(request.getParameter("review_content"));
		review_dto.setReview_image(request.getParameter("review_image"));
		review_dto.setReview_score(Integer.parseInt(request.getParameter("review_score")));

		System.out.println(request.getParameter("review_content"));
		
		int result = review_dao.modifyReview(review_dto);
		request.setAttribute("result", result);
		
		
		return new ModelAndView("admin/admin_review/admin_review_modify_pro");
	}

}
