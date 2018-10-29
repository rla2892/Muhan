package handler.cus.review;

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
public class Cus_Report_Pro_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao reviewDao;
	
	@Override
	@RequestMapping("/cus_report_pro")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		int review_no=Integer.parseInt(request.getParameter("review_no"));
		int report_reason=Integer.parseInt(request.getParameter("report_reason"));
		String cus_id=request.getParameter("cus_id");
		
		Report_DataBean report_dto=new Report_DataBean();
		report_dto.setReview_no(review_no);
		report_dto.setReport_reason(report_reason);
		report_dto.setCus_id(cus_id);
		
		int result=reviewDao.insertReport(report_dto);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("/cus/cus_review/cus_report_pro");
	}
}