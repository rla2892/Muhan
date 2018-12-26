package handler.cus.menu;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import java.util.ArrayList;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import db.menu.Menu_Dao;
import db.menu.Recommended_Menu_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Recommendation_Handler implements CommandHandler {
	@Resource
	private Menu_Dao menuDao;
	
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
		String check = menuDao.selectRecommended(cus_id);
		if( check == null ) {
			String menu_result="";
			
			List<String> command = new ArrayList<String>();
			command.add("python");
			command.add("C:\\ExpertJava\\Python\\PythonEx\\project\\recommend.py");
			command.add(cus_id);
			ProcessBuilder pb = new ProcessBuilder(command).inheritIO();
			pb.redirectErrorStream(true);
			pb.redirectOutput(ProcessBuilder.Redirect.PIPE);

			try {
				Process p = pb.start();
				p.waitFor();
				BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));
				
				menu_result = bfr.readLine();
				System.out.println("result"+menu_result);
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
				

		} else {
			System.out.println("이미 있음!"+ check);
			
		}
        return result;
    }
}
