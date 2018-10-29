package handler.cus.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
@Controller
public class Cus_Join_Handler implements CommandHandler{
	
	@Override
	@RequestMapping("cus_join")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String result="회원 가입 페이지입니다.";
		request.setAttribute("result", result);
		return new ModelAndView("/cus/cus_member/cus_join");
	}
}
