package handler.admin.store;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import db.store_member.Store_member_Dao;
import db.store_member.Store_member_DataBean;
import db.store_member.Store_member_age;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Admin_store_detail_Handler implements CommandHandler {
	
	@Resource
	private Store_member_Dao store_member_dao;
	
	@RequestMapping("/Admin_store_detail")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String store_id = request.getParameter("store_id");
		System.out.println(store_id);
		Store_member_DataBean store_member_dto = store_member_dao.selectStore(store_id);
		List<String> age_sujm = store_member_dao.selectCustomer_age(store_id);
		/*Store_member_age Store_member_age_dto = store_member_dao.selectStore_age();
		System.out.println(Store_member_age_dto);*/
		double count_10=(double)0;
		double count_20=(double)0;
		double count_30=(double)0;
		double count_40=(double)0;
	    double count_50=(double)0;
	    double count_60=(double)0; 
	    
		for(String str : age_sujm){
			String result = str.substring(0, 4);
			Calendar current = Calendar.getInstance();
        	int currentYear  = current.get(Calendar.YEAR);
        	int age = currentYear - Integer.parseInt(result);
        	int dae=0;
        	if(age>=10 && age<20 ){
        		dae = 10;
        	}else if (age>=20 && age<30) {
        		dae=20;
        	}else if(age>=30 && age<40) {
        		dae=30; 
        	}else if(age>=40 && age<50) {
        		dae=40;
        	}else if(age>=50 && age<60) {
        		dae=50;
        	}else {
        		dae=60;
        	}
        	
        	if(dae ==10 ) {
        		count_10+=1;
        	}else if(dae==20){
        		count_20+=1;
        	}else if(dae==30) {
                count_30+=1;
            }else if(dae==40) {
                count_40+=1;
            }else if(dae== 50){
                count_50+=1;
            }else {
            	count_60+=1;
            }
        	request.setAttribute("dae", dae);
		}
		
		double count_all = (double)count_10+count_20+count_30+count_40+count_50+count_60;
		double count_ages1 =Math.round((double) (count_10/count_all)*100)/100.0;
		double count_ages2 =Math.round((double) (count_20/count_all)*100)/100.0;
        double count_ages3 =Math.round((double) (count_30/count_all)*100)/100.0;
        double count_ages4 =Math.round((double) (count_40/count_all)*100)/100.0;
        double count_ages5 =Math.round((double) (count_50/count_all)*100)/100.0;
        double count_ages6 =Math.round((double) (count_60/count_all)*100)/100.0;
        
        request.setAttribute("count_ages1", count_ages1);
        request.setAttribute("count_ages2", count_ages2);
        request.setAttribute("count_ages3", count_ages3);
        request.setAttribute("count_ages4", count_ages4);
        request.setAttribute("count_ages5", count_ages5);
        request.setAttribute("count_ages6", count_ages6);
        
		request.setAttribute("store_member_dto", store_member_dto);
		
		return new ModelAndView("admin/admin_store/admin_store_detail");
	}

}
