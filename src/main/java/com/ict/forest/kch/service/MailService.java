package com.ict.forest.kch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmail(String randomNumber, String toMail) {
		try {
			MailHandler sendMail = new MailHandler(mailSender);
			
			sendMail.setSubject("[FOREST 인증 메일입니다.]");
			
			sendMail.setText("<table><tbody>"
					+ "<tr><td><h2>ICT EDU 메일 인증</h2></td></tr>"
					+ "<tr><td><h3>ICT EDU</h3></td></tr>"
					+ "<tr><td><font size='5px'>임시 비밀번호 안내입니다</font></td></tr>"
					+ "<tr><td><font size='8px'>임시 비밀번호 : "+randomNumber +"</font></td></tr>"
					+ "</tbody></table>");
			
			sendMail.setFrom("Forest", "forest");
			
			sendMail.setTo(toMail);
			
			sendMail.send();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
	
	
	
	public void sendIDEmail(String userId, String toMail) {
		try {
			MailHandler sendMail = new MailHandler(mailSender);
			
			sendMail.setSubject("[FOREST 인증 메일입니다.]");
			
			sendMail.setText("<table><tbody>"
					+ "<tr><td><h2>ICT EDU 메일 인증</h2></td></tr>"
					+ "<tr><td><h3>ICT EDU</h3></td></tr>"
					+ "<tr><td><font size='5px'>아이디 안내입니다</font></td></tr>"
					+ "<tr><td><font size='8px'>아이디 : "+userId +"</font></td></tr>"
					+ "</tbody></table>");
			
			sendMail.setFrom1("Forest", "forest");
			
			sendMail.setTo1(toMail);
			
			sendMail.send();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
}



















