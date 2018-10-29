package handler.admin.review;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.review.Notice_DataBean;
import db.review.Review_Dao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_review_notice_modify_form_Handler implements CommandHandler{

	@Resource
	private Review_Dao review_dao;
	
	@RequestMapping("/Admin_review_notice_modify_form")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		Notice_DataBean notice_dto = review_dao.selectNotice(notice_no);
		request.setAttribute("notice_dto", notice_dto);
		
		return new ModelAndView("admin/admin_review/admin_review_notice_modify_form");
	}
}
