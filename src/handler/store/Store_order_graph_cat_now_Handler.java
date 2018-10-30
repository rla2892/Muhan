package handler.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Store_order_graph_cat_now_Handler implements CommandHandler{
	
	@RequestMapping("/Store_order_graph_cat_now")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException{ 	
		//String store_id= (String)request.getSession().getAttribute("store_id");
			
		return new ModelAndView("store/store_order_graph_cat_now");
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
    public String getTodaySales(HttpServletRequest request, HttpServletResponse response) {

		String salesData="";
        return salesData;
    }
}
