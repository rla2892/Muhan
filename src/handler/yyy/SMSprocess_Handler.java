package handler.yyy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class SMSprocess_Handler implements CommandHandler{
	
	@RequestMapping("/SMSprocess")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		request.setAttribute("action", "go");//그냥 go를 해야 문자가 보내짐
		request.setAttribute("msg", "주문이 접수됐습니다.");//문자 내용
		request.setAttribute("rphone", "010-8527-8929");//받는 사람 전화번호
		//request.setAttribute("testflag", "");//진짜 문자 보내면 안쓰고, 시험용 문자는 Y
		//request.setAttribute("testflag", "Y");//진짜 문자 보내면 안쓰고, 시험용 문자는 Y
		
		return new ModelAndView( "yyy/SMSprocess" );
	}
}
