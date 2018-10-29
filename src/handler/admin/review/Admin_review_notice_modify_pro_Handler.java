package handler.admin.review;

import java.io.UnsupportedEncodingException;

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
public class Admin_review_notice_modify_pro_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao review_dao;
	
	@RequestMapping("/Admin_review_notice_modify_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		Notice_DataBean notice_dto = review_dao.selectNotice(notice_no);
		notice_dto.setNotice_subject(request.getParameter("notice_subject"));
		notice_dto.setNotice_content(request.getParameter("notice_content"));
		int result = review_dao.modifyNotice(notice_dto);
		request.setAttribute("result", result);
		
		return new ModelAndView("admin/admin_review/admin_review_notice_modify_pro");
	}
}
