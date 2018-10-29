package bean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import db.admin.Admin_Dao;
import db.admin.Admin_member_DBBean;
import db.customer_member.Customer_member_DBBean;
import db.customer_member.Customer_member_Dao;
import db.menu.Menu_DBBean;
import db.menu.Menu_Dao;
import db.order_history.Order_history_DBBean;
import db.order_history.Order_history_Dao;
import db.store_member.Store_member_DBBean;
import db.store_member.Store_member_Dao;
import db.review.Review_Dao;
import db.review.Review_DBBean;;

@Configuration
public class CreateBean {

	@Bean
	public Admin_Dao admin_member_Dao() {
		return new Admin_member_DBBean();
	}	

	@Bean
	public Store_member_Dao store_member_Dao() {
		return new Store_member_DBBean();
	}	
	
	
	@Bean
	public Customer_member_Dao customer_member_Dao() {
		return new Customer_member_DBBean();
	}
	
	@Bean
	public Menu_Dao menu_Dao() {
		return new Menu_DBBean();
	}
	
	@Bean
	public Review_Dao review_Dao() {
		return new Review_DBBean();
	}
	
	@Bean
	public Order_history_Dao order_history_Dao() {
		return new Order_history_DBBean();
	}
	
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass( JstlView.class );
		viewResolver.setPrefix( "/" );
		viewResolver.setSuffix( ".jsp" );
		return viewResolver;
	}	
}
