package handler.admin.review;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.review.Report_DataBean;
import db.review.Review_Dao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_review_report_pro_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao review_dao;
	
	@RequestMapping("/Admin_review_report_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		Report_DataBean report_dto = new Report_DataBean();
		//report_no 는 자동 증가됨
		report_dto.setReview_no(Integer.parseInt(request.getParameter("review_no")));//request 에서 받음
		report_dto.setReport_reason(1);
		report_dto.setCus_id("xxx");//session 에서 미완
		
		int result = review_dao.insertReport(report_dto);
		request.setAttribute("result", result);
		
		return new ModelAndView("admin/admin_review/admin_review_report_pro");
	}
}
