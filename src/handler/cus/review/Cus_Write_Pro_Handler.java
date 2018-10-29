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
public class Cus_Write_Pro_Handler implements CommandHandler{
	
	@Resource
	private Review_Dao reviewDao;
	
	@Override
	@RequestMapping("cus_write_pro")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String cus_id=request.getParameter("cus_id");
		String review_content=request.getParameter("review_content");
		int review_no=Integer.parseInt(request.getParameter("review_no"));
		int reply_id=Integer.parseInt(request.getParameter("reply_id"));

		int ref_id=0;
		int re_step=0;
		int re_level=0;

		if(reply_id==0) {
			// 제목글
			ref_id=reviewDao.getMaxRefId()+1;
			re_step=0;
			re_level=0;			
		} else {
/*			ref_id=reviewDao.
			re_step=Integer.parseInt(request.getParameter("re_step"));
			re_level=Integer.parseInt(request.getParameter("re_level"));*/
		}
		
			/*request.setAttribute("ref_id", ref_id);
			request.setAttribute("re_step", re_step);
			request.setAttribute("re_level", re_level);*/
		
		return new ModelAndView("/cus/cus_review/cus_write_pro");
	}
}