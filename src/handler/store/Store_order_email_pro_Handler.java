package handler.store;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;

import db.customer_member.Customer_member_Dao;
import db.customer_member.Customer_member_DataBean;
import db.order_history.Order_history_Dao;
import db.order_history.Order_history_DataBean_for_store2;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Store_order_email_pro_Handler implements CommandHandler{
	@Resource
	private Order_history_Dao order_history_dao;
	@Resource
	private Customer_member_Dao customer_member_dao;
	
	@Override
	@RequestMapping("Store_order_email_pro")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int order_no = Integer.parseInt(request.getParameter("order_no"));
		String cus_nickname = null;
		String cus_email = null;
		String cus_address = null;
		String cus_address2 = null;
		String cus_tel = null;
		
		List<Customer_member_DataBean> cusinfolist = customer_member_dao.selectCusInfoforEmail(order_no);
		
		for( int i=0; i<cusinfolist.size(); i++ ) {
			cus_nickname = cusinfolist.get(i).getCus_nickname();
			cus_email = cusinfolist.get(i).getCus_email();
			cus_address = cusinfolist.get(i).getCus_address();
			cus_address2 = cusinfolist.get(i).getCus_address2();
			cus_tel = cusinfolist.get(i).getCus_tel();	
		}
		
		List<Order_history_DataBean_for_store2> cusorderdetails 
			= order_history_dao.selectDetailedOrdersByCuslist(order_no);
		
		try {
			sendEmail( order_no, cus_nickname, cus_email, cus_address, cus_address2, cus_tel, cusorderdetails );
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//sms
		request.setAttribute("action", "go");//그냥 go를 해야 문자가 보내짐
		request.setAttribute("msg", "주문이 접수됐습니다.");//문자 내용
		request.setAttribute("rphone", cus_tel);//받는 사람 전화번호
		
//		String testCheck = "Y";//진짜 문자 보내면 안쓰고, 시험용 문자는 Y
//		String testCheck = "";//진짜 문자 보내면 안쓰고, 시험용 문자는 Y
		
//		request.setAttribute("testflag", testCheck);//진짜 문자 보내면 안쓰고, 시험용 문자는 Y
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/store/store_sms_process");
		
		return mv;
		
	}
	
	private void sendEmail( int order_no, String cus_nickname, String cus_email, String cus_address, 
			String cus_address2, String cus_tel, List<Order_history_DataBean_for_store2>cusorderdetails ) throws MessagingException {
	
		String host = "smtp.gmail.com"; // smtp 서버
		String subject = cus_nickname + " 님의  주문내역을 보내드립니다!";
		String fromName = "무한상사 관리자";
		String from = "sophiechoi8839@gmail.com";//보내는 메일
		String to1 = cus_email;
		
		String emailContentForOrder = "";
		int sum = 0;
		
		for(int i=0; i<cusorderdetails.size(); i++ ) {
			sum += cusorderdetails.get(i).getOrder_qnt()*cusorderdetails.get(i).getMenu_price();
			emailContentForOrder += cusorderdetails.get(i).getMenu_name() + " : " + cusorderdetails.get(i).getOrder_qnt() + "개 <br>"; 			
		}
		
		emailContentForOrder += "총 가격 : " + sum + "원 ";
		
		String content = cus_nickname + " 님 주문내역" + "<br>" +
						"주문 번호 : " + order_no  + "<br>" +
						"배달지 주소 : " + cus_address + " " +cus_address2 + "<br>" +
						"주문 상세 내역 : " + emailContentForOrder + "<br>" +
						"도착 전에 하기 전화 번호로 연락 드리도록 하겠습니다! " + "<br>" +
						cus_tel;
		
	try {
			Properties props=new Properties();
			//G-mail사용시
			props.put("mail.smtp.starttls.enable","true");
			props.put("mail.transport.protocol","smtp");
			props.put("mail.smtp.host",host);
			props.setProperty("mail.smtp.socketFactory.class",
					"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port","465");
			props.put("mail.smtp.user",from);
			props.put("mail.smtp.auth","true");
			
			Session mailSession =Session.getInstance(props,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication("jsboy0718@gmail.com", "whrldy!@87");
						}
				});
			Message msg=new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B")));//보내는 사람 설정
			
			InternetAddress[] address1= {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO,address1);//받는사람설정1
			msg.setSubject(subject);//제목설정
			msg.setSentDate(new java.util.Date());//보내는 날자 설정
			msg.setContent(content,"text/html;charset=euc-kr");//내용설정(HTML형식)
			
			Transport.send(msg);//메일보내기
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
