package handler.cus.member;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.customer_member.Customer_member_Dao;
import db.customer_member.Customer_member_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Join_Pro_Handler implements CommandHandler {
	
	@Resource
	private Customer_member_Dao cusMemberDao;

	@SuppressWarnings("deprecation")
	@Override
	@RequestMapping("/cus_join_pro")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Customer_member_DataBean customer_member_dto = new Customer_member_DataBean();
		customer_member_dto.setCus_id(request.getParameter("id"));	//아이디
		customer_member_dto.setCus_pw(request.getParameter("passwd"));	//비밀번호
		customer_member_dto.setCus_nickname(request.getParameter("cus_nickname")); //매장명
		customer_member_dto.setCus_address(request.getParameter("cus_address")); //매장 주소
		customer_member_dto.setCus_address2(request.getParameter("cus_address2")); //매장 주소
		
		int gender = Integer.parseInt(request.getParameter("gender"));
		customer_member_dto.setCus_gender(gender);
		String birth = request.getParameter("Birth");
		String[] birth_array= birth.split("/");
		int birth_year = Integer.parseInt(birth_array[2]);
		int birth_month =Integer.parseInt(birth_array[0]);
		int birth_date =Integer.parseInt(birth_array[1]);
		
		System.out.println(birth_array[0]);
		System.out.println(birth_array[1]);
		System.out.println(birth_array[2]);
		//System.out.println(bir);
		customer_member_dto.setCus_birth(new Timestamp( birth_year-1900, birth_month-1, birth_date, 0, 0, 0, 0));
		
		
		//매장 전화번호
		String cus_tel = null;
		String cus_tel1 = request.getParameter( "cus_tel1" );
		String cus_tel2 = request.getParameter( "cus_tel2" );
		String cus_tel3 = request.getParameter( "cus_tel3" );
		if( ! cus_tel1.equals( "" ) && ! cus_tel2.equals( "" ) && ! cus_tel3.equals( "" ) ) {
			cus_tel = cus_tel1 + "-" + cus_tel2 + "-" + cus_tel3;
		}
		customer_member_dto.setCus_tel(cus_tel);
		
		
		// 점주이메일
		String cus_email = null;
		String cus_email1 = request.getParameter( "cus_email1" );
		String cus_email2 = request.getParameter( "cus_email2" );
		String cus_email3 = request.getParameter( "cus_email3" );
		if( ! cus_email1.equals( "" ) ) {
			if( cus_email2.equals( "0" ) ) {
				// 직접입력
				cus_email = cus_email1 + "@" + cus_email3; 
			} else {
				// 선택입력
				cus_email = cus_email1 + "@" + cus_email2; 
			}
		}
		customer_member_dto.setCus_email(cus_email);
		
		// 가입일
		customer_member_dto.setCus_reg_date( new Timestamp( System.currentTimeMillis() ) );
		
		int result = cusMemberDao.insertCustomer(customer_member_dto);
		
		request.setAttribute("result", result);

		
		return new ModelAndView("/cus/cus_member/cus_join_pro");
	}

}
