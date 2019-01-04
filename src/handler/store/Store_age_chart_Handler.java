package handler.store;

import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
public class Store_age_chart_Handler implements CommandHandler{
	@Resource
	private Store_member_Dao store_member_dao;
	@RequestMapping("/Store_age_chart")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String store_id = (String)request.getSession().getAttribute("store_id");
		Store_member_DataBean store_member_dto = store_member_dao.selectStore(store_id);
		List<String> age_sujm = store_member_dao.selectCustomer_age(store_id);
		List<Store_member_age> Store_member_age_dto = store_member_dao.selectStore_age();
			
		double count_20=(double)0;				//소수점 계산을위해 더블처리
		double count_30=(double)0;
		double count_40=(double)0;
	    double count_50=(double)0;
	    double count_60=(double)0; 
	    
		for(String str : age_sujm){
			String result = str.substring(0, 4);	//생년 가져오기
			Calendar current = Calendar.getInstance();	//현재 날짜
        	int currentYear  = current.get(Calendar.YEAR);	//현재 년도
        	int age = currentYear - Integer.parseInt(result);	//현재년도 - 사용자 생년  = 현재 나이
        	int dae=0;
        	
        	if (age>=20 && age<30) {		// 20부터 29는 20으로 출력
        		dae=20;
        	}else if(age>=30 && age<40) { 	// 30부터 39는 30으로 출력
        		dae=30; 
        	}else if(age>=40 && age<50) {	// 40부터 49는 40으로 출력
        		dae=40;
        	}else if(age>=50 && age<60) {	// 50부터 59는 50으로 출력
        		dae=50;
        	}else {							// 나머지는 60으로 출력
        		dae=60;
        	}
        	       	
        	if(dae==20){					//20살이 있을때마다 count_20에 1씩 중첩 
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
		}
		
		double count_all = (double)count_20+count_30+count_40+count_50+count_60;
		double count_ages2 =Math.floor((Math.round((double) (count_20/count_all)*100)/100.0)*100);
        double count_ages3 =Math.floor((Math.round((double) (count_30/count_all)*100)/100.0)*100);
        double count_ages4 =Math.floor((Math.round((double) (count_40/count_all)*100)/100.0)*100);
        double count_ages5 =Math.floor((Math.round((double) (count_50/count_all)*100)/100.0)*100);
        double count_ages6 =Math.floor((Math.round((double) (count_60/count_all)*100)/100.0)*100);
        
        Map<Integer, Double> distances = new HashMap<Integer, Double>();
		
		for(int i=0; i<Store_member_age_dto.size(); i++) {
			int store = Store_member_age_dto.get(i).getStore_number();
			String store_a = Store_member_age_dto.get(i).getA();
			String store_b = Store_member_age_dto.get(i).getB();	
			String store_c = Store_member_age_dto.get(i).getC();
			String store_d = Store_member_age_dto.get(i).getD();
			double sum_20 = Math.pow(count_ages2-Double.parseDouble(store_a),2);
		    double sum_30 = Math.pow(count_ages3-Double.parseDouble(store_b),2);
		    double sum_40 = Math.pow(count_ages4-Double.parseDouble(store_c),2);
		    double sum_50_60 = Math.pow((count_ages5+count_ages6)-Double.parseDouble(store_d),2);
		    double sum_root = Math.sqrt(sum_20 + sum_30 + sum_40 + sum_50_60);
		    distances.put(store,sum_root);
		}
		
		Entry<Integer, Double> min = Collections.min(distances.entrySet(),Comparator.comparing(Entry::getValue));
		int sumsum = min.getKey();			//Map의 최소값의 key가져오기 
        request.setAttribute("count_ages2", count_ages2);	//20대
        request.setAttribute("count_ages3", count_ages3);	//30대
        request.setAttribute("count_ages4", count_ages4);	//40대
        request.setAttribute("count_ages5", count_ages5);	//50대
        request.setAttribute("count_ages6", count_ages6);	//60대
        request.setAttribute("sumsum", sumsum);				//최소값의 key
        
		request.setAttribute("store_member_dto", store_member_dto);
		return new ModelAndView("store/store_age_chart");
	}

}
