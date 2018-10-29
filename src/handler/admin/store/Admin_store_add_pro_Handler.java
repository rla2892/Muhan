package handler.admin.store;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.store_member.Store_member_Dao;
import db.store_member.Store_member_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_store_add_pro_Handler implements CommandHandler {
	
	@Resource
	private Store_member_Dao store_member_dao;
	
	@RequestMapping("/Admin_store_add_pro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Store_member_DataBean store_member_dto = new Store_member_DataBean();
		store_member_dto.setStore_id(request.getParameter("store_id"));	//아이디
		store_member_dto.setStore_pw(request.getParameter("store_pw"));	//비밀번호
		store_member_dto.setStore_address(request.getParameter("store_address")); //매장 주소
		store_member_dto.setStore_name(request.getParameter("store_name")); //매장명
		//매장 전화번호
		store_member_dto.setOwner_name(request.getParameter("owner_name"));//점주명
		//점주 전화번호
		//점주 이메일
		//가입일
		
		//매장 전화번호
		String store_tel = null;
		String store_tel1 = request.getParameter( "store_tel1" );
		String store_tel2 = request.getParameter( "store_tel2" );
		String store_tel3 = request.getParameter( "store_tel3" );
		if( ! store_tel1.equals( "" ) && ! store_tel2.equals( "" ) && ! store_tel3.equals( "" ) ) {
			store_tel = store_tel1 + "-" + store_tel2 + "-" + store_tel3;
		}
		store_member_dto.setStore_tel(store_tel);
		
		//점주 전화번호
		String owner_tel = null;
		String owner_tel1 = request.getParameter( "owner_tel1" );
		String owner_tel2 = request.getParameter( "owner_tel2" );
		String owner_tel3 = request.getParameter( "owner_tel3" );
		if( ! owner_tel1.equals( "" ) && ! owner_tel2.equals( "" ) && ! owner_tel3.equals( "" ) ) {
			owner_tel = owner_tel1 + "-" + owner_tel2 + "-" + owner_tel3;
		}
		store_member_dto.setOwner_tel(owner_tel);
		
		// 점주이메일
		String owner_email = null;
		String owner_email1 = request.getParameter( "owner_email1" );
		String owner_email2 = request.getParameter( "owner_email2" );
		String owner_email3 = request.getParameter( "owner_email3" );
		if( ! owner_email1.equals( "" ) ) {
			if( owner_email2.equals( "0" ) ) {
				// 직접입력
				owner_email = owner_email1 + "@" + owner_email3; 
			} else {
				// 선택입력
				owner_email = owner_email1 + "@" + owner_email2; 
			}
		}
		store_member_dto.setOwner_email(owner_email);
		
		// 가입일
		store_member_dto.setOwner_reg_date( new Timestamp( System.currentTimeMillis() ) );
		
		int result = store_member_dao.insertStore(store_member_dto);
		
		request.setAttribute("result", result);
		
		//// 끝
		
		//좌표도 넣기
		double store_lat= Double.parseDouble(request.getParameter("store_lat"));
		double store_lon= Double.parseDouble(request.getParameter("store_lon"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("store_id", request.getParameter("store_id"));
		map.put("store_lat", store_lat);
		map.put("store_lon", store_lon);
		int result2 = store_member_dao.insertCoords(map);
		request.setAttribute("result2", result2);
		
		return new ModelAndView("admin/admin_store/admin_store_add_pro");
	}

}
