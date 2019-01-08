package handler.cus.member;



import java.io.IOException;
import java.io.PrintWriter;
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

import com.sun.mail.iap.Response;
import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;

import db.customer_member.Customer_member_Dao;
import db.customer_member.Customer_member_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Find_id_Handler implements CommandHandler {
	@Resource
	private Customer_member_Dao memberDto;
	@Override
	@RequestMapping("/cus_find_id")
	
	
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException{
		
		
		String cus_email=request.getParameter("cus_email");
		String cus_id=memberDto.find_id(request.getParameter("cus_email"));
		String findEmail=memberDto.find_email(request.getParameter("cus_email"));
		System.out.println(cus_email);
		System.out.println(cus_id);
		System.out.println(findEmail);
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if((cus_email=="")||(!cus_email.equals(findEmail))){
			out.printf("<script>alert('이메일을 다시 써주세요')</script>");
			/*System.out.print("널 입력값이 출력");*/
			out.flush();
		
			return null;
		}else{
			try {
				sendEmail(cus_email,cus_id);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			ModelAndView mv=new ModelAndView();
			mv.setViewName("/cus/cus_member/cus_find_id");
			mv.addObject("email",cus_email);
			mv.addObject("cus_id",cus_id);
			
			return mv;
			
		}
		
		
	}
		


private void sendEmail(String cus_email, String cus_id) throws MessagingException {
	
	String host="smtp.gmail.com"; // smtp 서버
	String subject="무한상사 :아이디 입니다";
	String fromName="무한상사 관리자";
	String from="test1sangjin@gmail.com";//보내는 메일
	String to1=cus_email;
	String content="아이디는["+cus_id+"]입니다";
	
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
						return new PasswordAuthentication("test1sangjin@gmail.com", "987654asd@");
					}
			
				}); 
		Message msg=new MimeMessage(mailSession);
		msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B")));//보내는 사람 설정
		
		InternetAddress[] address1= {new InternetAddress(to1)};
		msg.setRecipients(Message.RecipientType.TO,address1);//받는사람설정1
		msg.setSubject(subject);//제목설정
		msg.setSentDate(new java.util.Date());//보내는 날짜 설정
		msg.setContent(content,"text/html;charset=euc-kr");//내용설정(HTML형식)
		
		Transport.send(msg);//메일보내기
		
	}catch(Exception e) {
		e.printStackTrace();
	}

	}

}
