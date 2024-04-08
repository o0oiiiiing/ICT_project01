package com.ict.forest.kch.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.SessionUser;
import com.ict.forest.kch.dao.KchVO;
import com.ict.forest.kch.service.KchService;
import com.ict.forest.kch.service.MailService;

@Controller
public class EmailController {

	@Autowired
	private MailService mailService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired KchService kchService;
	
	@PostMapping("find_user_pw")
	public ModelAndView findUserPW(String user_id, String email_pwd, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView();
			System.out.println("1111"+user_id);
			KchVO kvo = kchService.kchfindpw(user_id);
			System.out.println(kvo);
			if (kvo != null && (email_pwd.equals(kvo.getUser_f_email() + "@" + kvo.getUser_b_email()))) {
				Random random = new Random();
				String randomNumber = String.valueOf(random.nextInt(1000000) % 1000000);
            	if(randomNumber.length() < 6) {
            		int substract = 6 - randomNumber.length();
            		StringBuffer sb = new StringBuffer();
            		for(int i=0; i<substract; i++) {
            			sb.append("0");
	                }
	                sb.append(randomNumber);
	                randomNumber = sb.toString();
	            }
	            System.out.println("임시번호 : " + randomNumber);
	            
	            // 임시번호를 DB에 저장 해야 한다. 
	            
	            String pwd = passwordEncoder.encode(randomNumber);
	    		kvo.setUser_pwd(pwd);
	    		kvo.setUser_idx(kvo.getUser_idx());	    	
	    		
	    		int result = kchService.npwdUpdate(kvo);
	    		System.out.println(result);
	    		if(result>0) {
	    			
	    			// 사용자메일에 임시번호 보내기 => service 가필요함 + handler
	    		mailService.sendEmail(randomNumber, email_pwd);
	    			
	    		return new ModelAndView("kch-view/pwdconfirm");
	    		}
	            
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("pdh-view/error");
	}
}

















