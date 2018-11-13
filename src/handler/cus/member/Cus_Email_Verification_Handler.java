package handler.cus.member;

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
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Email_Verification_Handler implements CommandHandler{
	@Resource
	private Customer_member_Dao cusMemberDao;
	
	@Override
	@RequestMapping("cus_email_verification")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String email=request.getParameter("email");
		String authNum="";
		int result = cusMemberDao.EmailCheck(email);
		
		request.setAttribute("result", result);
		request.setAttribute("email", email);
		authNum=RandomNum();
		
		try {
			sendEmail(email.toString(),authNum);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/cus/cus_member/cus_email_verification");
		mv.addObject("email",email);
		mv.addObject("authNum",authNum);
		
		return mv;
		
	}

	private String RandomNum() {
		StringBuffer buffer=new StringBuffer();
		for(int i=0;i<=6;i++) {
			int n=(int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}

			private void sendEmail(String email, String authNum) throws MessagingException {
			
				String host="smtp.gmail.com"; // smtp 서버
				String subject="무한상사 인증번호 전달";
				String fromName="무한상사 관리자";
				String from="jsboy0718@gmail.com";//보내는 메일
				String to1=email;
				String content="인증번호["+authNum+"]";
				
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
					msg.setSentDate(new java.util.Date());//보내는 날자 설정
					msg.setContent(content,"text/html;charset=euc-kr");//내용설정(HTML형식)
					
					Transport.send(msg);//메일보내기
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
}
