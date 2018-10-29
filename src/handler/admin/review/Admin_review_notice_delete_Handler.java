package handler.admin.review;

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
public class Admin_review_notice_delete_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao review_dao;
	
	@RequestMapping("/Admin_review_notice_delete")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		int result = review_dao.deleteNotice(notice_no);
		request.setAttribute("result", result);
		
		return new ModelAndView("admin/admin_review/admin_review_notice_delete");
	}
}
