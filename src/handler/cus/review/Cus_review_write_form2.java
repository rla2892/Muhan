package handler.cus.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_review_write_form2 implements CommandHandler{
	
	@RequestMapping("Cus_review_write_form2")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int sort =0;
		if( request.getParameter("review_no") == null) {
		}else {
			int review_no = Integer.parseInt(request.getParameter("review_no"));
			sort = Integer.parseInt(request.getParameter("sort"));
			request.setAttribute("review_no", review_no);
			
		}
		request.setAttribute("sort", sort);
		
		return new ModelAndView("/cus/cus_review/cus_review_write_form2");
	}
}
