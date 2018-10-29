package handler.cus.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import db.customer_member.Customer_member_Dao;


@Controller
public class Cus_ajax_idcheck_Handler{
	
	@Resource
	private Customer_member_Dao customer_member_dao;
	
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestBody String cus_id) {
		cus_id = cus_id.split("=")[0];
		int countId = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		countId = customer_member_dao.check(cus_id);
		map.put("countId", countId);

		return map;
	}
}
