package handler.cus.menu;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import db.menu.Menu_Dao;
import db.menu.Menu_DataBean;
import db.menu.Recommended_Menu_DataBean;
import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Recommendation_Handler implements CommandHandler {
	@Resource
	private Menu_Dao menuDao;
	@Resource
	private Order_history_Dao order_history_dao;
	
	@RequestMapping("/cus_recommendation")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		return new ModelAndView("/cus/cus_menu/cus_recommendation");
	}
	
	@RequestMapping(value = "/cus_checkRecommended", method=RequestMethod.GET)
    public @ResponseBody
    String checkRecommended(HttpServletRequest request, HttpServletResponse response) {
		String result = "";
		String cus_id = (String)request.getSession().getAttribute("cus_id");
		Map<String, String> map = new HashMap<>();
		map.put("cus_id", cus_id);
		List<Order_history_DataBean> nullCheck = order_history_dao.selectOrdersByCus(map);
		if(! nullCheck.isEmpty()) {
			String check = menuDao.selectRecommended(cus_id);
			if( check == null ) {
				String menu_result="";
				
				List<String> command = new ArrayList<String>();
				command.add("python");
				command.add("C:\\ExpertJava\\Muhan\\Muhan\\WebContent\\cus\\cus_menu\\recommend.py");
				command.add(cus_id);
				ProcessBuilder pb = new ProcessBuilder(command).inheritIO();
				pb.redirectErrorStream(true);
				pb.redirectOutput(ProcessBuilder.Redirect.PIPE);

				try {
					Process p = pb.start();
					p.waitFor();
					BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));
					menu_result = bfr.readLine();
					menu_result = menu_result.replace("[", "");
					menu_result = menu_result.replace("]", "");
					System.out.println("result : " + menu_result);
					bfr.close();
					p.destroy();
					Recommended_Menu_DataBean recDto = new Recommended_Menu_DataBean();
					recDto.setCus_id(cus_id);
					recDto.setMenu_result(menu_result);
					int insertCheck = 0;
					insertCheck = menuDao.insertRecommended(recDto);
					System.out.println(insertCheck);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
				String[] raw_menu = menu_result.split(" ");
				raw_menu = Arrays.stream(raw_menu).filter(s -> (s !=null && s.length() >0)).toArray(String[]::new);
				List<Menu_DataBean> menus = new ArrayList<>();
				for(int i=0; i<raw_menu.length; i++) {
					menus.add(menuDao.selectMenu(Integer.parseInt(raw_menu[i])));
				}
				Gson gsonBuilder = new GsonBuilder().create();
				result = gsonBuilder.toJson(menus);	

			} else {
				String[] raw_menu = check.split(" ");
				raw_menu = Arrays.stream(raw_menu).filter(s -> (s !=null && s.length() >0)).toArray(String[]::new);
				System.out.println("저장된 결과 : " + raw_menu);
				List<Menu_DataBean> menus = new ArrayList<>();
				for(int i=0; i<raw_menu.length; i++) {
					menus.add(menuDao.selectMenu(Integer.parseInt(raw_menu[i])));
				}
				Gson gsonBuilder = new GsonBuilder().create();
				result = gsonBuilder.toJson(menus);
			}
		} else {
			result = "주문이력없음";
		}
		
        return result;
    }
}
