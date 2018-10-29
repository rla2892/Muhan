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
import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;
import db.customer_member.Customer_member_Dao;
import db.customer_member.Customer_member_DataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class Cus_Find_pw_Handler implements CommandHandler{
	@Resource
		private Customer_member_Dao member_dto;
	
	
	@Override
	@RequestMapping("/cus_find_pw")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		Customer_member_DataBean member_db=new Customer_member_DataBean();
		
		String cus_id=request.getParameter("search_id");
		String email=request.getParameter("search_email");
		String findids=member_dto.find_id(request.getParameter("search_email"));
		String findEmails=member_dto.find_email(request.getParameter("search_email"));
		
		
		System.out.println(cus_id);
		System.out.println(email);
		System.out.println(findids);
		System.out.println(findEmails);
			
		if((cus_id =="") || (email == "") || ( ! cus_id.equals(findids)) && (! email.equals(findEmails)) ){
			out.printf("<script>alert('이메일을 다시 써주세요')</script>");
			System.out.print("널 입력값이 출력");
			out.flush();
			
			return null;
		}else {
			
			char pwCollection[] = new char[] { 
	                '1','2','3','4','5','6','7','8','9','0', 
	                'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', 
	                'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', 
	                '!','@','#','$','%','^','&','*','(',')'};
			  
			  	String ranPw="";
			
				for(int i=0;i<7;i++){
					
					int selectRandomPw=(int)(Math.random()*(pwCollection.length));
					ranPw+=pwCollection[selectRandomPw];
				}
				
				System.out.println(ranPw);
				String ranpw=ranPw;
				member_db.setCus_pw(ranpw);
				member_db.setCus_id(cus_id);
				System.out.println(member_db.getCus_pw());
				int result=member_dto.update_pw(member_db);
				
				
				if(result >=1) 
						sendEmail(email.toString(),cus_id,member_db);
					
					
					ModelAndView mv=new ModelAndView();
					mv.setViewName("/cus/cus_member/cus_find_pw");
					mv.addObject("email",email);
					
					mv.addObject("cus_id",cus_id);
					
					return mv;
				
				}
	
	}
	
	private void sendEmail(String email, String cus_id ,Customer_member_DataBean member_db ) {
		String host="smtp.gmail.com"; // smtp 서버
		String subject="무한상사 비밀번호 전달";
		String fromName="무한상사 관리자";
		String from="jsboy0718@gmail.com";//보내는 메일
		String to1=email;
		String content=cus_id+"님 임시비밀번호["+member_db.getCus_pw()+"]입니다.로그인해서 변경하세요";
		
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
			msg.setSentDate(new java.util.Date());//보내는 날짜 설정
			msg.setContent(content,"text/html;charset=euc-kr");//내용설정(HTML형식)
			
			Transport.send(msg);//메일보내기
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
		
	
			
}
