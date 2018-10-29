package handler.cus.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Modify_Handler implements CommandHandler{
	
	@Override
	@RequestMapping("cus_modify")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String result="리뷰 수정 페이지 입니다";
		request.setAttribute("result", result);
		return new ModelAndView("/cus/cus_review/cus_modify");
	}
}