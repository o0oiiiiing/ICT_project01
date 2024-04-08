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
			
			sendMail.setSubject("[FOREST ���� �����Դϴ�.]");
			
			sendMail.setText("<table><tbody>"
					+ "<tr><td><h2>ICT EDU ���� ����</h2></td></tr>"
					+ "<tr><td><h3>ICT EDU</h3></td></tr>"
					+ "<tr><td><font size='5px'>������ȣ �ȳ��Դϴ�</font></td></tr>"
					+ "<tr><td><font size='8px'>Ȯ�ι�ȣ : "+randomNumber +"</font></td></tr>"
					+ "</tbody></table>");
			
			sendMail.setFrom("Forest", "forest");
			
			sendMail.setTo(toMail);
			
			sendMail.send();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
