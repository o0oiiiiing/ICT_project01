package com.ict.forest.kch.service;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {

	private JavaMailSender mailSender;
	
	private MimeMessage message;
	
	private MimeMessageHelper messageHelper;
	
	public MailHandler(JavaMailSender mailSender) throws Exception {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	
	
	}
	
	public void setSubject(String subject) throws Exception{
		messageHelper.setSubject(subject);
	}
	
	public void setText(String text) throws Exception{
		messageHelper.setText(text, true);
	}
	
	public void setFrom(String email_pwd, String name) throws Exception{
		messageHelper.setFrom(email_pwd, name);
	}
	public void setFrom1(String email_id, String name) throws Exception{
		messageHelper.setFrom(email_id, name);
	}
	public void setTo(String email_pwd) throws Exception{
		messageHelper.setTo(email_pwd);
	}
	public void setTo1(String email_id) throws Exception{
		messageHelper.setTo(email_id);
	}
	
	public void send() {
		mailSender.send(message);
	}
	
}














